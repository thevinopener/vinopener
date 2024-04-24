package com.ssafy.vinopener.domain.wine.data.dto.request;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import com.ssafy.vinopener.global.config.TimeFormatConfig;
import io.swagger.v3.oas.annotations.media.Schema;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 예제입니다. 실제로 사용하지 않습니다.
 */
public record WineCreateRequest(
        String name,
        String imageUrl,
        String grape,
        String winery,
        String country,
        BigDecimal price,
        BigDecimal rating,
        Integer vintage,
        WineType type,
        BigDecimal acidity,
        BigDecimal intensity,
        BigDecimal sweetness,
        BigDecimal tannin,
        BigDecimal abv,
        @Schema(type = "string", example = TimeFormatConfig.LOCAL_DATE_TIME_EXAMPLE)
        LocalDateTime createdTime
) {

}
