package com.ssafy.vinopener.domain.aichat.service;

import com.fasterxml.jackson.core.JacksonException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssafy.vinopener.domain.aichat.data.dto.AiChatCreateAiMessageInfo;
import com.ssafy.vinopener.domain.aichat.data.dto.AiChatCreateUserMessageInfo;
import com.ssafy.vinopener.domain.aichat.data.dto.AiChatCreateUserMessageInfo.AiChatCreateUserMessageInfoState;
import com.ssafy.vinopener.domain.aichat.data.dto.request.AiChatCreateRequest;
import com.ssafy.vinopener.domain.aichat.data.dto.response.AiChatCreateResponse;
import com.ssafy.vinopener.domain.aichat.data.dto.response.AiChatGetListResponse;
import com.ssafy.vinopener.domain.aichat.data.entity.AssistantThreadEntity;
import com.ssafy.vinopener.domain.aichat.data.mapper.AiChatMapper;
import com.ssafy.vinopener.domain.aichat.repository.AiChatRepository;
import com.ssafy.vinopener.domain.aichat.repository.AssistantThreadRepository;
import com.ssafy.vinopener.domain.tastingnote.data.entity.ColorEntity;
import com.ssafy.vinopener.domain.tastingnote.exception.TastingNoteErrorCode;
import com.ssafy.vinopener.domain.tastingnote.repository.ColorRepository;
import com.ssafy.vinopener.domain.wine.data.entity.FlavourTasteEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.exception.WineErrorCode;
import com.ssafy.vinopener.domain.wine.repository.FlavourTasteRepository;
import com.ssafy.vinopener.domain.wine.repository.WineRepository;
import com.ssafy.vinopener.global.aiassistant.AssistantStream;
import com.ssafy.vinopener.global.exception.VinopenerException;
import io.github.sashirestela.openai.SimpleOpenAI;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

class BigDecimalDeserializer extends JsonDeserializer<BigDecimal> {

    @Override
    public BigDecimal deserialize(JsonParser jsonParser, DeserializationContext deserializationContext)
            throws IOException, JacksonException {
        String value = jsonParser.getText();
        if (value == null || value.isEmpty()) {
            return null;
        }
        return new BigDecimal(value);
    }

}

@Service
@RequiredArgsConstructor
@Slf4j
public class AiChatService {

    private final AiChatRepository aiChatRepository;
    private final AiChatMapper aiChatMapper;
    private final SimpleOpenAI openAI;
    private final ObjectMapper jsonMapper;

//    private final ObjectMapper jsonMapper = new ObjectMapper().configOverride(BigDecimal.class).setFormat(JsonFormat.Value.forShape(JsonFormat.Shape.STRING));;

    private final WineRepository wineRepository;
    private final ColorRepository colorRepository;
    private final FlavourTasteRepository flavourTasteRepository;

    private final AssistantStream assistantStream;
    private final AssistantThreadRepository assistantThreadRepository;

    /**
     * AI채팅 생성 및 답변
     *
     * @param aiChatCreateRequest AI채팅 생성 요청
     * @param userId              유저 ID
     * @return AI채팅 답변
     */
    @SneakyThrows
    public AiChatCreateResponse create(
            final AiChatCreateRequest aiChatCreateRequest,
            final Long userId
    ) {
        //responseState;
        final var requestState = aiChatCreateRequest.state();

        final AiChatCreateUserMessageInfo userMessageInfo = AiChatCreateUserMessageInfo.builder()
                .tastingNoteCreated(requestState.tastingNoteId() != null)
                .wine(wineRepository.findById(requestState.wineId())
                        .map(WineEntity::getName)
                        .orElseThrow(() -> new VinopenerException(WineErrorCode.WINE_NOT_FOUND)))
                .currentState(AiChatCreateUserMessageInfoState.builder()
                        .color(colorRepository.findById(requestState.colorId())
                                .map(ColorEntity::getName)
                                .orElseThrow(() -> new VinopenerException(TastingNoteErrorCode.COLOR_NOT_FOUND)))
                        .flavours(flavourTasteRepository.findAllByIdIn(requestState.flavourTasteIds()).stream()
                                .map(FlavourTasteEntity::getName)
                                .toList())
                        .sweetness(new BigDecimal(String.valueOf(requestState.sweetness())))
                        .intensity(new BigDecimal(String.valueOf(requestState.intensity())))
                        .acidity(new BigDecimal(String.valueOf(requestState.acidity())))
                        .alcohol(new BigDecimal(String.valueOf(requestState.alcohol())))
                        .tannin(new BigDecimal(String.valueOf(requestState.tannin())))
                        .opinion(requestState.opinion())
                        .rating(new BigDecimal(String.valueOf(requestState.rating())))
                        .build())
                .message(aiChatCreateRequest.message())
                .build();

        final String userMessageJson = jsonMapper.writeValueAsString(userMessageInfo);
        AssistantThreadEntity assistantThreadEntity
                = assistantThreadRepository.findByUserId(userId).orElse(null);

        String threadId;
        if (assistantThreadEntity == null) {
            assistantStream.prepareConversation(userId);
            assistantThreadEntity = assistantThreadRepository.findByUserId(userId).orElse(null);
        }

        assert assistantThreadEntity != null;
        threadId = assistantThreadEntity.getThreadId();
        String result = assistantStream.runConversation(userMessageJson, threadId);
        final var aiMessageInfo = jsonMapper.readValue(result,
                AiChatCreateAiMessageInfo.class);

        final var color = colorRepository.findByName(aiMessageInfo.newState().color())
                .orElseThrow(() -> new VinopenerException(TastingNoteErrorCode.COLOR_NOT_FOUND));
        final var flavours = flavourTasteRepository.findAllByNameIn(aiMessageInfo.newState().flavours());

        aiChatRepository.save(aiChatMapper.toEntity(aiChatCreateRequest, userId));
        final var aiChat = aiChatRepository.save(aiChatMapper.toEntity(aiMessageInfo, userId));

        final var responseState = aiChatMapper.toCreateResponseState(aiMessageInfo.newState(), color, flavours);

        return aiChatMapper.toCreateResponse(aiChat, aiMessageInfo.section(), responseState);

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
