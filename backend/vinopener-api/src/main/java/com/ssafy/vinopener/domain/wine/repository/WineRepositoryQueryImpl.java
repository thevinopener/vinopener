package com.ssafy.vinopener.domain.wine.repository;

import static com.ssafy.vinopener.domain.cellar.data.entity.QCellarEntity.cellarEntity;
import static com.ssafy.vinopener.domain.wine.data.entity.QWineEntity.wineEntity;

import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.JPQLQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@RequiredArgsConstructor
@Repository
public class WineRepositoryQueryImpl implements WineRepositoryQuery {

    private final JPAQueryFactory queryFactory;

    @Override
    public List<WineEntity> findAllExceptCellar(Long userId) {
        return queryFactory
                .selectFrom(wineEntity)
                .where(wineEntity.id.notIn(
                        JPAExpressions
                                .select(cellarEntity.wine.id)
                                .from(cellarEntity)
                                .where(cellarEntity.user.id.eq(userId))
                ))
                .fetch();
    }

    @Override
    public List<WineEntity> findAllByTypeExceptCellar(WineType type, Long userId) {

        JPQLQuery<Long> subQuery = JPAExpressions
                .select(wineEntity.id)
                .from(wineEntity)
                .where(wineEntity.id.notIn(
                        JPAExpressions
                                .select(cellarEntity.wine.id)
                                .from(cellarEntity)
                                .where(cellarEntity.user.id.eq(userId))
                ));

        return queryFactory
                .selectFrom(wineEntity)
                .where(wineEntity.type.in(type)
                        .and(wineEntity.id.in(subQuery)))
                .fetch();
    }

}
