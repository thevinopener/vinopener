package com.ssafy.vinopener.domain.tastingnote.data.mapper;

import com.ssafy.vinopener.domain.tastingnote.data.dto.request.TastingNoteCreateRequest;
import com.ssafy.vinopener.domain.tastingnote.data.dto.request.TastingNoteUpdateRequest;
import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetListResponse;
import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetResponse;
import com.ssafy.vinopener.domain.tastingnote.data.entity.TastingNoteEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {TastingNoteFlavourMapper.class, ReferenceMapper.class})
public interface TastingNoteMapper {

    TastingNoteGetResponse toGetResponse(TastingNoteEntity entity);

    TastingNoteGetListResponse toGetListResponse(TastingNoteEntity entity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "user", source = "userId")
    @Mapping(target = "wine", source = "request.wineId")
    @Mapping(target = "color", source = "request.colorId")
    @Mapping(target = "flavours", ignore = true)
    TastingNoteEntity toEntity(TastingNoteCreateRequest request, Long userId);

    @Mapping(target = "user", ignore = true)
    @Mapping(target = "wine", ignore = true)
    @Mapping(target = "color", source = "request.colorId")
    @Mapping(target = "flavours", ignore = true)
    TastingNoteEntity toEntity(Long id, TastingNoteUpdateRequest request);

}
