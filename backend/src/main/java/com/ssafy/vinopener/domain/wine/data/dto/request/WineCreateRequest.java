package com.ssafy.vinopener.domain.wine.data.dto.request;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import com.ssafy.vinopener.global.config.TimeFormatConfig;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * DTO 예제입니다. 실제로 사용하지 않습니다. validation 어노테이션은 요청에서만 사용합니다.
 */
public record WineCreateRequest(
        @NotBlank @Size(max = 255) String name,
        @NotBlank @Size(max = 512) String imageUrl,
        @NotBlank @Size(max = 255) String grape,
        @NotBlank @Size(max = 255) String winery,
        @NotBlank @Size(max = 255) String country,
        @NotNull @Min(0) @Max(5) BigDecimal price,
        @NotNull @Min(0) @Max(5) BigDecimal rating,
        @NotNull @Positive Integer vintage,
        @NotNull WineType type,
        @NotNull @Min(0) @Max(5) BigDecimal acidity,
        @NotNull @Min(0) @Max(5) BigDecimal intensity,
        @NotNull @Min(0) @Max(5) BigDecimal sweetness,
        @NotNull @Min(0) @Max(5) BigDecimal tannin,
        @NotNull @Min(0) @Max(5) BigDecimal abv,
        @Schema(type = "string", example = TimeFormatConfig.LOCAL_DATE_TIME_EXAMPLE)
        @NotNull @FutureOrPresent LocalDateTime createdTime
) {

}
