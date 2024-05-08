package com.ssafy.vinopener.domain.recommendation.repository;

import com.ssafy.vinopener.domain.recommendation.data.entity.ContentRecommendationEntity;
import com.ssafy.vinopener.domain.recommendation.data.entity.enums.ContentRecommendationType;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

public interface ContentRecommendationRepository extends JpaRepository<ContentRecommendationEntity, Long> {

    List<ContentRecommendationEntity> findAllByContentRecommendationType(ContentRecommendationType type);

    @Transactional
    void deleteAllByContentRecommendationType(ContentRecommendationType type);

}
