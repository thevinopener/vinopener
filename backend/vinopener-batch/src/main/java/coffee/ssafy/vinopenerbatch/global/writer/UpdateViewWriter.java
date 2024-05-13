package coffee.ssafy.vinopenerbatch.global.writer;

import coffee.ssafy.vinopenerbatch.domain.recommendation.entity.enums.ContentRecommendationType;
import coffee.ssafy.vinopenerbatch.domain.recommendation.repository.ContentRecommendationRepository;
import coffee.ssafy.vinopenerbatch.domain.recommendation.repository.ContentRecommendationRepositoryQuery;
import coffee.ssafy.vinopenerbatch.domain.wine.entity.WineEntity;
import coffee.ssafy.vinopenerbatch.domain.wine.repository.WineRepository;
import coffee.ssafy.vinopenerbatch.global.common.TimeHolder;
import coffee.ssafy.vinopenerbatch.global.recommendation.RecommendationProcessor;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.item.Chunk;
import org.springframework.batch.item.ItemWriter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

@Slf4j
@Component
@RequiredArgsConstructor
public class UpdateViewWriter implements ItemWriter<String> {

    private final WineRepository wineRepository;
    private final ObjectMapper objectMapper = new ObjectMapper();
    private final RecommendationProcessor recommendationProcessor;
    private final ContentRecommendationRepositoryQuery contentRecommendationRepositoryQuery;

    @Transactional
    @Override
    public void write(Chunk<? extends String> items) throws Exception {
        Map<Long, Integer> wineViewCount = new HashMap<>();
        if (!items.iterator().hasNext()) {
            return;
        }

        String firstItem = items.iterator().next();
        JsonNode firstJsonNode = objectMapper.readTree(firstItem);

        LocalDateTime firstItemTime = LocalDateTime.parse(firstJsonNode.get("time").asText());
        LocalDateTime previousLastTime = TimeHolder.getViewLastTime();
        boolean passFirstItem = false;
        if (previousLastTime != null && previousLastTime.equals(firstItemTime)) {
            passFirstItem = true;
        }

        boolean isFirstItem = true;

        for (String item : items) {

            if (isFirstItem && passFirstItem) {
                isFirstItem = false;  // 첫 번째 아이템 처리 후 플래그 비활성화
                continue;  // 첫 번째 아이템 스킵
            }

            JsonNode jsonNode = objectMapper.readTree(item);
            long wineId = jsonNode.get("wineId").asLong();
            String timeString = jsonNode.get("time").asText();
            TimeHolder.setLastTime(LocalDateTime.parse(timeString));

            wineViewCount.put(wineId, wineViewCount.getOrDefault(wineId, 0) + 1);
        }

        for (Entry<Long, Integer> entry : wineViewCount.entrySet()) {
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
        contentRecommendationRepositoryQuery.deleteAllByContentRecommendationType(ContentRecommendationType.VIEW);
        recommendationProcessor.createRecommendation(ContentRecommendationType.VIEW);

    }

}
