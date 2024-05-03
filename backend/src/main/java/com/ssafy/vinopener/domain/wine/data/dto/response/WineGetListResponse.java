package com.ssafy.vinopener.domain.wine.data.dto.response;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import java.math.BigDecimal;
import lombok.Builder;

@Builder
public record WineGetListResponse(
        Long id,
        String name,
        String seoName,
        String imageUrl,
        String grape,
        String winery,
        String country,
        BigDecimal price,
        BigDecimal rating,
        Integer vintage,
        WineType type,
        BigDecimal acidity,
        BigDecimal intensity,
        BigDecimal sweetness,
        BigDecimal tannin,
        BigDecimal abv,
        Integer view
) {

}
