package com.ssafy.vinopener.domain.feed.data.dto.response;

import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
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
        FeedGetListWineResponse wine,
        List<FeedGetListLikeResponse> likes,
        String userNickname,
        String userImageUrl,
        LocalDateTime createdTime
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
    public record FeedGetListLikeResponse(
            Long id,
            Long feedId,
            Long userId
    ) {

    }

}
