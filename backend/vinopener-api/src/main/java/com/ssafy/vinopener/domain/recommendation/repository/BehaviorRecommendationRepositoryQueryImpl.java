package com.ssafy.vinopener.domain.recommendation.repository;

import static com.ssafy.vinopener.domain.recommendation.data.entity.QBehaviorRecommendationEntity.behaviorRecommendationEntity;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.ssafy.vinopener.domain.recommendation.data.entity.BehaviorRecommendationEntity;
import com.ssafy.vinopener.domain.recommendation.data.entity.enums.BehaviorRecommendationType;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@RequiredArgsConstructor
@Repository
public class BehaviorRecommendationRepositoryQueryImpl implements BehaviorRecommendationRepositoryQuery {

    private final JPAQueryFactory queryFactory;

    @Override
    public List<BehaviorRecommendationEntity> findAllByUserIdAndWineIdWithPref(Long userId, Long wineId) {
        return queryFactory
                .selectFrom(behaviorRecommendationEntity)
                .where(behaviorRecommendationEntity.user.id.eq(userId)
                        .and(behaviorRecommendationEntity.wine.id.eq(wineId))
                        .and(behaviorRecommendationEntity.behaviorRecommendationType.eq(
                                BehaviorRecommendationType.PREFERENCE)))
                .fetch();
    }

    @Override
    public List<BehaviorRecommendationEntity> findAllByUserIdAndWineIdWithNote(Long userId, Long wineId) {
        return queryFactory
                .selectFrom(behaviorRecommendationEntity)
                .where(behaviorRecommendationEntity.user.id.eq(userId)
                        .and(behaviorRecommendationEntity.wine.id.eq(wineId))
                        .and(behaviorRecommendationEntity.behaviorRecommendationType.eq(
                                BehaviorRecommendationType.TASTING_NOTE)))
                .fetch();
    }

}
