package coffee.ssafy.vinopenerbatch.global.writer;

import coffee.ssafy.vinopenerbatch.domain.recommendation.repository.ContentRecommendationRepositoryQuery;
import coffee.ssafy.vinopenerbatch.global.recommendation.RecommendationProcessor;
import lombok.RequiredArgsConstructor;
import org.springframework.batch.item.Chunk;
import org.springframework.batch.item.ItemWriter;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class UpdatePreferenceWriter implements ItemWriter<String> {
    private final RecommendationProcessor recommendationProcessor;

    @Override
    public void write(Chunk<? extends String> items) throws Exception {
    }

}
