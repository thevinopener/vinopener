package com.ssafy.vinopener.domain.wine.data.mapper;

import com.ssafy.vinopener.domain.wine.data.dto.request.WineChatCreateRequest;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineChatGetOrGetListResponse;
import com.ssafy.vinopener.domain.wine.data.entity.WineChatEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class})
public interface WineChatMapper {

    WineChatGetOrGetListResponse toGetOrGetListResponse(WineChatEntity entity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "wine", source = "wineId")
    @Mapping(target = "user", source = "userId")
    WineChatEntity toEntity(WineChatCreateRequest request, Long wineId, Long userId);

}
