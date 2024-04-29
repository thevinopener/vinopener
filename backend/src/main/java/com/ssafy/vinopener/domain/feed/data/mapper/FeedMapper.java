package com.ssafy.vinopener.domain.feed.data.mapper;

import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetListResponse;
import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetListResponse.FeedGetListLikeResponse;
import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetResponse;
import com.ssafy.vinopener.domain.feed.data.entity.FeedEntity;
import com.ssafy.vinopener.domain.user.data.mapper.UserMapper;
import com.ssafy.vinopener.domain.wine.data.mapper.WineMapper;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import java.util.List;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class, UserMapper.class, FeedLikeMapper.class, WineMapper.class})
public interface FeedMapper {

    @Mappings({
            @Mapping(target = "id", ignore = true),
            @Mapping(target = "content", source = "content"),
            @Mapping(target = "imageUrl", source = "imageUrl"),
            @Mapping(target = "isPublic", source = "isPublic"),
            @Mapping(target = "userNickname", source = "user.nickname"),
            @Mapping(target = "userImageUrl", source = "user.imageUrl"),
            @Mapping(target = "likes", source = "likeEntities"),
            @Mapping(target = "wine", source = "wine")
    })
    FeedGetResponse toGetResponse(FeedEntity entity, List<FeedGetListLikeResponse> likeEntities);

    @Mappings({
            @Mapping(target = "id", ignore = true),
            @Mapping(target = "content", source = "content"),
            @Mapping(target = "imageUrl", source = "imageUrl"),
            @Mapping(target = "isPublic", source = "isPublic"),
            @Mapping(target = "userNickname", source = "user.nickname"),
            @Mapping(target = "userImageUrl", source = "user.imageUrl"),
            @Mapping(target = "likes", source = "likeEntities"),
            @Mapping(target = "wine", source = "wine")
    })
    FeedGetListResponse toGetListResponse(FeedEntity entity,
            List<FeedGetListLikeResponse> likeEntities);

}
