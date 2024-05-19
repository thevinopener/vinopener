package com.ssafy.vinopener.global.aiassistant;

import com.ssafy.vinopener.domain.aichat.data.entity.AssistantThreadEntity;
import com.ssafy.vinopener.domain.aichat.repository.AiChatRepository;
import com.ssafy.vinopener.domain.aichat.service.AiChatSaveService;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.global.config.props.OpenAiProps;
import io.github.sashirestela.cleverclient.Event;
import io.github.sashirestela.openai.SimpleOpenAI;
import io.github.sashirestela.openai.common.content.ContentPart.ContentPartTextAnnotation;
import io.github.sashirestela.openai.common.function.FunctionDef;
import io.github.sashirestela.openai.common.function.FunctionExecutor;
import io.github.sashirestela.openai.common.function.Functional;
import io.github.sashirestela.openai.domain.assistant.ThreadMessage;
import io.github.sashirestela.openai.domain.assistant.ThreadMessageRequest;
import io.github.sashirestela.openai.domain.assistant.ThreadMessageRole;
import io.github.sashirestela.openai.domain.assistant.ThreadRequest;
import io.github.sashirestela.openai.domain.assistant.ThreadRun;
import io.github.sashirestela.openai.domain.assistant.ThreadRun.RunStatus;
import io.github.sashirestela.openai.domain.assistant.ThreadRunRequest;
import io.github.sashirestela.openai.domain.assistant.ThreadRunSubmitOutputRequest;
import io.github.sashirestela.openai.domain.assistant.ThreadRunSubmitOutputRequest.ToolOutput;
import io.github.sashirestela.openai.domain.assistant.events.EventName;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class AssistantStream {

    private final SimpleOpenAI openAI;
    private final AiChatRepository aiChatRepository;
    private final AiChatSaveService aiChatSaveService;
    private final UserRepository userRepository;
    private final OpenAiProps openAiProps;
    private String fileId;
    private String vectorStoreId;
    private FunctionExecutor functionExecutor;
    private final String assistantId = "asst_2AUC8Wqp4xQYvNrdC05e1jfq";
    private String threadId;
    private String resultString;
    private volatile boolean shouldStop = false;

    public AssistantStream(
//            @Value("${openai.api-key}") String apiKey,
//            @Value("${openai.organization-id}") String organizationId,
//            @Value("${openai.project-id}") String projectId,
            AiChatRepository aiChatRepository,
            AiChatSaveService aiChatSaveService,
            UserRepository userRepository, OpenAiProps openAiProps) {
        this.openAiProps = openAiProps;
        openAI = SimpleOpenAI.builder()
                .apiKey(openAiProps.apiKey())
                .organizationId(openAiProps.organizationId())
                .projectId(openAiProps.projectId())
                .build();
        this.aiChatRepository = aiChatRepository;
        this.aiChatSaveService = aiChatSaveService;
        this.userRepository = userRepository;
        List<FunctionDef> functionList = new ArrayList<>();
        functionList.add(FunctionDef.builder()
                .name("response")
                .description("vinopener-get response")
                .functionalClass(VinopenerResponse.class)
                .build());
        this.functionExecutor = new FunctionExecutor();
        this.functionExecutor.enrollFunctions(functionList);
    }

    public void prepareConversation(Long userId) {

        var thread = openAI.threads().create(ThreadRequest.builder().build()).join();
        threadId = thread.getId();
        UserEntity user = userRepository.findById(userId).orElse(null);
        if (user == null) {
            return;
        }

        AssistantThreadEntity assistantThreadEntity = AssistantThreadEntity.builder()
                .user(user)
                .threadId(threadId)
                .build();

        aiChatSaveService.saveThreadId(assistantThreadEntity);
    }

    public String runConversation(String userMessageJson, String threadId) {
        openAI.threadMessages()
                .create(threadId, ThreadMessageRequest.builder()
                        .role(ThreadMessageRole.USER)
                        .content(userMessageJson)
                        .build())
                .join();

        ThreadRunRequest runRequest = ThreadRunRequest.builder()
                .assistantId(assistantId)
                .build();

        var runStream = openAI.threadRuns()
                .createStream(threadId, runRequest)
                .join();

        shouldStop = false;
        handleRunEvents(runStream, threadId);

        return resultString != null ? resultString : "";
    }

    private void handleRunEvents(Stream<Event> runStream, String threadId) {
        runStream.forEach(event -> {
            if (shouldStop) {
                return;
            }

            switch (event.getName()) {
                case EventName.THREAD_RUN_CREATED:
                case EventName.THREAD_RUN_COMPLETED:
                case EventName.THREAD_RUN_REQUIRES_ACTION:
                    var run = (ThreadRun) event.getData();
                    if (run.getStatus().equals(RunStatus.REQUIRES_ACTION)) {
                        var toolCalls = run.getRequiredAction().getSubmitToolOutputs().getToolCalls();
                        var toolOutputs = functionExecutor.executeAll(toolCalls, (toolCallId, result) ->
                                ToolOutput.builder().toolCallId(toolCallId).output(result).build());

                        var runSubmitToolStream = openAI.threadRuns()
                                .submitToolOutputStream(threadId, run.getId(), ThreadRunSubmitOutputRequest.builder()
                                        .toolOutputs(toolOutputs)
                                        .stream(true)
                                        .build())
                                .join();
                        handleRunEvents(runSubmitToolStream, threadId);
                    }
                    break;

                case EventName.THREAD_MESSAGE_DELTA:
//                    var msgDelta = (ThreadMessageDelta) event.getData();
//                    var contentDelta = msgDelta.getDelta().getContent().get(0);
//                    if (contentDelta instanceof ContentPartTextAnnotation) {
//                        var textContentDelta = (ContentPartTextAnnotation) contentDelta;
//                        log.info("THREAD_MESSAGE_DELTA :: text : {}", textContentDelta.getText().getValue());
//                    }
                    break;

                case EventName.THREAD_MESSAGE_COMPLETED:
                    var msgCompleted = (ThreadMessage) event.getData();
                    var contentCompleted = msgCompleted.getContent().get(0);

                    if (contentCompleted instanceof ContentPartTextAnnotation) {
                        var textContentCompleted = (ContentPartTextAnnotation) contentCompleted;
                        resultString = textContentCompleted.getText().getValue();
                    }
                    // 루프 종료 플래그 설정
                    shouldStop = true;
                    return;

                default:
                    break;
            }
        });
    }

    public void cleanConversation(String threadId) {
//        var deletedFile = openAI.files().delete(fileId).join();
//        var deletedVectorStore = openAI.vectorStores().delete(vectorStoreId).join();
//        var deletedAssistant = openAI.assistants().delete(assistantId).join();
        var deletedThread = openAI.threads().delete(threadId).join();

//        System.out.println("File was deleted: " + deletedFile.getDeleted());
//        System.out.println("Vector Store was deleted: " + deletedVectorStore.getDeleted());
//        System.out.println("Assistant was deleted: " + deletedAssistant.getDeleted());
//        System.out.println("Thread was deleted: " + deletedThread.getDeleted());
        log.info("cleanConversation executed");
    }

    public static class VinopenerResponse implements Functional {

        @Override
        public Object execute() {
            return true;
        }

    }

}
