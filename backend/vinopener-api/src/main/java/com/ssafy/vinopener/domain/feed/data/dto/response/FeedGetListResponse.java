package com.ssafy.vinopener.domain.feed.data.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import com.ssafy.vinopener.global.config.TimeFormatConfig;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import lombok.Builder;

@Builder
public record FeedGetListResponse(
        Long id,
        String content,
        String imageUrl,
        boolean isPublic,
        int totalLikes,

        FeedGetListUserResponse creator,

        List<FeedGetListWineResponse> wines,
        @Schema(type = "string", example = TimeFormatConfig.LOCAL_DATE_TIME_EXAMPLE)
        @JsonFormat(pattern = TimeFormatConfig.LOCAL_DATE_TIME_PATTERN)
        @NotNull @FutureOrPresent LocalDateTime createdTime

) {

    @Builder
    public record FeedGetListWineResponse(
            Long id,
            String name,
            String seoName,
            String imageUrl,
            String grape,
            String winery,
            String country,
            BigDecimal price,
            BigDecimal rating,
            BigDecimal vintage,
            WineType type,
            BigDecimal acidity,
            BigDecimal intensity,
            BigDecimal sweetness,
            BigDecimal tannin,
            BigDecimal abv,
            Integer view
    ) {

    }

    @Builder
    public record FeedGetListUserResponse(
            Long id,
            String nickname,
            String imageUrl
    ) {

    }

}
