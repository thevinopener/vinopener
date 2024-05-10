package coffee.ssafy.vinopenerbatch.domain.recommendation.repository;

import coffee.ssafy.vinopenerbatch.domain.recommendation.entity.ContentRecommendationEntity;
import coffee.ssafy.vinopenerbatch.domain.recommendation.entity.enums.ContentRecommendationType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

public interface ContentRecommendationRepository extends JpaRepository<ContentRecommendationEntity, Long> {

    List<ContentRecommendationEntity> findAllByContentRecommendationType(ContentRecommendationType type);

    @Transactional
    void deleteAllByContentRecommendationType(ContentRecommendationType type);

}
