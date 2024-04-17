package com.ssafy.vinopener.domain.wine.data.mapper;

import com.ssafy.vinopener.domain.wine.data.dto.request.WineCreateRequest;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetResponse;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR)
public interface WineMapper {
    WineGetResponse toGetResponse(WineEntity entity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "view", ignore = true)
    WineEntity toEntity(WineCreateRequest dto);
}
