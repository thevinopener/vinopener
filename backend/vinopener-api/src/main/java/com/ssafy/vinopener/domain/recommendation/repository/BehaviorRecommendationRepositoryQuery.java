package com.ssafy.vinopener.domain.recommendation.repository;

import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import java.util.List;
import java.util.Set;

public interface BehaviorRecommendationRepositoryQuery {

    List<WineEntity> findByWineTypeList(Set<WineType> wineTypeLIst);

}
