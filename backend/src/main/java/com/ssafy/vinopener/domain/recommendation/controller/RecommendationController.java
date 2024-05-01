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
        return ResponseEntity.ok().build();
    }

    @GetMapping("/rate")
    public ResponseEntity<?> rateRecommendation() {
        return ResponseEntity.ok().build();
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
