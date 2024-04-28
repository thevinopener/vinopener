package com.ssafy.vinopener.domain.cellar.data.dto.request;

import java.time.LocalDate;

public record CellarUpdateRequest(
        LocalDate finishedDate

//        @Schema(type = "string", example = TimeFormatConfig.LOCAL_DATE_TIME_EXAMPLE)
//        LocalDateTime createdTime
) {

}
