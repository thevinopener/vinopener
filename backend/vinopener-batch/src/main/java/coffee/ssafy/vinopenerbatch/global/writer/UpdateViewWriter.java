package coffee.ssafy.vinopenerbatch.global.writer;

import coffee.ssafy.vinopenerbatch.domain.recommendation.entity.enums.ContentRecommendationType;
import coffee.ssafy.vinopenerbatch.domain.recommendation.repository.ContentRecommendationRepository;
import coffee.ssafy.vinopenerbatch.domain.wine.entity.WineEntity;
import coffee.ssafy.vinopenerbatch.domain.wine.repository.WineRepository;
import coffee.ssafy.vinopenerbatch.global.recommendation.RecommendationProcessor;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.item.Chunk;
import org.springframework.batch.item.ItemWriter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Component
@RequiredArgsConstructor
public class UpdateViewWriter implements ItemWriter<String> {

    private final WineRepository wineRepository;
    private final ObjectMapper objectMapper = new ObjectMapper();
    private final RecommendationProcessor recommendationProcessor;
    private final ContentRecommendationRepository contentRecommendationRepository;

    @Transactional
    @Override
    public void write(Chunk<? extends String> items) throws Exception {

        Map<Long, Integer> wineViewCount = new HashMap<>();

        for (String item : items) {
            log.info("item : {}", item);
            JsonNode jsonNode = objectMapper.readTree(item);
            long wineId = jsonNode.get("wineId").asLong();
            wineViewCount.put(wineId, wineViewCount.getOrDefault(wineId, 0) + 1);
        }

        for (Map.Entry<Long, Integer> entry : wineViewCount.entrySet()) {
            Long wineId = entry.getKey();
            int viewCount = entry.getValue();
            WineEntity wineEntity = wineRepository.findById(wineId).orElse(null);
            if (wineEntity == null) {
                continue;
            }
            wineEntity = wineEntity.increaseViewByCount(viewCount);
            wineRepository.save(wineEntity);
        }

        //DB에 조회수 업데이트 확인됨.
        //이제 재추천 후 테이블 갱신.
        contentRecommendationRepository.deleteAllByContentRecommendationType(ContentRecommendationType.VIEW);
        recommendationProcessor.createRecommendation(ContentRecommendationType.VIEW);



        log.info("------------------");
    }

}
