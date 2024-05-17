package com.ssafy.vinopener.domain.wine.repository;

import static com.ssafy.vinopener.domain.cellar.data.entity.QCellarEntity.cellarEntity;
import static com.ssafy.vinopener.domain.wine.data.entity.QWineEntity.wineEntity;

import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import java.util.List;
import java.util.Set;
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
    public List<WineEntity> findAllByTypeExceptCellar(Set<WineType> wineTypeList, Long userId) {

        return queryFactory
                .selectFrom(wineEntity)
                .where(wineEntity.type.in(wineTypeList)
                        .and(wineEntity.id.notIn(
                                JPAExpressions
                                        .select(cellarEntity.wine.id)
                                        .from(cellarEntity)
                                        .where(cellarEntity.user.id.eq(userId))
                        )))
                .fetch();
    }

}
