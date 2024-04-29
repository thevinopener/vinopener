package com.ssafy.vinopener.domain.recommendation.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/recommendations")
@RequiredArgsConstructor
public class RecommendationController {

    @GetMapping("/view")
    public ResponseEntity<?> viewRecommendation() {
        return ResponseEntity.ok().build();
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
