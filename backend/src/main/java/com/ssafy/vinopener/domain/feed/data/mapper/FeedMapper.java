package com.ssafy.vinopener.domain.feed.data.mapper;

import com.ssafy.vinopener.domain.feed.data.dto.request.FeedCreateRequest;
import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetListResponse;
import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetResponse;
import com.ssafy.vinopener.domain.feed.data.entity.FeedEntity;
import com.ssafy.vinopener.domain.feed.data.entity.FeedLikeEntity;
import com.ssafy.vinopener.domain.feed.data.entity.FeedWineEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class, FeedLikeMapper.class, FeedWineMapper.class})
public interface FeedMapper {

    @Mapping(target = "id", source = "entity.id")
    @Mapping(target = "content", source = "entity.content")
    @Mapping(target = "imageUrl", source = "entity.imageUrl")
    @Mapping(target = "isPublic", source = "entity.isPublic")
    @Mapping(target = "wine", source = "feedWineEntity")
    @Mapping(target = "like", source = "feedLikeEntity")
    FeedGetResponse toGetResponse(FeedEntity entity, FeedWineEntity feedWineEntity, FeedLikeEntity feedLikeEntity);

    @Mapping(target = "id", source = "entity.id")
    @Mapping(target = "content", source = "entity.content")
    @Mapping(target = "imageUrl", source = "entity.imageUrl")
    @Mapping(target = "isPublic", source = "entity.isPublic")
    @Mapping(target = "wine", source = "feedWineEntity")
    @Mapping(target = "like", source = "feedLikeEntity")
    FeedGetListResponse toGetListResponse(FeedEntity entity, FeedWineEntity feedWineEntity,
            FeedLikeEntity feedLikeEntity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "user.id", source = "userId")
    @Mapping(target = "content", source = "request.content")
    @Mapping(target = "isPublic", source = "request.isPublic")
    @Mapping(target = "imageUrl", ignore = true)
        // Service에서  처리
    FeedEntity toEntity(Long userId, FeedCreateRequest request);

}

