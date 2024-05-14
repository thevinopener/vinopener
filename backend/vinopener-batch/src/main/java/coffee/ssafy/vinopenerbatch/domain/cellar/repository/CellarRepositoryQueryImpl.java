package coffee.ssafy.vinopenerbatch.domain.cellar.repository;

import com.querydsl.core.Tuple;
import com.querydsl.jpa.impl.JPAQueryFactory;
import coffee.ssafy.vinopenerbatch.domain.cellar.entity.QCellarEntity;
import jakarta.persistence.EntityManager;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public class CellarRepositoryQueryImpl implements CellarRepositoryQuery {

    private final JPAQueryFactory queryFactory;

    public CellarRepositoryQueryImpl(EntityManager entityManager) {
        this.queryFactory = new JPAQueryFactory(entityManager);
    }

    @Override
    public List<Tuple> findAllByCellarCount() {
        QCellarEntity qCellarEntity = QCellarEntity.cellarEntity;

        return queryFactory
                .select(qCellarEntity.wine.id, qCellarEntity.user.id.countDistinct())
                .from(qCellarEntity)
                .groupBy(qCellarEntity.wine.id)
                .orderBy(qCellarEntity.user.id.countDistinct().desc())
                .fetch();
    }

}
