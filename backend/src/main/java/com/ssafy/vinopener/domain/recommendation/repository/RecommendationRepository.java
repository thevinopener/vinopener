package com.ssafy.vinopener.domain.recommendation.repository;

import com.ssafy.vinopener.domain.recommendation.data.entity.RecommendationContentEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RecommendationRepository extends JpaRepository<RecommendationContentEntity, Long> {

}
