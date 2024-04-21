package com.ssafy.vinopener.domain.wine.data.dto.response;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import lombok.Builder;

@Builder
public record WineGetListResponse(
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
        Integer vintage,
        WineType type,
        Integer view
) {

}
