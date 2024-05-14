package coffee.ssafy.vinopenerbatch.domain.tastingnote.repository;

import static coffee.ssafy.vinopenerbatch.domain.tastingnote.entity.QColorEntity.colorEntity;
import static coffee.ssafy.vinopenerbatch.domain.tastingnote.entity.QTastingNoteEntity.tastingNoteEntity;
import static coffee.ssafy.vinopenerbatch.domain.tastingnote.entity.QTastingNoteFlavourEntity.tastingNoteFlavourEntity;
import static coffee.ssafy.vinopenerbatch.domain.user.entity.QUserEntity.userEntity;
import static coffee.ssafy.vinopenerbatch.domain.wine.entity.QFlavourTasteEntity.flavourTasteEntity;
import static coffee.ssafy.vinopenerbatch.domain.wine.entity.QFlavourTypeEntity.flavourTypeEntity;
import static coffee.ssafy.vinopenerbatch.domain.wine.entity.QWineEntity.wineEntity;

import coffee.ssafy.vinopenerbatch.domain.tastingnote.entity.TastingNoteEntity;
import com.querydsl.jpa.impl.JPAQueryFactory;
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
