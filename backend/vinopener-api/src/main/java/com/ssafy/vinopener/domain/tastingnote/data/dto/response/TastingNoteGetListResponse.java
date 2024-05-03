package com.ssafy.vinopener.domain.tastingnote.data.dto.response;

import java.math.BigDecimal;
import java.util.List;
import lombok.Builder;

@Builder
public record TastingNoteGetListResponse(
        Long id,
        TastingNoteGetListResponseWine wine,
        TastingNoteGetListResponseColor color,
        BigDecimal rating,
        List<TastingNoteGetListResponseFlavour> flavours
) {

    @Builder
    public record TastingNoteGetListResponseWine(
            Long id,
            String name,
            String imageUrl,
            String winery,
            String country
    ) {

    }

    @Builder
    public record TastingNoteGetListResponseColor(
            Long id,
            String name
    ) {

    }

    @Builder
    public record TastingNoteGetListResponseFlavour(
            Long id,
            String taste
    ) {

    }

}
