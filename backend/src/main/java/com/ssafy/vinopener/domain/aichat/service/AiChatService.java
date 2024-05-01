package com.ssafy.vinopener.domain.aichat.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssafy.vinopener.domain.aichat.data.dto.AiChatCreateAiMessageInfo;
import com.ssafy.vinopener.domain.aichat.data.dto.AiChatCreateUserMessageInfo.AiChatCreateUserMessageInfoState;
import com.ssafy.vinopener.domain.aichat.data.dto.request.AiChatCreateRequest;
import com.ssafy.vinopener.domain.aichat.data.dto.response.AiChatCreateResponse;
import com.ssafy.vinopener.domain.aichat.data.dto.response.AiChatGetListResponse;
import com.ssafy.vinopener.domain.aichat.data.mapper.AiChatMapper;
import com.ssafy.vinopener.domain.aichat.repository.AiChatRepository;
import com.ssafy.vinopener.domain.tastingnote.data.entity.ColorEntity;
import com.ssafy.vinopener.domain.tastingnote.exception.TastingNoteErrorCode;
import com.ssafy.vinopener.domain.tastingnote.repository.ColorRepository;
import com.ssafy.vinopener.domain.wine.data.entity.FlavourTypeEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.exception.WineErrorCode;
import com.ssafy.vinopener.domain.wine.repository.FlavourTasteRepository;
import com.ssafy.vinopener.domain.wine.repository.WineRepository;
import com.ssafy.vinopener.global.exception.VinopenerException;
import io.github.sashirestela.openai.SimpleOpenAI;
import io.github.sashirestela.openai.domain.chat.ChatRequest;
import io.github.sashirestela.openai.domain.chat.message.ChatMsgSystem;
import io.github.sashirestela.openai.domain.chat.message.ChatMsgUser;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AiChatService {

    private final AiChatRepository aiChatRepository;
    private final AiChatMapper aiChatMapper;
    private final SimpleOpenAI openAI;
    private final ObjectMapper jsonMapper;

    private final WineRepository wineRepository;
    private final ColorRepository colorRepository;
    private final FlavourTasteRepository flavourTasteRepository;

    /**
     * AI채팅 생성 및 답변
     *
     * @param aiChatCreateRequest AI채팅 생성 요청
     * @param userId              유저 ID
     * @return AI채팅 답변
     */
    @Transactional
    @SneakyThrows
    public AiChatCreateResponse create(
            final AiChatCreateRequest aiChatCreateRequest,
            final Long userId
    ) {
        final var requestState = aiChatCreateRequest.state();
        final var infoState = AiChatCreateUserMessageInfoState.builder()
                .created(requestState.tastingNoteId() != null)
                .wineName(wineRepository.findById(requestState.wineId())
                        .map(WineEntity::getName)
                        .orElseThrow(() -> new VinopenerException(WineErrorCode.WINE_NOT_FOUND)))
                .colorName(colorRepository.findById(requestState.colorId())
                        .map(ColorEntity::getName)
                        .orElseThrow(() -> new VinopenerException(TastingNoteErrorCode.COLOR_NOT_FOUND)))
                .flavourTasteNames(flavourTasteRepository.findAllByIdIn(requestState.flavourTasteIds()).stream()
                        .map(FlavourTypeEntity::getName)
                        .toList())
                .build();
        final var userMessageInfo = aiChatMapper.toInfo(aiChatCreateRequest, infoState);
        final var userMessageJson = jsonMapper.writeValueAsString(userMessageInfo);

        final var chatRequest = ChatRequest.builder()
                .model("gpt-3.5-turbo")
                .messages(List.of(
                        new ChatMsgSystem("당신은 Vinopener 앱에 내장된 AI 챗봇 비노비(Vinoby)입니다. "
                                + "당신은 앱 사용자의 테이스팅노트 작성을 돕기 위한 목적으로 채팅 메시지에 답변합니다."),
                        new ChatMsgUser(userMessageJson)))
                .temperature(0.0)
                .maxTokens(300)
                .build();
        final var aiMessageJson = openAI.chatCompletions().create(chatRequest).join().firstContent();
        final var aiMessageInfo = jsonMapper.readValue(aiMessageJson, AiChatCreateAiMessageInfo.class);

        aiChatRepository.save(aiChatMapper.toEntity(aiChatCreateRequest, userId));
        final var aiChat = aiChatRepository.save(aiChatMapper.toEntity(aiMessageInfo, userId));
        return aiChatMapper.toCreateResponse(aiChat, aiMessageInfo.command());
    }

    /**
     * AI채팅 목록 조회
     *
     * @param userId 유저 ID
     * @return AI채팅 목록
     */
    @Transactional(readOnly = true)
    public List<AiChatGetListResponse> getList(
            final Long userId
    ) {
        return aiChatRepository.findAllByUserId(userId).stream()
                .map(aiChatMapper::toGetListResponse)
                .toList();
    }

    /**
     * AI채팅 초기화
     *
     * @param userId 유저 ID
     */
    @Transactional
    public void clear(Long userId) {
        aiChatRepository.deleteAllByUserId(userId);
    }

}
