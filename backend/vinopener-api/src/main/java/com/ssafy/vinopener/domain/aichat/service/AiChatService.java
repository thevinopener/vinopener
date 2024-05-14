package com.ssafy.vinopener.domain.aichat.service;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.core.JacksonException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;
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
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
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
public class AiChatService {

    private static final String PROMPT = """
            당신을 고용하겠습니다.
                                                                                                                                                                          [필독사항]
                                                                                                                                                                          ```
                                                                                                                                                                          - role: 전달받은 데이터를 바탕으로 section 순서에 맞추어 new_state를 반환하여 와인 테이스팅 노트 대필작성 보조 업무 수행
                                                                                                                                                                          - work: 전달받은 input JSON을 바탕으로 정해진 return JSON양식대로 필드를 채워 반환하고 1 cycle (=0~9 sectoin) 동안 테이스팅 노트 작성을 완성
                                                                                                                                                                          
                                                                                                                                                                          - input JSON
                                                                                                                                                                          {
                                                                                                                                                                              "tasting_note_created": false,   // 테이스팅 노트 생성여부, 수정 금지
                                                                                                                                                                              "wine": "",   // 와인명, 수정 금지
                                                                                                                                                                              "current_state": {   // 테이스팅 노트의 현재 상태
                                                                                                                                                                                  "color": null,      // 와인 색상
                                                                                                                                                                                  "flavours": [],   // 와인 향기
                                                                                                                                                                                  "sweetness": 0.0,   // 당도
                                                                                                                                                                                  "intensity": 0.0,   // 바디감
                                                                                                                                                                                  "acidity": 0.0,   // 산미
                                                                                                                                                                                  "alcohol": 0.0,   // 알코올감
                                                                                                                                                                                  "tannin": 0.0,   // 타닌
                                                                                                                                                                                  "opinion": "",   // 의견
                                                                                                                                                                                  "rating": 0.0      // 별점
                                                                                                                                                                              },
                                                                                                                                                                              "message": "(사용자의 message)"
                                                                                                                                                                          }
                                                                                                                                                                          
                                                                                                                                                                          - return JSON 예시
                                                                                                                                                                          {
                                                                                                                                                                              "section": "COLOR",
                                                                                                                                                                              "new_state": {
                                                                                                                                                                                  "color": "",
                                                                                                                                                                                  "flavours": [],
                                                                                                                                                                                  "sweetness": 0.0,
                                                                                                                                                                                  "intensity": 0.0,
                                                                                                                                                                                  "acidity": 0.0,
                                                                                                                                                                                  "alcohol": 0.0,
                                                                                                                                                                                  "tannin": 0.0
                                                                                                                                                                                  "opinion": "",
                                                                                                                                                                                  "rating": 0.0
                                                                                                                                                                              },
                                                                                                                                                                              "messsage": "와인은 무슨 색이었나요?"
                                                                                                                                                                          }
                                                                                                                                                                          
                                                                                                                                                                          - section
                                                                                                                                                                             - COLOR   // ["밀짚색", "노란색", "황금색", "호박색", "갈색", "구리색", "연어색", "분홍색", "루비색", "보라색", "석류색", "황갈색"]
                                                                                                                                                                             - FLAVOUR
                                                                                                                                                                             - SWEETNESS   // 0.5 <= SWEETNESS <= 5.0, 최초 0.0
                                                                                                                                                                             - INTENSITY   // 0.5 <= INTENSITY <= 5.0, 최초 0.0
                                                                                                                                                                             - ACIDITY   // 0.5 <= ACIDITY <= 5.0, 최초 0.0
                                                                                                                                                                             - ALCOHOL   // 0.5 <= ALCOHOL <= 5.0, 최초 0.0
                                                                                                                                                                             - TANNIN   // 0.5 <= TANNIN <= 5.0, 최초 0.0
                                                                                                                                                                             - OPINION   // returnMessageList[6]을 반환 후, 돌아온 input JSON의 message를 그대로 작성
                                                                                                                                                                             - RATING   // 0.5 <= RATING <= 5.0, 최초 0.0
                                                                                                                                                                             - COMPLETE   // 작성완료
                                                                                                                                                                             - EXIT      // 나가기
                                                                                                                                                                             - NONE   // 대기
                                                                                                                                                                          
                                                                                                                                                                          - FLAVOUR
                                                                                                                                                                          {
                                                                                                                                                                              "FLAVOUR": [
                                                                                                                                                                                  {
                                                                                                                                                                                      "Category": "검은과일",
                                                                                                                                                                                      "Items": ["블랙체리", "오디", "올리브", "자두"]
                                                                                                                                                                                  },
                                                                                                                                                                                  {
                                                                                                                                                                                      "Category": "그린노트",
                                                                                                                                                                                      "Items": ["구스베리", "민트", "바질", "세이지", "아몬드", "오레가노", "유칼립투스", "처빌", "피망", "할라피뇨", "허브", "홍차"]
                                                                                                                                                                                  },
                                                                                                                                                                                  {
                                                                                                                                                                                      "Category": "기타",
                                                                                                                                                                                      "Items": ["구운빵", "꿀", "돌", "마른낙엽", "맥주", "밀랍", "반창고", "버섯", "버터", "분필", "생강", "석연슬레이트", "숲바닥", "야생고기", "연필심", "염분", "절인고기", "점토", "젖은상자", "젖은자갈", "젖은토양", "치즈", "크림", "타르", "화분흙", "훈제육"]
                                                                                                                                                                                  },
                                                                                                                                                                                  {
                                                                                                                                                                                      "Category": "꽃",
                                                                                                                                                                                      "Items": ["라벤더", "백합", "아카시아", "오렌지꽃", "인동덩굴", "자스민", "작약", "장미", "제라늄", "제비꽃", "포푸리", "히비스커스"]
                                                                                                                                                                                  },
                                                                                                                                                                                  {
                                                                                                                                                                                      "Category": "녹색과일",
                                                                                                                                                                                      "Items": ["라임", "매실", "청배"]
                                                                                                                                                                                  },
                                                                                                                                                                                  {
                                                                                                                                                                                      "Category": "말린과일",
                                                                                                                                                                                      "Items": ["건포도", "무화과", "용과"]
                                                                                                                                                                                  },
                                                                                                                                                                                  {
                                                                                                                                                                                      "Category": "붉은과일",
                                                                                                                                                                                      "Items": ["딸기", "라즈베리", "붉은자두", "석류", "체리", "크랜베리", "토마토"]
                                                                                                                                                                                  },
                                                                                                                                                                                  {
                                                                                                                                                                                      "Category": "시트러스",
                                                                                                                                                                                      "Items": ["귤", "레몬", "마멀레이드", "오렌지", "자몽"]
                                                                                                                                                                                  },
                                                                                                                                                                                  {
                                                                                                                                                                                      "Category": "열대과일",
                                                                                                                                                                                      "Items": ["구아바", "리치", "망고", "바나나", "키위", "파인애플", "풍선껌"]
                                                                                                                                                                                  },
                                                                                                                                                                                  {
                                                                                                                                                                                      "Category": "오크",
                                                                                                                                                                                      "Items": ["가죽", "견과류", "담배", "바닐라", "백단", "브리오슈", "삼나무", "시가박스", "에스프레소", "초콜릿", "캐러멜", "커피", "코코넛", "코코아", "콜라", "파이프담배", "헤이즐넛", "흑설탕"]
                                                                                                                                                                                  },
                                                                                                                                                                                  {
                                                                                                                                                                                      "Category": "푸른과일",
                                                                                                                                                                                      "Items": ["블루베리"]
                                                                                                                                                                                  },
                                                                                                                                                                                  {
                                                                                                                                                                                      "Category": "핵과류",
                                                                                                                                                                                      "Items": ["모과", "복숭아", "사과", "살구"]
                                                                                                                                                                                  },
                                                                                                                                                                                  {
                                                                                                                                                                                      "Category": "향신료",
                                                                                                                                                                                      "Items": ["감초", "계피", "붉은고추", "육두구", "정향", "팔각", "후추"]
                                                                                                                                                                                  }
                                                                                                                                                                              ]
                                                                                                                                                                          }
                                                                                                                                                                          
                                                                                                                                                                          
                                                                                                                                                                          - Constraint
                                                                                                                                                                             - 최초 input JSON 전달 시, section = COLOR
                                                                                                                                                                             - returnMessageList 에 있는 답변을 순서대로 return JSON message에 담아 보낼 것
                                                                                                                                                                             - 반드시 section 순서대로 진행할 것
                                                                                                                                                                             - 반드시 return JSON 양식만 반환할 것
                                                                                                                                                                             - input JSON 전달 시, 이미 작성한 항목(!= null || [] || 0.0)은 변경 및 재질문 금지
                                                                                                                                                                             - input JSON 전달 시, 모든 항목이 작성되었다면, section = COMPLETE, returnMessageList[9]를 반환
                                                                                                                                                                             - returnMessageList[9]를 반환한 후, 순서대로 returnMessageList[10], returnMessageList[11]을 반환할 것
                                                                                                                                                                             - FLAVOUR는 총 108개이며, 13가지 중 하나로 분류 될 수 있으며 명시한 향기만 사용
                                                                                                                                                                          
                                                                                                                                                                          - Exception
                                                                                                                                                                             - input JSON message에 "다음 단계로", "그만 물어봐" 등과 같이 현재 section에서 다음 section을 원하는 것과 유사한 답변이 올 경우, 다음 section을 진행할 것
                                                                                                                                                                             - input JSON message가 와인과 전혀 관련 없는 내용일 경우, return JSON message = exitMessageList[0]를 반환하고 section = EXIT
                                                                                                                                                                             - input JSON message가 "종료", "중단" 관련 내용일 경우, return JSON message = exitMessageList[1]를 반환하고 section = EXIT
                                                                                                                                                                             - SWEETNESS, INTENSITY, ACIDITY, ALCOHOL, TANNIN section에서는 추상적인 답변을 받을 경우, quantity 리스트 중 적절한 값 1개 반환
                                                                                                                                                                          
                                                                                                                                                                          returnMessageList = [
                                                                                                                                                                             "와인은 무슨 색이었나요?",   // section = COLOR
                                                                                                                                                                             "와인 색상으로 ${COLOR}를 고르셨습니다. 향기는 어땠나요?",   // section  = FLAVOUR
                                                                                                                                                                             "와인 향기는 ${FLAVOUR}향이 나는군요. 당도는 어땠나요?,   // section = SWEETNESS
                                                                                                                                                                             "당도는 ${SWEETNESS} 으로 할게요. 바디감은 어땠나요?",   // section = INTENSITY
                                                                                                                                                                             "바디감은 ${INTENSITY} 으로 할게요. 그럼 산미는요?",   // section = ACIDITY
                                                                                                                                                                             "산미는 ${ACIDITY} 으로 할게요. 그럼 알코올감은 어땠나요?",   // section = ALCOHOL
                                                                                                                                                                             "알코올감은 ${ALCOHOL} 으로 할게요. 거의 다왔어요.\\n그럼 타닌은요?",   // section = TANNIN
                                                                                                                                                                             "타닌은 ${TANNIN}으로 할게요. 마지막이에요.\\n이 와인에 대한 당신의 의견을 알려주세요.",   // section = OPINION
                                                                                                                                                                             "좋습니다. 별점은 몇 개를 줄까요? 5점 만점이에요",   // section = RATING
                                                                                                                                                                             "별점 "${RATING}을 주셨군요. 대단한 와인이네요.",   // section = COMPLETE
                                                                                                                                                                             "테이스팅 노트를 제출할까요?"   // section = COMPLETE
                                                                                                                                                                             "테이스팅 노트를 제출했습니다. VINOPENER와 함께 좋은 시간되세요 !" // section = EXIT
                                                                                                                                                                          ]
                                                                                                                                                                          exitMessageList = [
                                                                                                                                                                             "와인과 관련없는 내용입니다. 대화를 종료합니다.",
                                                                                                                                                                             "네, 도움이 되셨길 바랍니다. 감사합니다."
                                                                                                                                                                          ]
                                                                                                                                                                          quantity = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
                                                                                                                                                                          ```
            """;

    private final AiChatRepository aiChatRepository;
    private final AiChatMapper aiChatMapper;
    private final SimpleOpenAI openAI;
    private final ObjectMapper jsonMapper;

//    private final ObjectMapper jsonMapper = new ObjectMapper().configOverride(BigDecimal.class).setFormat(JsonFormat.Value.forShape(JsonFormat.Shape.STRING));;

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

        System.out.println("1번");
        System.out.println(requestState);

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

        System.out.println("2번");
        System.out.println(userMessageInfo);

//        ObjectMapper jsonMapper = new ObjectMapper();
//        SimpleModule module = new SimpleModule();
//        module.addDeserializer(BigDecimal.class, new BigDecimalDeserializer());
//        jsonMapper.registerModule(module);

        final var userMessageJson = jsonMapper.writeValueAsString(userMessageInfo);

        System.out.println("3번");
        System.out.println(userMessageJson);

        final var chatRequest = ChatRequest.builder()
                .model("gpt-4o")
                .message(SystemMessage.of(PROMPT))
                .message(UserMessage.of(userMessageJson))
                .temperature(0.0)
                .maxTokens(300)
                .build();
        final var aiMessageJson = openAI.chatCompletions().create(chatRequest).join().firstContent();
        final var aiMessageInfo = jsonMapper.readValue(aiMessageJson, AiChatCreateAiMessageInfo.class);

        System.out.println("4번");
        System.out.println(aiMessageInfo);

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
