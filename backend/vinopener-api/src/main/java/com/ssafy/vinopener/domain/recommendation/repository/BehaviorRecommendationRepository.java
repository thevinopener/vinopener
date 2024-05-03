package com.ssafy.vinopener.domain.recommendation.repository;

import com.ssafy.vinopener.domain.recommendation.data.entity.BehaviorRecommendationEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BehaviorRecommendationRepository extends JpaRepository<BehaviorRecommendationEntity, Long> {

}
