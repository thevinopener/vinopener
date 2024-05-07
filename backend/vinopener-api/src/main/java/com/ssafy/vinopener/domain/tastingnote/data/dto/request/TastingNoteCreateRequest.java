package com.ssafy.vinopener.domain.tastingnote.data.dto.request;

import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java.math.BigDecimal;
import java.util.Set;

public record TastingNoteCreateRequest(
        @NotNull Long wineId,
        @NotNull Long colorId,
        @NotNull Set<Long> flavourTasteIds,
        @NotNull @Min(0) @Max(5) @Digits(integer = 1, fraction = 1) BigDecimal sweetness,
        @NotNull @Min(0) @Max(5) @Digits(integer = 1, fraction = 1) BigDecimal intensity,
        @NotNull @Min(0) @Max(5) @Digits(integer = 1, fraction = 1) BigDecimal acidity,
        @NotNull @Min(0) @Max(5) @Digits(integer = 1, fraction = 1) BigDecimal alcohol,
        @NotNull @Min(0) @Max(5) @Digits(integer = 1, fraction = 1) BigDecimal tannin,
        @NotNull @Size(max = 255) String opinion,
        @NotNull @Min(0) @Max(5) @Digits(integer = 1, fraction = 1) BigDecimal rating
) {

}
