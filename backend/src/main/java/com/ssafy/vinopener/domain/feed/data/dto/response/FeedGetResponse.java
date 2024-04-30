package com.ssafy.vinopener.domain.feed.data.dto.response;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import java.math.BigDecimal;
import lombok.Builder;

@Builder
public record FeedGetResponse(
        Long id,
        String content,
        String imageUrl,
        boolean isPublic,

        FeedGetLikeResponse like,
        FeedGetWineResponse wine
//        LocalDateTime createdTime

) {

    @Builder
    public record FeedGetWineResponse(
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
    public record FeedGetLikeResponse(
            Long id,
            String nickname,
            String imageUrl
    ) {

    }

}
