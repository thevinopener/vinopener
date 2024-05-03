package com.ssafy.vinopener.domain.preference.repository;

import static com.ssafy.vinopener.domain.preference.data.entity.QPreferenceEntity.preferenceEntity;
import static com.ssafy.vinopener.domain.tastingnote.data.entity.QTastingNoteEntity.tastingNoteEntity;
import static com.ssafy.vinopener.domain.user.data.entity.QUserEntity.userEntity;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.ssafy.vinopener.domain.preference.data.entity.PreferenceEntity;
import java.util.Optional;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class PreferenceRepositoryQueryImpl implements PreferenceRepositoryQuery {

    private final JPAQueryFactory queryFactory;

    @Override
    public Optional<PreferenceEntity> findByUserId(Long userId) {
        return Optional.ofNullable(queryFactory
                .selectFrom(preferenceEntity)
                .join(preferenceEntity.user, userEntity).fetchJoin()
                .where(tastingNoteEntity.user.id.eq(userId))
                .fetchOne());
    }

}
