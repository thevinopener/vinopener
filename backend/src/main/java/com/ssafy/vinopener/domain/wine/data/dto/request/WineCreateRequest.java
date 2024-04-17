package com.ssafy.vinopener.domain.wine.data.dto.request;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;

public record WineCreateRequest(
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
        WineType type
) {
}
