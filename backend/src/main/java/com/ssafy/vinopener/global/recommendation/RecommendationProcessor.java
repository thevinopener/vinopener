package com.ssafy.vinopener.global.recommendation;

import com.ssafy.vinopener.domain.preference.repository.PreferenceRepository;
import com.ssafy.vinopener.domain.recommendation.data.dto.response.RecommendationGetListResponse;
import com.ssafy.vinopener.domain.recommendation.data.mapper.RecommendationMapper;
import com.ssafy.vinopener.domain.tastingnote.repository.TastingNoteRepository;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.repository.WineRepository;
import java.util.ArrayList;
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

    public List<RecommendationGetListResponse> processRecommendation() {
        List<RecommendationGetListResponse> recommendationList = new ArrayList<RecommendationGetListResponse>();
        List<WineEntity> wineList = wineRepository.findAll(Sort.by(Sort.Direction.DESC, "view"));
        for (int i = 0; i < 10; i++) {
            RecommendationGetListResponse recommendationResponse = recommendationMapper.toGetListResponse(
                    wineList.get(i));
            recommendationList.add(recommendationResponse);
            log.info("recommendationList: {}, view : {}", recommendationResponse.toString(), wineList.get(i).getView());
        }
        return recommendationList;
    }

    public List<RecommendationGetListResponse> createRecommendation() {
        return null;
    }

}
