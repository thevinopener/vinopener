package com.ssafy.vinopener.domain.feed.data.mapper;

import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class})
public interface FeedMapper {

//    @Mapping(target = "wines", source = "wineEntities")
//    @Mapping(target = "feedlikes", source = "feedLikeEntities")
//    FeedGetResponse toGetResponse(FeedEntity entity, List<WineEntity> wineEntities,
//            List<FeedLikeEntity> feedLikeEntities);

//    FeedGetListResponse toGetListResponse(FeedEntity feedEntity);

//    @Mapping(target = "id", ignore = true)
//    FeedEntity toEntity(Long userId, FeedCreateRequest feedCreateRequest);

}
