package com.ssafy.vinopener.domain.wine.data.mapper;

import com.ssafy.vinopener.domain.wine.data.dto.request.WineCreateRequest;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetListResponse;
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

    WineGetListResponse toGetListResponse(WineEntity entity);

    /**
     * 예제입니다. 실제로 사용하지 않습니다.
     */
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "view", ignore = true)
    WineEntity toEntity(WineCreateRequest request);

}
