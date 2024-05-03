package com.ssafy.vinopener.domain.feed.data.mapper;

import com.ssafy.vinopener.domain.feed.data.entity.FeedEntity;
import com.ssafy.vinopener.domain.feed.data.entity.FeedLikeEntity;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.user.data.mapper.UserMapper;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class, UserMapper.class})
public interface FeedLikeMapper {

//    @Mapping(target = "id", source = "id")
//    @Mapping(target = "nickname", source = "user.nickname")
//    @Mapping(target = "imageUrl", source = "user.imageUrl")
//    FeedGetUserResponse toLikeResponse(UserEntity userEntity);
//
//    @Mapping(target = "id", source = "id")
//    @Mapping(target = "nickname", source = "user.nickname")
//    @Mapping(target = "imageUrl", source = "user.imageUrl")
//    FeedGetListUserResponse toLikeListResponse(UserEntity userEntity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "user", source = "user")
    @Mapping(target = "feed", source = "feed")
    FeedLikeEntity toEntity(UserEntity user, FeedEntity feed);

}
