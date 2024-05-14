package coffee.ssafy.vinopenerbatch.global.recommendation;

import coffee.ssafy.vinopenerbatch.domain.cellar.repository.CellarRepositoryQueryImpl;
import coffee.ssafy.vinopenerbatch.domain.recommendation.entity.ContentRecommendationEntity;
import coffee.ssafy.vinopenerbatch.domain.recommendation.entity.enums.ContentRecommendationType;
import coffee.ssafy.vinopenerbatch.domain.recommendation.repository.ContentRecommendationRepository;
import coffee.ssafy.vinopenerbatch.domain.wine.entity.WineEntity;
import coffee.ssafy.vinopenerbatch.domain.wine.repository.WineRepository;
import com.querydsl.core.Tuple;
import jakarta.persistence.EntityManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Component
@RequiredArgsConstructor
@Slf4j
public class RecommendationProcessor {

    private final WineRepository wineRepository;
    private final ContentRecommendationRepository contentRecommendationRepository;
    private final CellarRepositoryQueryImpl cellarRepositoryQueryImpl;
    private final EntityManager entityManager;


    @Transactional
    public void createRecommendation(ContentRecommendationType type) {
        String columnName = "";
        switch (type) {
            case VIEW -> columnName = "view";
            case RATE -> columnName = "rating";
            case CELLAR -> columnName = "cellar";

        }
//        List<WineEntity> resultList = new ArrayList<>();
        List<ContentRecommendationEntity> savingEntities = new ArrayList<>();

        // VIEW, RATE
        if (!columnName.equals("cellar")) {
            List<WineEntity> wineList = wineRepository.findAll(Sort.by(Direction.DESC, columnName));

            for (int i = 0; i < 10; i++) {
                ContentRecommendationEntity recommendationEntity = ContentRecommendationEntity.builder()
                        .wine(wineList.get(i))
                        .contentRecommendationType(type)
                        .build();

                savingEntities.add(recommendationEntity);
            }
            contentRecommendationRepository.saveAll(savingEntities);
        }
        // CELLAR
        else {
            List<Tuple> queryResultList = cellarRepositoryQueryImpl.findAllByCellarCount();

            int cellarCount = queryResultList.size();
            int remnantCount = 0;
            if (cellarCount >= 10) {
                cellarCount = 10;
            } else {
                remnantCount = 10 - cellarCount;
            }

            for (int i = 0; i < cellarCount; i++) {
                Long wineId = queryResultList.get(i).get(0, Long.class);
                WineEntity wine = entityManager.getReference(WineEntity.class, wineId);

                ContentRecommendationEntity recommendationEntity = ContentRecommendationEntity.builder()
                        .wine(wine)
                        .contentRecommendationType(ContentRecommendationType.CELLAR)
                        .build();

                savingEntities.add(recommendationEntity);
            }

            // 10개가 채워지지 않는다면, rating 기반으로 평점이 높은 순으로 남은 개수를 채운다.
            if (remnantCount >= 1) {
                List<WineEntity> additionalList = wineRepository.findAll(Sort.by(Direction.DESC, "rating"));
                for (int i = 0; i < remnantCount; i++) {
                    ContentRecommendationEntity recommendationEntity = ContentRecommendationEntity.builder()
                            .wine(additionalList.get(i))
                            .contentRecommendationType(ContentRecommendationType.CELLAR)
                            .build();
                    savingEntities.add(recommendationEntity);
                }
            }
            contentRecommendationRepository.saveAll(savingEntities);

        }
    }

}