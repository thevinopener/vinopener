package com.ssafy.vinopener.domain.wine.repository;

import static com.ssafy.vinopener.domain.cellar.data.entity.QCellarEntity.cellarEntity;
import static com.ssafy.vinopener.domain.wine.data.entity.QWineEntity.wineEntity;

import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import java.util.List;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
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

}
