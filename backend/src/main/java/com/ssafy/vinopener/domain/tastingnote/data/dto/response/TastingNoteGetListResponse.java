package com.ssafy.vinopener.domain.tastingnote.data.dto.response;

import java.math.BigDecimal;
import java.util.Set;
import lombok.Builder;

@Builder
public record TastingNoteGetListResponse(
        Long id,
        TastingNoteGetListWineResponse wine,
        TastingNoteGetListColorResponse color,
        BigDecimal rating,
        Set<TastingNoteGetListFlavourResponse> flavours
) {

    @Builder
    public record TastingNoteGetListWineResponse(
            Long id,
            String name,
            String imageUrl,
            String winery,
            String country
    ) {

    }

    @Builder
    public record TastingNoteGetListColorResponse(
            Long id,
            String name
    ) {

    }

    @Builder
    public record TastingNoteGetListFlavourResponse(
            Long id,
            String taste
    ) {

    }

}
