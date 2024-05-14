package com.ssafy.vinopener.domain.recommendation.repository;

import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.ssafy.vinopener.domain.cellar.data.entity.QCellarEntity;
import com.ssafy.vinopener.domain.wine.data.entity.QWineEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import jakarta.persistence.EntityManager;
import java.util.List;
import java.util.Set;
import org.springframework.stereotype.Repository;

@Repository
public class RecommendationRepositoryQueryImpl implements RecommendationRepositoryQuery {

    private final JPAQueryFactory queryFactory;

    public RecommendationRepositoryQueryImpl(EntityManager entityManager) {
        this.queryFactory = new JPAQueryFactory(entityManager);
    }

    @Override
    public List<WineEntity> findByWineTypeSet(Set<WineType> wineTypeList) {
        QWineEntity qWineEntity = QWineEntity.wineEntity;

        return queryFactory
                .selectFrom(qWineEntity)
                .where(qWineEntity.type.in(wineTypeList))
                .fetch();
    }

    @Override
    public List<WineEntity> findByWineTypeSet(Set<WineType> wineTypeList, Long userId) {
        QWineEntity qWineEntity = QWineEntity.wineEntity;
        QCellarEntity qCellarEntity = QCellarEntity.cellarEntity;

        return queryFactory
                .selectFrom(qWineEntity)
                .where(qWineEntity.type.in(wineTypeList)
                        .and(qWineEntity.id.notIn(
                                JPAExpressions
                                        .select(qCellarEntity.wine.id)
                                        .from(qCellarEntity)
                                        .where(qCellarEntity.user.id.eq(userId))
                        )))
                .fetch();
    }

}
