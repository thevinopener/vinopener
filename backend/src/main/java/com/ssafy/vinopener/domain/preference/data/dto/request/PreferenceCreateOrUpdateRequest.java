package com.ssafy.vinopener.domain.preference.data.dto.request;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;

public record PreferenceCreateOrUpdateRequest(
        @NotNull WineType type,
        @NotNull @Min(0) @Max(29) Integer minAbv,
        @NotNull @Min(0) @Max(30) Integer maxAbv,
        @NotNull @Min(0) @Max(5) BigDecimal sweetness,
        @NotNull @Min(0) @Max(5) BigDecimal acidity,
        @NotNull @Min(0) @Max(5) BigDecimal tannin
) {

}
