package com.ssafy.vinopener.domain.cellar.data.mapper;

import com.ssafy.vinopener.domain.cellar.data.dto.request.CellarCreateRequest;
import com.ssafy.vinopener.domain.cellar.data.dto.request.CellarUpdateRequest;
import com.ssafy.vinopener.domain.cellar.data.dto.response.CellarGetListResponse;
import com.ssafy.vinopener.domain.cellar.data.dto.response.CellarGetResponse;
import com.ssafy.vinopener.domain.cellar.data.entity.CellarEntity;
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
public interface CellarMapper {

    CellarGetResponse toGetResponse(CellarEntity entity);

    CellarGetListResponse toGetListResponse(CellarEntity entity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "user", source = "userId")
    @Mapping(target = "wine", source = "request.wineId")
    @Mapping(target = "finishedDate", source = "request.finishedDate")
    CellarEntity toEntity(Long userId, CellarCreateRequest request, WineEntity wine);

    @Mapping(target = "user", ignore = true)
    @Mapping(target = "wine", ignore = true)
    @Mapping(target = "finishedDate", source = "request.finishedDate")
    CellarEntity toEntity(Long id, CellarUpdateRequest request);

}
