package com.ssafy.vinopener.domain.tastingnote.repository;

import static com.ssafy.vinopener.domain.tastingnote.data.entity.QColorEntity.colorEntity;
import static com.ssafy.vinopener.domain.tastingnote.data.entity.QTastingNoteEntity.tastingNoteEntity;
import static com.ssafy.vinopener.domain.tastingnote.data.entity.QTastingNoteFlavourEntity.tastingNoteFlavourEntity;
import static com.ssafy.vinopener.domain.user.data.entity.QUserEntity.userEntity;
import static com.ssafy.vinopener.domain.wine.data.entity.QFlavourTasteEntity.flavourTasteEntity;
import static com.ssafy.vinopener.domain.wine.data.entity.QFlavourTypeEntity.flavourTypeEntity;
import static com.ssafy.vinopener.domain.wine.data.entity.QWineEntity.wineEntity;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.ssafy.vinopener.domain.tastingnote.data.entity.TastingNoteEntity;
import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class TastingNoteRepositoryQueryImpl implements TastingNoteRepositoryQuery {

    private final JPAQueryFactory queryFactory;

    @Override
    public List<TastingNoteEntity> findAllByUserId(final Long userId) {
        return queryFactory
                .selectFrom(tastingNoteEntity)
                .join(tastingNoteEntity.user, userEntity).fetchJoin()
                .join(tastingNoteEntity.wine, wineEntity).fetchJoin()
                .join(tastingNoteEntity.color, colorEntity).fetchJoin()
                .leftJoin(tastingNoteEntity.flavours, tastingNoteFlavourEntity).fetchJoin()
                .join(tastingNoteFlavourEntity.flavourTaste, flavourTasteEntity).fetchJoin()
                .join(flavourTasteEntity.flavourType, flavourTypeEntity).fetchJoin()
                .where(tastingNoteEntity.user.id.eq(userId))
                .fetch();
    }

    @Override
    public Optional<TastingNoteEntity> findByIdAndUserId(final Long id, final Long userId) {
        return Optional.ofNullable(queryFactory
                .selectFrom(tastingNoteEntity)
                .join(tastingNoteEntity.user, userEntity).fetchJoin()
                .join(tastingNoteEntity.wine, wineEntity).fetchJoin()
                .join(tastingNoteEntity.color, colorEntity).fetchJoin()
                .leftJoin(tastingNoteEntity.flavours, tastingNoteFlavourEntity).fetchJoin()
                .join(tastingNoteFlavourEntity.flavourTaste, flavourTasteEntity).fetchJoin()
                .join(flavourTasteEntity.flavourType, flavourTypeEntity).fetchJoin()
                .where(tastingNoteEntity.id.eq(id)
                        .and(tastingNoteEntity.user.id.eq(userId)))
                .fetchOne());
    }

}
