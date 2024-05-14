package coffee.ssafy.vinopenerbatch.domain.preference.repository;

import coffee.ssafy.vinopenerbatch.domain.preference.entity.PreferenceEntity;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import java.util.Optional;

import static coffee.ssafy.vinopenerbatch.domain.preference.entity.QPreferenceEntity.preferenceEntity;
import static coffee.ssafy.vinopenerbatch.domain.user.entity.QUserEntity.userEntity;

@RequiredArgsConstructor
public class PreferenceRepositoryQueryImpl implements PreferenceRepositoryQuery {

    private final JPAQueryFactory queryFactory;

    @Override
    public Optional<PreferenceEntity> findByUserId(final Long userId) {
        return Optional.ofNullable(queryFactory
                .selectFrom(preferenceEntity)
                .join(preferenceEntity.user, userEntity).fetchJoin()
                .where(preferenceEntity.user.id.eq(userId))
                .fetchOne());
    }

}
