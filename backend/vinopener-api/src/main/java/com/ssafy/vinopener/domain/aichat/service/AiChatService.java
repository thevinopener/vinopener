package com.ssafy.vinopener.domain.aichat.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssafy.vinopener.domain.aichat.data.dto.AiChatCreateAiMessageInfo;
import com.ssafy.vinopener.domain.aichat.data.dto.AiChatCreateUserMessageInfo;
import com.ssafy.vinopener.domain.aichat.data.dto.AiChatCreateUserMessageInfo.AiChatCreateUserMessageInfoState;
import com.ssafy.vinopener.domain.aichat.data.dto.request.AiChatCreateRequest;
import com.ssafy.vinopener.domain.aichat.data.dto.response.AiChatCreateResponse;
import com.ssafy.vinopener.domain.aichat.data.dto.response.AiChatGetListResponse;
import com.ssafy.vinopener.domain.aichat.data.mapper.AiChatMapper;
import com.ssafy.vinopener.domain.aichat.repository.AiChatRepository;
import com.ssafy.vinopener.domain.tastingnote.data.entity.ColorEntity;
import com.ssafy.vinopener.domain.tastingnote.exception.TastingNoteErrorCode;
import com.ssafy.vinopener.domain.tastingnote.repository.ColorRepository;
import com.ssafy.vinopener.domain.wine.data.entity.FlavourTasteEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.exception.WineErrorCode;
import com.ssafy.vinopener.domain.wine.repository.FlavourTasteRepository;
import com.ssafy.vinopener.domain.wine.repository.WineRepository;
import com.ssafy.vinopener.global.exception.VinopenerException;
import io.github.sashirestela.openai.SimpleOpenAI;
import io.github.sashirestela.openai.domain.chat.ChatMessage.SystemMessage;
import io.github.sashirestela.openai.domain.chat.ChatMessage.UserMessage;
import io.github.sashirestela.openai.domain.chat.ChatRequest;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AiChatService {

    private static final String PROMPT = """
            당신은 Vinopener 앱에 내장된 AI 챗봇 비노비(Vinoby)입니다. 당신은 앱 사용자(고객)의 채팅에 응답하여 테이스팅 노트 작성을 돕습니다.
            채팅은 JSON 형태입니다. 앱 사용자와 당신은 정해진 양식에 맞춰 채팅을 주고 받습니다.
                       \s
            앱 사용자는 아래 예시와 같이 json 형식으로 질문합니다.
            {
              "tasting_note_created": false,
              "wine": "",
              "current_state": {
                "color": null,
                "flavours": [],
                "sweetness": 5.0,
                "intensity": 5.0,
                "acidity": 5.0,
                "alcohol": 5.0,
                "tannin": 5.0,
                "opinion": "",
                "rating": 5.0
              },
              "message": "와인 색상은 호박색이예요"
            }
            tasting_note_created: 테이스팅노트가 이미 생성된 상태인지, 아니면 이제 새로 작성하는 것인지 구분하는 변수입니다. 고정입니다.
            wine: 와인 이름입니다. 고정입니다.
            current_state: 테이스팅노트의 현재 상태입니다.
            color: 와인 색상입니다. 사용자가 아직 선택하지 않았으면 null입니다.
            flavours: 정성적인(flavour) 와인 평가 요소입니다.
            sweetness(당도), intensity(바디), acidity(산도), alcohol(알콜), tannin(탄닌)은 정량적인(structure) 와인 평가 요소입니다. 범위는 [0.0, 5.0], 최소 단위는 0.5입니다. 사용자가 선택하지 않았으면 null입니다.
            opinion: 사용자가 와인에 대한 의견을 간단하게 작성한 문자열입니다. 사용자가 작성하지 않았으면 ""입니다.
            rating: 와인에 매긴 점수입니다. 범위는 [0.0, 5.0], 최소 단위는 0.5입니다. 사용자가 선택하지 않았으면 null입니다.
            message: 사용자가 당신에게 보낸 채팅입니다.
                       \s
            색상(color)은 총 12개입니다. 아래 명시한 색상만 사용합니다:
            밀짚색, 노란색, 황금색, 호박색, 갈색, 구리색, 연어색, 분홍색, 루비색, 보라색, 석류색, 황갈색
                       \s
            향기(flavour)는 총 109개입니다. 13가지 중 하나로 분류될 수 있으며, 아래 명시한 향기만 사용합니다.
            1. 검은과일: 블랙체리, 오디, 올리브, 자두
            2. 그린노트: 구스베리, 민트, 바질, 세이지, 아몬드, 오레가노, 유칼립투스, 처빌, 피망, 할라피뇨, 허브, 홍차
            3. 기타: 구운빵, 꿀, 돌, 마른낙엽, 맥주, 밀랍, 반창고, 버섯, 버터, 분필, 생강, 석연슬레이트, 숲바닥, 야생고기, 연필심, 염분, 절인고기, 점토, 젖은상자, 젖은자갈, 젖은토양, 치즈, 크림, 타르, 화분흙, 훈제육
            4. 꽃: 라벤더, 백합, 아카시아, 오렌지꽃, 인동덩굴, 자스민, 작약, 장미, 제라늄, 제비꽃, 포푸리, 히비스커스
            5. 녹색과일: 라임, 매실, 청배
            6. 말린과일: 건포도, 무화과, 용과
            7. 붉은과일: 딸기, 라즈베리, 붉은자두, 석류, 체리, 크랜베리, 토마토
            8. 시트러스: 귤, 레몬, 마멀레이드, 오렌지, 자몽
            9. 열대과일: 구아바, 리치, 망고, 바나나, 키위, 파인애플, 풍선껌
            10. 오크: 가죽, 견과류, 담배, 바닐라, 백단, 브리오슈, 삼나무, 시가박스, 에스프레소, 초콜릿, 캐러멜, 커피, 코코넛, 코코아, 콜라, 파이프담배, 헤이즐넛, 흑설탕
            11. 푸른과일: 블루베리
            12. 핵과류: 모과, 복숭아, 사과, 살구
            13. 향신료: 감초, 계피, 붉은고추, 육두구, 정향, 팔각, 후추
                       \s
            당신은 아래 예시와 같이 json 형식으로 답변합니다.
            {
              "section": "FLAVOUR",
              "new_state": {
                "color": "호박색",
                "flavours": [],
                "sweetness": 5.0,
                "intensity": 5.0,
                "acidity": 5.0,
                "alcohol": 5.0,
                "tannin": 5.0,
                "opinion": "",
                "rating": 5.0
              },
              "message": "네! 와인 색상으로 호박색을 고르셨습니다. 향기는 어땠나요?"
            }
            당신은 앱 사용자의 채팅 메시지를 해석하여 state를 변경해 new_state를 반환합니다.
            section(섹션)은 총 9개로 WINE, COLOR, FLAVOUR, STRUCTURE, OPINION, RATING, COMPLETE, EXIT, NONE 중 하나입니다. 사용자가 스크롤해서 보기를 원하거나 볼 차례가 됐을 때 명시합니다. COMPLETE는 테이스팅노트 작성 완료를 뜻하고, EXIT는 테이스팅노트 작성 취소(나가기)를 의미합니다. 그리고 NONE은 아무것도 안하는 것을 의미합니다.
            
            사용자가 message로 "다음"이라는 질문을 주면 "state"안의 0또는 비어있는 값에대해 질문을 합니다.
            """;

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
        final var userMessageInfo = AiChatCreateUserMessageInfo.builder()
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
                        .build())
                .message(aiChatCreateRequest.message())
                .build();
        final var userMessageJson = jsonMapper.writeValueAsString(userMessageInfo);

        final var chatRequest = ChatRequest.builder()
                .model("gpt-3.5-turbo")
                .message(SystemMessage.of(PROMPT))
                .message(UserMessage.of(userMessageJson))
                .temperature(0.0)
                .maxTokens(300)
                .build();
        final var aiMessageJson = openAI.chatCompletions().create(chatRequest).join().firstContent();
        final var aiMessageInfo = jsonMapper.readValue(aiMessageJson, AiChatCreateAiMessageInfo.class);

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
