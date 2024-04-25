package com.ssafy.vinopener.domain.tastingnote.data.mapper;

import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetResponse.TastingNoteGetFlavourResponse;
import com.ssafy.vinopener.domain.tastingnote.data.entity.TastingNoteFlavourEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class})
public interface TastingNoteFlavourMapper {

    @Mapping(target = "type", source = "entity.flavourTaste.flavourType.name")
    @Mapping(target = "taste", source = "entity.flavourTaste.name")
    TastingNoteGetFlavourResponse toFlavourResponse(TastingNoteFlavourEntity entity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "tastingNote", source = "tastingNoteId")
    @Mapping(target = "flavourTaste", source = "flavourTasteId")
    TastingNoteFlavourEntity toEntity(Long tastingNoteId, Long flavourTasteId);

}
