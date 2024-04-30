package com.ssafy.vinopener.domain.tastingnote.repository;

import static com.ssafy.vinopener.domain.tastingnote.data.entity.QTastingNoteEntity.tastingNoteEntity;
import static com.ssafy.vinopener.domain.tastingnote.data.entity.QTastingNoteFlavourEntity.tastingNoteFlavourEntity;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.ssafy.vinopener.domain.tastingnote.data.entity.TastingNoteEntity;
import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class TastingNoteRepositoryQueryImpl implements TastingNoteRepositoryQuery {

    private final JPAQueryFactory queryFactory;

    @Override
    public List<TastingNoteEntity> findAllByUserId(Long userId) {
        return queryFactory
                .selectFrom(tastingNoteEntity)
                .leftJoin(tastingNoteEntity, tastingNoteFlavourEntity.tastingNote)
                .where(tastingNoteEntity.user.id.eq(userId))
                .fetch();
    }

    @Override
    public Optional<TastingNoteEntity> findByIdAndUserId(final Long id, final Long userId) {
        return Optional.ofNullable(queryFactory
                .selectFrom(tastingNoteEntity)
                .leftJoin(tastingNoteEntity, tastingNoteFlavourEntity.tastingNote)
                .where(tastingNoteEntity.id.eq(id)
                        .and(tastingNoteEntity.user.id.eq(userId)))
                .fetchOne());
    }

}
