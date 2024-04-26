package com.ssafy.vinopener.domain.preference.data.dto.response;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import java.math.BigDecimal;
import lombok.Builder;

@Builder
public record PreferenceGetResponse(
        WineType type,
        Integer minAbv,
        Integer maxAbv,
        BigDecimal sweetness,
        BigDecimal acidity,
        BigDecimal tannin
) {

}
