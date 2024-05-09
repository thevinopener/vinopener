package com.ssafy.vinopener.domain.feed.data.mapper;

import com.ssafy.vinopener.domain.feed.data.dto.request.FeedCreateRequest;
import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetListResponse;
import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetResponse;
import com.ssafy.vinopener.domain.feed.data.entity.FeedEntity;
import com.ssafy.vinopener.domain.feed.data.entity.FeedWineEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import java.util.List;
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
    @Mapping(target = "wines", source = "feedWineEntity")
    @Mapping(target = "creator.nickname", source = "entity.user.nickname")
    @Mapping(target = "creator.imageUrl", source = "entity.user.imageUrl")
    @Mapping(target = "totalLikes", source = "totalLikes")
    @Mapping(target = "myLike", source = "myLike")
    FeedGetResponse toGetResponse(FeedEntity entity, List<FeedWineEntity> feedWineEntity, int totalLikes,
            boolean myLike);

    @Mapping(target = "id", source = "entity.id")
    @Mapping(target = "content", source = "entity.content")
    @Mapping(target = "imageUrl", source = "entity.imageUrl")
    @Mapping(target = "isPublic", source = "entity.isPublic")
    @Mapping(target = "wines", source = "feedWineEntity")
    @Mapping(target = "creator.nickname", source = "entity.user.nickname")
    @Mapping(target = "creator.imageUrl", source = "entity.user.imageUrl")
    @Mapping(target = "totalLikes", source = "totalLikes")
    @Mapping(target = "myLike", source = "myLike")
    FeedGetListResponse toGetListResponse(FeedEntity entity, List<FeedWineEntity> feedWineEntity, int totalLikes,
            boolean myLike);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "user", source = "userId")
    @Mapping(target = "content", source = "request.content")
    @Mapping(target = "isPublic", source = "request.isPublic")
    @Mapping(target = "wine", ignore = true)
    @Mapping(target = "like", ignore = true)
    // Service에서  처리
    @Mapping(target = "imageUrl", ignore = true)
    FeedEntity toEntity(Long userId, FeedCreateRequest request);

}

