package coffee.ssafy.vinopenerbatch.global.writer;

import coffee.ssafy.vinopenerbatch.domain.recommendation.repository.BehaviorRecommendationRepository;
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
    private final BehaviorRecommendationRepository behaviorRecommendationRepository;

    @Override
    public void write(Chunk<? extends String> items) throws Exception {
//        behaviorRecommendationRepository.deleteAllByUserId();
        // 일단, 갱신해야하는 경우는 다음과 같다.
        // 1. preference가 변경되는 경우,
        // 2. preference 추천 결과 중 하나를 cellar에 등록했을 경우.
        // 3. wine테이블에 새로운 데이터가 들어갔을 때.
        // producer로 kafka에 해당 사실을 전달하고, reader에서 데이터를 읽었을 때,
        // 해당하는 userId를 가져와서 그 user에 대한 preference 결과를 갱신하면 된다.
        //
    }

}
