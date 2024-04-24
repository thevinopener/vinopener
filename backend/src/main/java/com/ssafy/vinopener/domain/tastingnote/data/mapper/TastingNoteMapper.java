package com.ssafy.vinopener.domain.tastingnote.data.mapper;

import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetListResponse;
import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetResponse;
import com.ssafy.vinopener.domain.tastingnote.data.entity.TastingNoteEntity;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR)
public interface TastingNoteMapper {

    TastingNoteGetResponse toGetResponse(TastingNoteEntity entity);

    TastingNoteGetListResponse toGetListResponse(TastingNoteEntity entity);

}
