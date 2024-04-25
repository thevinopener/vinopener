package com.ssafy.vinopener.domain.tastingnote.data.dto.request;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java.math.BigDecimal;
import java.util.List;

public record TastingNoteUpdateRequest(
        @NotNull Long colorId,
        @NotNull List<Long> flavourTasteIds,
        @NotNull @Min(0) @Max(5) BigDecimal sweetness,
        @NotNull @Min(0) @Max(5) BigDecimal intensity,
        @NotNull @Min(0) @Max(5) BigDecimal acidity,
        @NotNull @Min(0) @Max(5) BigDecimal alcohol,
        @NotNull @Min(0) @Max(5) BigDecimal tannin,
        @NotNull @Size(max = 255) String opinion,
        @NotNull @Min(0) @Max(5) BigDecimal rating
) {

}
