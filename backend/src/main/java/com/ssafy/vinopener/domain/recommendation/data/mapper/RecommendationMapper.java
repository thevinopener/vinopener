package com.ssafy.vinopener.domain.recommendation.data.mapper;

import com.ssafy.vinopener.domain.recommendation.data.dto.response.RecommendationGetListResponse;
import com.ssafy.vinopener.domain.recommendation.data.entity.ContentRecommendationEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class})
public interface RecommendationMapper {

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "wineId", source = "id")
    RecommendationGetListResponse toGetListResponse(WineEntity entity);

    @Mapping(target = "id", source = "id")
    @Mapping(target = "wineId", source = "wine.id")
    @Mapping(target = "name", source = "wine.name")
    @Mapping(target = "winery", source = "wine.winery")
    @Mapping(target = "imageUrl", source = "wine.imageUrl")
    @Mapping(target = "country", source = "wine.country")
    RecommendationGetListResponse toGetListResponse(ContentRecommendationEntity entity);

}
