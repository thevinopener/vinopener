package com.ssafy.vinopener.domain.recommendation.controller;

import com.ssafy.vinopener.domain.recommendation.data.dto.response.RecommendationGetListResponse;
import com.ssafy.vinopener.domain.recommendation.service.RecommendationService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/recommendations")
@RequiredArgsConstructor
public class RecommendationController {

    private final RecommendationService recommendationService;

    @GetMapping("/view")
    public ResponseEntity<?> viewRecommendation() {
        List<RecommendationGetListResponse> recommendationList = recommendationService.getViewRecommendation();
        return ResponseEntity.ok(recommendationList);
    }

    @GetMapping("/cellar")
    public ResponseEntity<?> cellarRecommendation() {
        //Cellar의 경우, CellarRepository에서 GroupBy 와인으로 묶고, 각 와인별 유저 수를 내림차순으로 정렬하는 쿼리를 작성해야함.
        return ResponseEntity.ok().build();
    }

    @GetMapping("/rate")
    public ResponseEntity<?> rateRecommendation() {
        List<RecommendationGetListResponse> recommendationList = recommendationService.getRateRecommendation();
        return ResponseEntity.ok(recommendationList);
    }

    @GetMapping("/preference")
    public ResponseEntity<?> preferenceRecommendation() {
        return ResponseEntity.ok().build();
    }

    @GetMapping("/tasting-note")
    public ResponseEntity<?> tastingNoteRecommendation() {
        return ResponseEntity.ok().build();
    }

}
