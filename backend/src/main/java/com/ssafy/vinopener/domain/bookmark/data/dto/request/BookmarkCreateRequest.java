package com.ssafy.vinopener.domain.bookmark.data.dto.request;

import com.ssafy.vinopener.global.config.TimeFormatConfig;
import io.swagger.v3.oas.annotations.media.Schema;
import java.time.LocalDateTime;

public record BookmarkCreateRequest(
        Long wineId,

        @Schema(type = "string", example = TimeFormatConfig.LOCAL_DATE_TIME_EXAMPLE)
        LocalDateTime createdTime

) {

}
