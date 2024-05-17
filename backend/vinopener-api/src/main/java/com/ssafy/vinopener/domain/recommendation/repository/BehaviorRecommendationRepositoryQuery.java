package com.ssafy.vinopener.domain.recommendation.repository;

import com.ssafy.vinopener.domain.recommendation.data.entity.BehaviorRecommendationEntity;
import java.util.List;

public interface BehaviorRecommendationRepositoryQuery {

    List<BehaviorRecommendationEntity> findAllByUserIdAndWineIdWithPref(Long userId, Long wineId);

    List<BehaviorRecommendationEntity> findAllByUserIdAndWineIdWithNote(Long userId, Long wineId);

}
