package com.ssafy.vinopener.domain.cellar.data.dto.request;

import java.time.LocalDate;

public record CellarUpdateRequest(
        LocalDate finishedDate

) {

}
