package com.ssafy.vinopener.domain.aichat.data.dto.request;

import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java.math.BigDecimal;
import java.util.List;

public record AiChatCreateRequest(
        @NotNull AiChatCreateRequestState state,
        @NotBlank @Size(max = 255) String message
) {

    public record AiChatCreateRequestState(
            Long tastingNoteId,
            Long wineId,
            Long colorId,
            @NotNull List<Long> flavourTasteIds,
            @Min(0) @Max(5) @Digits(integer = 1, fraction = 1) BigDecimal sweetness,
            @Min(0) @Max(5) @Digits(integer = 1, fraction = 1) BigDecimal intensity,
            @Min(0) @Max(5) @Digits(integer = 1, fraction = 1) BigDecimal acidity,
            @Min(0) @Max(5) @Digits(integer = 1, fraction = 1) BigDecimal alcohol,
            @Min(0) @Max(5) @Digits(integer = 1, fraction = 1) BigDecimal tannin,
            @NotNull @Size(max = 255) String opinion,
            @Min(0) @Max(5) @Digits(integer = 1, fraction = 1) BigDecimal rating
    ) {

    }

}
