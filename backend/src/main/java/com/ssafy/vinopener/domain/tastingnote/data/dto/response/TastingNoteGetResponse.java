package com.ssafy.vinopener.domain.tastingnote.data.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import com.ssafy.vinopener.global.config.TimeFormatConfig;
import io.swagger.v3.oas.annotations.media.Schema;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Set;
import lombok.Builder;

@Builder
public record TastingNoteGetResponse(
        Long id,
        TastingNoteGetWineResponse wine,
        TastingNoteGetColorResponse color,
        BigDecimal sweetness,
        BigDecimal intensity,
        BigDecimal acidity,
        BigDecimal alcohol,
        BigDecimal tannin,
        String opinion,
        BigDecimal rating,
        Set<TastingNoteGetFlavourResponse> flavours,
        @Schema(type = "string", example = TimeFormatConfig.LOCAL_DATE_TIME_EXAMPLE)
        @JsonFormat(pattern = TimeFormatConfig.LOCAL_DATE_TIME_PATTERN)
        LocalDateTime updatedTime
) {

    @Builder
    public record TastingNoteGetWineResponse(
            Long id,
            String name,
            String imageUrl,
            String winery,
            String country,
            WineType type
    ) {

    }

    @Builder
    public record TastingNoteGetColorResponse(
            Long id,
            String name
    ) {

    }

    @Builder
    public record TastingNoteGetFlavourResponse(
            Long id,
            String type,
            String taste
    ) {

    }

}
