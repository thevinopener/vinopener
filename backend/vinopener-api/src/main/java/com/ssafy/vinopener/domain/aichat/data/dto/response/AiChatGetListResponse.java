package com.ssafy.vinopener.domain.aichat.data.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ssafy.vinopener.global.config.TimeFormatConfig;
import io.swagger.v3.oas.annotations.media.Schema;
import java.time.LocalDateTime;
import lombok.Builder;

@Builder
public record AiChatGetListResponse(
        Long id,
        String message,
        Boolean isBot,
        @Schema(type = "string", example = TimeFormatConfig.LOCAL_DATE_TIME_EXAMPLE)
        @JsonFormat(pattern = TimeFormatConfig.LOCAL_DATE_TIME_PATTERN)
        LocalDateTime createdTime
) {

}
