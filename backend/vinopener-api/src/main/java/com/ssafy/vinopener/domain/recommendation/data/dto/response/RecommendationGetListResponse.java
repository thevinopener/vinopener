package com.ssafy.vinopener.domain.recommendation.data.dto.response;

import lombok.Builder;

@Builder
public record RecommendationGetListResponse(
        Long wineId,
        String name,
        String winery,
        String imageUrl,
        String country
) {

}
