package com.ssafy.vinopener.domain.tastingnote.data.dto.response;

import java.math.BigDecimal;
import lombok.Builder;

@Builder
public record TastingNoteGetListResponse(
        Long id,
        TastingNoteGetListWineResponse wine,
        String opinion,
        BigDecimal rating
) {

    @Builder
    public record TastingNoteGetListWineResponse(
            Long id
            // TODO
    ) {

    }

}
