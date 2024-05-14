package coffee.ssafy.vinopenerbatch.domain.recommendation.repository;

import coffee.ssafy.vinopenerbatch.domain.wine.entity.QWineEntity;
import coffee.ssafy.vinopenerbatch.domain.wine.entity.WineEntity;
import coffee.ssafy.vinopenerbatch.domain.wine.entity.enums.WineType;
import com.querydsl.jpa.impl.JPAQueryFactory;
import jakarta.persistence.EntityManager;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

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

}
