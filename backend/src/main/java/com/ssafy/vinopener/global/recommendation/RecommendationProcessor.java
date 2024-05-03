package com.ssafy.vinopener.global.recommendation;

import com.querydsl.core.Tuple;
import com.ssafy.vinopener.domain.cellar.repository.CellarRepositoryQueryImpl;
import com.ssafy.vinopener.domain.preference.repository.PreferenceRepository;
import com.ssafy.vinopener.domain.recommendation.data.entity.ContentRecommendationEntity;
import com.ssafy.vinopener.domain.recommendation.data.entity.enums.ContentRecommendationType;
import com.ssafy.vinopener.domain.recommendation.data.mapper.RecommendationMapper;
import com.ssafy.vinopener.domain.recommendation.repository.ContentRecommendationRepository;
import com.ssafy.vinopener.domain.tastingnote.repository.TastingNoteRepository;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.repository.WineRepository;
import jakarta.persistence.EntityManager;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@Slf4j
public class RecommendationProcessor {

    private final WineRepository wineRepository;
    private final PreferenceRepository preferenceRepository;
    private final TastingNoteRepository tastingNoteRepository;
    private final RecommendationMapper recommendationMapper;
    private final ContentRecommendationRepository contentRecommendationRepository;
    private final CellarRepositoryQueryImpl cellarRepositoryQueryImpl;
    private final EntityManager entityManager;

    public void createRecommendation(ContentRecommendationType type) {
        String columnName = "";
        switch (type) {
            case VIEW -> columnName = "view";
            case RATE -> columnName = "rating";
            case CELLAR -> columnName = "cellar";

        }

        // VIEW, RATE
        if (!columnName.equals("cellar")) {
            List<WineEntity> wineList = wineRepository.findAll(Sort.by(Direction.DESC, columnName));

            for (int i = 0; i < 10; i++) {
                ContentRecommendationEntity recommendationEntity = ContentRecommendationEntity.builder()
                        .wine(wineList.get(i))
                        .contentRecommendationType(type)
                        .build();

                contentRecommendationRepository.save(recommendationEntity);
            }
        }
        // CELLAR
        else {
            List<Tuple> resultList = cellarRepositoryQueryImpl.findAllByCellarCount();

            for (int i = 0; i < 10; i++) {
                Long wineId = resultList.get(i).get(0, Long.class);
                WineEntity wine = entityManager.getReference(WineEntity.class, wineId);

                ContentRecommendationEntity recommendationEntity = ContentRecommendationEntity.builder()
                        .wine(wine)
                        .contentRecommendationType(ContentRecommendationType.CELLAR)
                        .build();

                contentRecommendationRepository.save(recommendationEntity);
            }

        }

    }

}
