package com.ssafy.vinopener.domain.preference.data.dto.response;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import java.util.Set;
import lombok.Builder;

@Builder
public record PreferenceGetResponse(
        Set<WineType> types,
        Integer minAbv,
        Integer maxAbv,
        Integer sweetness,
        Integer acidity,
        Integer tannin
) {

}
