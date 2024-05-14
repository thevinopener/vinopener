package coffee.ssafy.vinopenerbatch.global.writer;

import coffee.ssafy.vinopenerbatch.domain.recommendation.entity.enums.ContentRecommendationType;
import coffee.ssafy.vinopenerbatch.domain.recommendation.repository.ContentRecommendationRepositoryQuery;
import coffee.ssafy.vinopenerbatch.global.recommendation.RecommendationProcessor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.item.Chunk;
import org.springframework.batch.item.ItemWriter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@RequiredArgsConstructor
@Slf4j
public class UpdateRateWriter implements ItemWriter<String> {
    private final RecommendationProcessor recommendationProcessor;
    private final ContentRecommendationRepositoryQuery contentRecommendationRepositoryQuery;

    @Transactional
    @Override
    public void write(Chunk<? extends String> items) throws Exception {
        contentRecommendationRepositoryQuery.deleteAllByContentRecommendationType(ContentRecommendationType.RATE);
        recommendationProcessor.createRecommendation(ContentRecommendationType.RATE);
    }
}
