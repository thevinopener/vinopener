package com.ssafy.vinopener.global.recommendation;

import com.ssafy.vinopener.domain.preference.repository.PreferenceRepository;
import com.ssafy.vinopener.domain.recommendation.data.entity.ContentRecommendationEntity;
import com.ssafy.vinopener.domain.recommendation.data.entity.enums.ContentRecommendationType;
import com.ssafy.vinopener.domain.recommendation.data.mapper.RecommendationMapper;
import com.ssafy.vinopener.domain.recommendation.repository.ContentRecommendationRepository;
import com.ssafy.vinopener.domain.tastingnote.repository.TastingNoteRepository;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.repository.WineRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Sort;
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

    public void createRecommendation() {
        List<WineEntity> wineList = wineRepository.findAll(Sort.by(Sort.Direction.DESC, "view"));

        for (int i = 0; i < 10; i++) {
            ContentRecommendationEntity recommendationEntity = ContentRecommendationEntity.builder()
                    .wine(wineList.get(i))
                    .contentRecommendationType(ContentRecommendationType.VIEW)
                    .build();

            contentRecommendationRepository.save(recommendationEntity);
        }
    }

}
