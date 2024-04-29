package com.ssafy.vinopener.domain.feed.data.mapper;

import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetListResponse.FeedGetListWineResponse;
import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetResponse.FeedGetWineResponse;
import com.ssafy.vinopener.domain.feed.data.entity.FeedWineEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class, FeedWineMapper.class})
public interface FeedWineMapper {

    @Mapping(source = "wine.id", target = "id")
    @Mapping(source = "wine.name", target = "name")
    @Mapping(source = "wine.seoName", target = "seoName")
    @Mapping(source = "wine.imageUrl", target = "imageUrl")
    @Mapping(source = "wine.grape", target = "grape")
    @Mapping(source = "wine.winery", target = "winery")
    @Mapping(source = "wine.country", target = "country")
    @Mapping(source = "wine.price", target = "price")
    @Mapping(source = "wine.rating", target = "rating")
    @Mapping(source = "wine.vintage", target = "vintage")
    @Mapping(source = "wine.type", target = "type")
    @Mapping(source = "wine.acidity", target = "acidity")
    @Mapping(source = "wine.intensity", target = "intensity")
    @Mapping(source = "wine.sweetness", target = "sweetness")
    @Mapping(source = "wine.tannin", target = "tannin")
    @Mapping(source = "wine.abv", target = "abv")
    @Mapping(source = "wine.view", target = "view")
    FeedGetWineResponse toWineResponse(FeedWineEntity entity);

    @Mapping(source = "wine.id", target = "id")
    @Mapping(source = "wine.name", target = "name")
    @Mapping(source = "wine.seoName", target = "seoName")
    @Mapping(source = "wine.imageUrl", target = "imageUrl")
    @Mapping(source = "wine.grape", target = "grape")
    @Mapping(source = "wine.winery", target = "winery")
    @Mapping(source = "wine.country", target = "country")
    @Mapping(source = "wine.price", target = "price")
    @Mapping(source = "wine.rating", target = "rating")
    @Mapping(source = "wine.vintage", target = "vintage")
    @Mapping(source = "wine.type", target = "type")
    @Mapping(source = "wine.acidity", target = "acidity")
    @Mapping(source = "wine.intensity", target = "intensity")
    @Mapping(source = "wine.sweetness", target = "sweetness")
    @Mapping(source = "wine.tannin", target = "tannin")
    @Mapping(source = "wine.abv", target = "abv")
    @Mapping(source = "wine.view", target = "view")
    FeedGetListWineResponse toWineListResponse(FeedWineEntity entity);

}
