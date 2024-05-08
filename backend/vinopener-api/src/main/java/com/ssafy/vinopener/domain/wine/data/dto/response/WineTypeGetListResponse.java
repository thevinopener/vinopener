package com.ssafy.vinopener.domain.wine.data.dto.response;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import lombok.Builder;

@Builder
public record WineTypeGetListResponse(
        Long id,
        String imageUrl,
        String name,
        String winery,
        String country,
        WineType type,
        Integer view
) {

}
