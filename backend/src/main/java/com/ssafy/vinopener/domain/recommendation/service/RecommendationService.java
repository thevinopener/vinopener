package com.ssafy.vinopener.domain.recommendation.service;

import com.ssafy.vinopener.domain.recommendation.data.dto.response.RecommendationGetListResponse;
import com.ssafy.vinopener.domain.recommendation.data.entity.ContentRecommendationEntity;
import com.ssafy.vinopener.domain.recommendation.repository.BehaviorRecommendationRepository;
import com.ssafy.vinopener.domain.recommendation.repository.ContentRecommendationRepository;
import com.ssafy.vinopener.global.recommendation.RecommendationProcessor;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RecommendationService {

    private final ContentRecommendationRepository contentRecommendationRepository;
    private final BehaviorRecommendationRepository behaviorRecommendationRepository;
    private final RecommendationProcessor recommendationProcessor;

    public List<RecommendationGetListResponse> getViewRecommendation() {
        ContentRecommendationEntity contentRecommendationEntity
                = contentRecommendationRepository.findById(1L).orElse(null);

        List<RecommendationGetListResponse> recommendationResult;
        if (contentRecommendationEntity != null) {
            return null;
        }
        // 최초 실행시엔 테이블이 비어있을 수 있음.
        else {
            recommendationResult = recommendationProcessor.processRecommendation();
            for (RecommendationGetListResponse recommendation : recommendationResult) {
//                contentRecommendationRepository.save(recommendation);
            }
        }

        return null;
    }

    public List<RecommendationGetListResponse> getCellarRecommendation() {
        return null;
    }

    public List<RecommendationGetListResponse> getRateRecommendation() {
        return null;
    }

    public List<RecommendationGetListResponse> getPreferenceRecommendation() {
        return null;
    }

    public List<RecommendationGetListResponse> getTastingNoteRecommendation() {
        return null;
    }

}
