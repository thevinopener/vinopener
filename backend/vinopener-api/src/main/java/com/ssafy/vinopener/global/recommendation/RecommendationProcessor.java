package com.ssafy.vinopener.global.recommendation;

import com.querydsl.core.Tuple;
import com.ssafy.vinopener.domain.cellar.repository.CellarRepositoryQueryImpl;
import com.ssafy.vinopener.domain.preference.data.entity.PreferenceEntity;
import com.ssafy.vinopener.domain.preference.data.mapper.PreferenceMapper;
import com.ssafy.vinopener.domain.preference.exception.PreferenceErrorCode;
import com.ssafy.vinopener.domain.preference.repository.PreferenceRepository;
import com.ssafy.vinopener.domain.recommendation.data.entity.BehaviorRecommendationEntity;
import com.ssafy.vinopener.domain.recommendation.data.entity.ContentRecommendationEntity;
import com.ssafy.vinopener.domain.recommendation.data.entity.enums.BehaviorRecommendationType;
import com.ssafy.vinopener.domain.recommendation.data.entity.enums.ContentRecommendationType;
import com.ssafy.vinopener.domain.recommendation.data.mapper.RecommendationMapper;
import com.ssafy.vinopener.domain.recommendation.repository.BehaviorRecommendationRepository;
import com.ssafy.vinopener.domain.recommendation.repository.ContentRecommendationRepository;
import com.ssafy.vinopener.domain.recommendation.repository.RecommendationRepositoryQueryImpl;
import com.ssafy.vinopener.domain.tastingnote.repository.TastingNoteRepository;
import com.ssafy.vinopener.domain.user.exception.UserErrorCode;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import com.ssafy.vinopener.domain.wine.exception.WineErrorCode;
import com.ssafy.vinopener.domain.wine.repository.WineRepository;
import com.ssafy.vinopener.global.exception.VinopenerException;
import jakarta.persistence.EntityManager;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
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
    private final PreferenceMapper preferenceMapper;
    private final RecommendationRepositoryQueryImpl recommendationRepositoryQueryImpl;
    private final BehaviorRecommendationRepository behaviorRecommendationRepository;
    private final UserRepository userRepository;

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

    public List<WineEntity> createRecommendation(BehaviorRecommendationType type, Long userId) {
        PreferenceEntity preferenceEntity = preferenceRepository.findByUserId(userId).orElse(null);
        List<BehaviorRecommendationEntity> savingEntities = new ArrayList<>();
        if (preferenceEntity == null) {
            throw new VinopenerException(PreferenceErrorCode.PREFERENCE_NOT_FOUND);
        }

        // 사용자가 선호하는 타입의 와인만 먼저 DB에서 골라낸다.
        Set<WineType> wineTypeSet = preferenceMapper.map(preferenceEntity);
        List<WineEntity> wineEntityList = recommendationRepositoryQueryImpl.findByWineTypeSet(wineTypeSet);
        List<WineEntity> resultList = wineEntityList.stream()
                .sorted(Comparator.comparingDouble((WineEntity wineEntity)
                        -> processCosineSimilarity(wineEntity, preferenceEntity)).reversed())
                .limit(10)
                .toList();
        for (WineEntity wineEntity : resultList) {
            BehaviorRecommendationEntity behaviorRecommendationEntity = BehaviorRecommendationEntity.builder()
                    .user(userRepository.findById(userId).orElseThrow(() -> new VinopenerException(
                            UserErrorCode.USER_NOT_FOUND)))
                    .wine(wineRepository.findById(wineEntity.getId()).orElseThrow(() -> new VinopenerException(
                            WineErrorCode.WINE_NOT_FOUND)))
                    .behaviorRecommendationType(BehaviorRecommendationType.PREFERENCE)
                    .build();

            savingEntities.add(behaviorRecommendationEntity);
        }
        behaviorRecommendationRepository.saveAll(savingEntities);

        return resultList;
    }

    public double processCosineSimilarity(WineEntity wineEntity, PreferenceEntity preferenceEntity) {
        double dotProduct = wineEntity.getAbv().doubleValue() * preferenceEntity.getMinAbv().doubleValue() * 0.2 +
                wineEntity.getAbv().doubleValue() * preferenceEntity.getMaxAbv().doubleValue() * 0.2 +
                wineEntity.getSweetness().doubleValue() * preferenceEntity.getSweetness().doubleValue() * 0.05 +
                wineEntity.getAcidity().doubleValue() * preferenceEntity.getAcidity().doubleValue() * 0.05 +
                wineEntity.getTannin().doubleValue() * preferenceEntity.getTannin().doubleValue() * 0.05;

        double normWine = Math.sqrt(Math.pow(wineEntity.getAbv().doubleValue(), 2) +
                Math.pow(wineEntity.getAbv().doubleValue(), 2) +
                Math.pow(wineEntity.getSweetness().doubleValue(), 2) +
                Math.pow(wineEntity.getAcidity().doubleValue(), 2) +
                Math.pow(wineEntity.getTannin().doubleValue(), 2)
        );
        double normPref = Math.sqrt(Math.pow(preferenceEntity.getMinAbv().doubleValue() * 0.2, 2) +
                Math.pow(preferenceEntity.getMaxAbv().doubleValue() * 0.2, 2) +
                Math.pow(preferenceEntity.getSweetness().doubleValue() * 0.05, 2) +
                Math.pow(preferenceEntity.getAcidity().doubleValue() * 0.05, 2) +
                Math.pow(preferenceEntity.getTannin().doubleValue() * 0.05, 2)
        );

        return dotProduct / (normWine * normPref);
    }

}
