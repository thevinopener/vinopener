package com.ssafy.vinopener.domain.wine.data.mapper;

import com.ssafy.vinopener.domain.wine.data.dto.request.WineCreateRequest;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetListResponse;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetResponse;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineTypeGetListResponse;
import com.ssafy.vinopener.domain.wine.data.entity.FlavourTasteEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import java.util.List;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR)
public interface WineMapper {

//    WineGetResponse toGetResponse(WineEntity entity);
//
//    WineGetListResponse toGetListResponse(WineEntity entity);

    @Mapping(target = "tastes", source = "flavourTasteEntity")
    @Mapping(target = "isBookmark", source = "isBookmark")
    @Mapping(target = "isCellar", source = "isCellar")
    @Mapping(target = "totalNotes", source = "totalNotes")
    WineGetResponse toGetResponse(WineEntity entity, List<FlavourTasteEntity> flavourTasteEntity, boolean isBookmark,
            boolean isCellar, int totalNotes);

    @Mapping(target = "isBookmark", source = "isBookmark")
    @Mapping(target = "isCellar", source = "isCellar")
    @Mapping(target = "totalNotes", source = "totalNotes")
    WineGetListResponse toGetListResponse(WineEntity entity, boolean isBookmark, boolean isCellar, int totalNotes);

    WineTypeGetListResponse toGetTypeResponse(WineEntity entity);

    /**
     * 예제입니다. 실제로 사용하지 않습니다.
     */
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "view", ignore = true)
    WineEntity toEntity(WineCreateRequest request);

}
