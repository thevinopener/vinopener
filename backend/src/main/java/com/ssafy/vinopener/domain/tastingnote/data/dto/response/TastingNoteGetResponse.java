package com.ssafy.vinopener.domain.tastingnote.data.dto.response;

import java.math.BigDecimal;
import lombok.Builder;

@Builder
public record TastingNoteGetResponse(
        Long id,
        WineResponse wine,
        ColorResponse color,
        BigDecimal sweetness,
        BigDecimal intensity,
        BigDecimal acidity,
        BigDecimal alcohol,
        BigDecimal tannin,
        String opinion,
        BigDecimal rating,
        String imageUrl
) {

    @Builder
    public record WineResponse(
            Long id
            // TODO
    ) {

    }

    @Builder
    public record ColorResponse(
            Long id,
            String name
    ) {

    }

}