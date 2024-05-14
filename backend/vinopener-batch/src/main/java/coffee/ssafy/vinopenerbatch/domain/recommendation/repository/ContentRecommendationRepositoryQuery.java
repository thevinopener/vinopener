package coffee.ssafy.vinopenerbatch.domain.recommendation.repository;

import coffee.ssafy.vinopenerbatch.domain.recommendation.entity.enums.ContentRecommendationType;
import org.springframework.transaction.annotation.Transactional;

public interface ContentRecommendationRepositoryQuery {

    @Transactional
    void deleteAllByContentRecommendationType(ContentRecommendationType contentRecommendationType);

}
