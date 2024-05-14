package coffee.ssafy.vinopenerbatch.domain.recommendation.repository;

import coffee.ssafy.vinopenerbatch.domain.recommendation.entity.BehaviorRecommendationEntity;
import coffee.ssafy.vinopenerbatch.domain.recommendation.entity.enums.BehaviorRecommendationType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface BehaviorRecommendationRepository extends JpaRepository<BehaviorRecommendationEntity, Long> {

    List<BehaviorRecommendationEntity> findAllByUserId(Long userId);

    List<BehaviorRecommendationEntity> findAllByBehaviorRecommendationTypeAndUserId(BehaviorRecommendationType type,
            Long id);

    @Transactional
    void deleteAllByUserId(Long userId);

}
