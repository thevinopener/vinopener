package com.ssafy.vinopener.domain.tastingnote.data.dto.response;

import java.math.BigDecimal;
import lombok.Builder;

@Builder
public record TastingNoteGetListResponse(
        Long id,
        WineGetListResponse wine,
        String opinion,
        BigDecimal rating
) {

    @Builder
    public record WineGetListResponse(
            Long id
            // TODO
    ) {

    }

}
