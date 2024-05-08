package com.ssafy.vinopener.domain.recommendation.repository;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.ssafy.vinopener.domain.wine.data.entity.QWineEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import java.util.List;
import java.util.Set;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class BehaviorRecommendationRepositoryQueryImpl implements BehaviorRecommendationRepositoryQuery {

    private final JPAQueryFactory queryFactory;

    @Override
    public List<WineEntity> findByWineTypeList(Set<WineType> wineTypeList) {
        QWineEntity qWineEntity = QWineEntity.wineEntity;

        return queryFactory
                .selectFrom(qWineEntity)
                .where(qWineEntity.type.in(wineTypeList))
                .fetch();
    }

}
