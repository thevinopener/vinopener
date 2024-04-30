package com.ssafy.vinopener.domain.feed.data.mapper;

import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetListResponse.FeedGetListLikeResponse;
import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetResponse.FeedGetLikeResponse;
import com.ssafy.vinopener.domain.feed.data.entity.FeedLikeEntity;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class, UserEntity.class})
public interface FeedLikeMapper {

    @Mapping(target = "id", source = "feedLikeEntity.user.id")
    @Mapping(target = "nickname", source = "feedLikeEntity.user.nickname")
    @Mapping(target = "imageUrl", source = "feedLikeEntity.user.imageUrl")
    FeedGetLikeResponse toLikeResponse(FeedLikeEntity feedLikeEntity);

    @Mapping(target = "id", source = "feedLikeEntity.user.id")
    @Mapping(target = "nickname", source = "feedLikeEntity.user.nickname")
    @Mapping(target = "imageUrl", source = "feedLikeEntity.user.imageUrl")
    FeedGetListLikeResponse toLikeListResponse(FeedLikeEntity feedLikeEntity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "user", source = "userId")
    @Mapping(target = "feed", source = "feedId")
    FeedLikeEntity toEntity(Long userId, Long feedId);

}
