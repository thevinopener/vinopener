package com.ssafy.vinopener.domain.bookmark.data.dto.response;

import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetListResponse;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import lombok.Builder;
import java.math.BigDecimal;


@Builder
public record BookmarkGetListResponse(
    Long id,
    WineGetListResponse wine

) {
    @Builder
    public record WineGetListResponse(
            Long id,
            String name,
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
