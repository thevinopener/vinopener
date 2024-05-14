package com.ssafy.vinopener.domain.recommendation.controller;

import com.ssafy.vinopener.domain.recommendation.data.dto.response.RecommendationGetListResponse;
import com.ssafy.vinopener.domain.recommendation.data.entity.enums.ContentRecommendationType;
import com.ssafy.vinopener.domain.recommendation.service.RecommendationService;
import com.ssafy.vinopener.global.annotations.UserPrincipalId;
import com.ssafy.vinopener.global.config.SwaggerConfig;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/recommendations")
@RequiredArgsConstructor
@Slf4j
public class RecommendationController {

    private final RecommendationService recommendationService;

    /**
     * 와인별 상세조회 수를 기반으로 추천
     *
     * @return 추천된 와인 List (10개)
     */
    @GetMapping("/view")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<?> viewRecommendation() {
        List<RecommendationGetListResponse> recommendationList
                = recommendationService.getContentRecommendation(ContentRecommendationType.VIEW);
        return ResponseEntity.ok(recommendationList);
    }

    /**
     * 다양한 사용자로부터 셀러에 많이 등록된 와인 추천
     *
     * @return 추천된 와인 List (10개)
     */
    @GetMapping("/cellar")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<?> cellarRecommendation() {
        //Cellar의 경우, CellarRepository에서 GroupBy 와인으로 묶고, 각 와인별 유저 수를 내림차순으로 정렬하는 쿼리를 작성해야함.
        List<RecommendationGetListResponse> recommendationList
                = recommendationService.getContentRecommendation(ContentRecommendationType.CELLAR);
        return ResponseEntity.ok(recommendationList);
    }

    /**
     * Wine DB에 등록된 평점 기반 추천
     *
     * @return 추천된 와인 List (10개)
     */
    @GetMapping("/rate")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<?> rateRecommendation() {
        List<RecommendationGetListResponse> recommendationList
                = recommendationService.getContentRecommendation(ContentRecommendationType.RATE);
        return ResponseEntity.ok(recommendationList);
    }

    /**
     * 사용자의 선호도 설문 기반 추천
     *
     * @param userId 유저 ID
     * @return 추천된 와인 List (10개)
     */
    @GetMapping("/preference")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<List<RecommendationGetListResponse>> preferenceRecommendation(
            @UserPrincipalId final Long userId
    ) {
        log.info("Preference userId: {}", userId);
        List<RecommendationGetListResponse> recommendationList
                = recommendationService.getPreferenceRecommendation(userId);

        return ResponseEntity.ok(recommendationList);
    }

    /**
     * 사용자가 작성한 테이스팅 노트 기반 추천
     *
     * @param userId 유저 ID
     * @return 추천된 와인 List (10개)
     */
    @GetMapping("/tasting-note")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<?> tastingNoteRecommendation(
            @UserPrincipalId final Long userId
    ) {
        List<RecommendationGetListResponse> recommendationList
                = recommendationService.getTastingNoteRecommendation(userId);
        return ResponseEntity.ok(recommendationList);
    }

    /**
     * 특정 와인의 id가 주어졌을 때, 해당 와인과 가장 유사한 다른 와인을 추천
     *
     * @param wineId 와인 ID
     * @return 추천된 와인 List(10개)
     */
    @GetMapping("/wine-detail")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<?> wineDetailRecommendation(
            @RequestParam("wineId") Long wineId
    ) {
        List<RecommendationGetListResponse> recommendationList
                = recommendationService.getWineDetailRecommendation(wineId);

        return ResponseEntity.ok(recommendationList);
    }

}
