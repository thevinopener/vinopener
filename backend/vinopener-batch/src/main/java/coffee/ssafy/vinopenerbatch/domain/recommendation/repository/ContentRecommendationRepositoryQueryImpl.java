package coffee.ssafy.vinopenerbatch.domain.recommendation.repository;

import coffee.ssafy.vinopenerbatch.domain.recommendation.entity.QContentRecommendationEntity;
import coffee.ssafy.vinopenerbatch.domain.recommendation.entity.enums.ContentRecommendationType;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@RequiredArgsConstructor
@Repository
public class ContentRecommendationRepositoryQueryImpl implements ContentRecommendationRepositoryQuery {

    private final JPAQueryFactory queryFactory;

    @Override
    public void deleteAllByContentRecommendationType(ContentRecommendationType type) {
        QContentRecommendationEntity qContentRecommendationEntity = QContentRecommendationEntity.contentRecommendationEntity;
        queryFactory
                .delete(qContentRecommendationEntity)
                .where(qContentRecommendationEntity.contentRecommendationType.in(type))
                .execute();
    }

}
