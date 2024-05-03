package com.ssafy.vinopener.domain.preference.data.dto.request;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import java.util.Set;

public record PreferenceCreateOrUpdateRequest(
        @NotNull Set<WineType> types,
        @NotNull @Min(0) @Max(100) Integer minAbv,
        @NotNull @Min(0) @Max(100) Integer maxAbv,
        @NotNull @Min(0) @Max(100) Integer sweetness,
        @NotNull @Min(0) @Max(100) Integer acidity,
        @NotNull @Min(0) @Max(100) Integer tannin
) {

}
