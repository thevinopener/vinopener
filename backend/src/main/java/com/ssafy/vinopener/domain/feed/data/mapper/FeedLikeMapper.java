package com.ssafy.vinopener.domain.feed.data.mapper;

import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetListResponse.FeedGetListLikeResponse;
import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetResponse.FeedGetLikeResponse;
import com.ssafy.vinopener.domain.feed.data.entity.FeedEntity;
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
        uses = {ReferenceMapper.class})
public interface FeedLikeMapper {

    @Mapping(target = "id", source = "id")
    @Mapping(target = "feedId", source = "feed.id")
    @Mapping(target = "userId", source = "user.id")
    FeedGetLikeResponse toLikeResponse(FeedLikeEntity feedLikeEntity);

    @Mapping(target = "id", source = "id")
    @Mapping(target = "feedId", source = "feed.id")
    @Mapping(target = "userId", source = "user.id")
    FeedGetListLikeResponse toLikeListResponse(FeedLikeEntity feedLikeEntity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "feed", source = "feed")
    @Mapping(target = "user", source = "user")
    FeedLikeEntity toEntity(FeedEntity feed, UserEntity user);

}
