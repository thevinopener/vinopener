package com.ssafy.vinopener.domain.cellar.data.dto.response;

import lombok.Builder;

@Builder
public record CellarStatusGetResponse(
        boolean isCellar
) {

}
