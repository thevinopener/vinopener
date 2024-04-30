package com.ssafy.vinopener.domain.feed.data.mapper;

import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetListResponse.FeedGetListWineResponse;
import com.ssafy.vinopener.domain.feed.data.dto.response.FeedGetResponse.FeedGetWineResponse;
import com.ssafy.vinopener.domain.feed.data.entity.FeedWineEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class, WineEntity.class})
public interface FeedWineMapper {

    @Mappings({
            @Mapping(target = "id", source = "feedWineEntity.wine.id"),
            @Mapping(target = "name", source = "feedWineEntity.wine.name"),
            @Mapping(target = "seoName", source = "feedWineEntity.wine.seoName"),
            @Mapping(target = "imageUrl", source = "feedWineEntity.wine.imageUrl"),
            @Mapping(target = "grape", source = "feedWineEntity.wine.grape"),
            @Mapping(target = "winery", source = "feedWineEntity.wine.winery"),
            @Mapping(target = "country", source = "feedWineEntity.wine.country"),
            @Mapping(target = "price", source = "feedWineEntity.wine.price"),
            @Mapping(target = "rating", source = "feedWineEntity.wine.rating"),
            @Mapping(target = "vintage", source = "feedWineEntity.wine.vintage"),
            @Mapping(target = "type", source = "feedWineEntity.wine.type"),
            @Mapping(target = "acidity", source = "feedWineEntity.wine.acidity"),
            @Mapping(target = "intensity", source = "feedWineEntity.wine.intensity"),
            @Mapping(target = "sweetness", source = "feedWineEntity.wine.sweetness"),
            @Mapping(target = "tannin", source = "feedWineEntity.wine.tannin"),
            @Mapping(target = "abv", source = "feedWineEntity.wine.abv"),
            @Mapping(target = "view", source = "feedWineEntity.wine.view")
    })
    FeedGetWineResponse toWineResponse(FeedWineEntity feedWineEntity);

    @Mappings({
            @Mapping(target = "id", source = "feedWineEntity.wine.id"),
            @Mapping(target = "name", source = "feedWineEntity.wine.name"),
            @Mapping(target = "seoName", source = "feedWineEntity.wine.seoName"),
            @Mapping(target = "imageUrl", source = "feedWineEntity.wine.imageUrl"),
            @Mapping(target = "grape", source = "feedWineEntity.wine.grape"),
            @Mapping(target = "winery", source = "feedWineEntity.wine.winery"),
            @Mapping(target = "country", source = "feedWineEntity.wine.country"),
            @Mapping(target = "price", source = "feedWineEntity.wine.price"),
            @Mapping(target = "rating", source = "feedWineEntity.wine.rating"),
            @Mapping(target = "vintage", source = "feedWineEntity.wine.vintage"),
            @Mapping(target = "type", source = "feedWineEntity.wine.type"),
            @Mapping(target = "acidity", source = "feedWineEntity.wine.acidity"),
            @Mapping(target = "intensity", source = "feedWineEntity.wine.intensity"),
            @Mapping(target = "sweetness", source = "feedWineEntity.wine.sweetness"),
            @Mapping(target = "tannin", source = "feedWineEntity.wine.tannin"),
            @Mapping(target = "abv", source = "feedWineEntity.wine.abv"),
            @Mapping(target = "view", source = "feedWineEntity.wine.view")
    })
    FeedGetListWineResponse toWineListResponse(FeedWineEntity feedWineEntity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "feed", source = "feedId")
    @Mapping(target = "wine", source = "wineId")
    FeedWineEntity toEntity(Long feedId, Long wineId);

}
