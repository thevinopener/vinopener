package com.ssafy.vinopener.domain.tastingnote.data.dto.response;

import java.math.BigDecimal;
import lombok.Builder;

@Builder
public record TastingNoteGetListResponse(
        Long id,
        WineResponse wine,
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

}
