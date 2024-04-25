package com.ssafy.vinopener.domain.tastingnote.data.dto.response;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import lombok.Builder;

import java.math.BigDecimal;
import java.util.List;

@Builder
public record TastingNoteGetResponse(
        Long id,
        TastingNoteGetWineResponse wine,
        TastingNoteGetColorResponse color,
        BigDecimal sweetness,
        BigDecimal intensity,
        BigDecimal acidity,
        BigDecimal alcohol,
        BigDecimal tannin,
        String opinion,
        BigDecimal rating,
        List<TastingNoteGetFlavourResponse> flavours
) {

    @Builder
    public record TastingNoteGetWineResponse(
            Long id,
            String name,
            String imageUrl,
            String winery,
            String country,
            WineType type
            // TODO: wine flavours
    ) {

    }

    @Builder
    public record TastingNoteGetColorResponse(
            Long id,
            String name
    ) {

    }

    @Builder
    public record TastingNoteGetFlavourResponse(
            Long id,
            String type,
            String taste
    ) {

    }

}
