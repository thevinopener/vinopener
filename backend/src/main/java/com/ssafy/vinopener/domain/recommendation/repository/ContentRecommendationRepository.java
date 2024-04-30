package com.ssafy.vinopener.domain.recommendation.repository;

import com.ssafy.vinopener.domain.recommendation.data.entity.ContentRecommendationEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContentRecommendationRepository extends JpaRepository<ContentRecommendationEntity, Long> {

}
