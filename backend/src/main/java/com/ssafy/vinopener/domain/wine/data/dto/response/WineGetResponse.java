package com.ssafy.vinopener.domain.wine.data.dto.response;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import lombok.Builder;

@Builder
public record WineGetResponse(
        Long id,
        String nameKo,
        String nameEn,
        String grape,
        String country,
        String region,
        Integer priceMin,
        Integer priceMax,
        Integer priceAvg,
        String winery,
        Integer year,
        WineType type,
        Integer view
) {
}
