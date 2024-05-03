package com.ssafy.vinopener.domain.cellar.data.dto.request;

import java.time.LocalDate;

public record CellarCreateRequest(
        Long wineId,
        LocalDate finishedDate

) {

}
