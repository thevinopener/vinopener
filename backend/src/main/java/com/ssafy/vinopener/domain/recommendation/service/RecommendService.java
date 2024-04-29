package com.ssafy.vinopener.domain.recommendation.service;

import com.ssafy.vinopener.domain.recommendation.data.dto.response.RecommendationGetListResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RecommendService {

    public RecommendationGetListResponse getViewRecommendation() {
        return new RecommendationGetListResponse();
    }

    public RecommendationGetListResponse getCellarRecommendation() {
        return new RecommendationGetListResponse();
    }

    public RecommendationGetListResponse getRateRecommendation() {
        return new RecommendationGetListResponse();
    }

    public RecommendationGetListResponse getPreferenceRecommendation() {
        return new RecommendationGetListResponse();
    }

    public RecommendationGetListResponse getTastingNoteRecommendation() {
        return new RecommendationGetListResponse();
    }

}
