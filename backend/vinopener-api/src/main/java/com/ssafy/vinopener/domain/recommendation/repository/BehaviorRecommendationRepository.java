package com.ssafy.vinopener.domain.recommendation.repository;

import com.ssafy.vinopener.domain.recommendation.data.entity.BehaviorRecommendationEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

public interface BehaviorRecommendationRepository extends JpaRepository<BehaviorRecommendationEntity, Long> {

    List<BehaviorRecommendationEntity> findAllByUserId(Long userId);

    @Transactional
    void deleteAllByUserId(Long userId);

}
