package com.ssafy.vinopener.domain.tastingnote.data.mapper;

import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetListResponse.TastingNoteGetListResponseFlavour;
import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetResponse.TastingNoteGetResponseFlavour;
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
    TastingNoteGetResponseFlavour toFlavourResponse(TastingNoteFlavourEntity entity);

    @Mapping(target = "taste", source = "entity.flavourTaste.name")
    TastingNoteGetListResponseFlavour toFlavourListResponse(TastingNoteFlavourEntity entity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "tastingNote", source = "tastingNoteId")
    @Mapping(target = "flavourTaste", source = "flavourTasteId")
    TastingNoteFlavourEntity toEntity(Long tastingNoteId, Long flavourTasteId);

}
