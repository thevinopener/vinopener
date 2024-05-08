package com.ssafy.vinopener.domain.cellar.data.dto.response;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import java.math.BigDecimal;
import java.time.LocalDate;
import lombok.Builder;

@Builder
public record CellarGetResponse(
        Long id,
        LocalDate finishedDate,
        CellarGetWineResponse wine

) {

    @Builder
    public record CellarGetWineResponse(
            Long id,
            String name,
            String seoName,
            String imageUrl,
            String grape,
            String winery,
            String country,
            BigDecimal price,
            BigDecimal rating,
            BigDecimal vintage,
            WineType type,
            BigDecimal acidity,
            BigDecimal intensity,
            BigDecimal sweetness,
            BigDecimal tannin,
            BigDecimal abv,
            Integer view
    ) {

    }

}
