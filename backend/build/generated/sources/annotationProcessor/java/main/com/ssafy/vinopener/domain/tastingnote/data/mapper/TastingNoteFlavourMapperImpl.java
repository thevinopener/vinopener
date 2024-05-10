package com.ssafy.vinopener.domain.tastingnote.data.mapper;

import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetListResponse;
import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetResponse;
import com.ssafy.vinopener.domain.tastingnote.data.entity.TastingNoteEntity;
import com.ssafy.vinopener.domain.tastingnote.data.entity.TastingNoteFlavourEntity;
import com.ssafy.vinopener.domain.wine.data.entity.FlavourTasteEntity;
import com.ssafy.vinopener.domain.wine.data.entity.FlavourTypeEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import javax.annotation.processing.Generated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2024-04-30T22:24:01+0900",
    comments = "version: 1.5.5.Final, compiler: IncrementalProcessingEnvironment from gradle-language-java-8.7.jar, environment: Java 21.0.2 (Eclipse Adoptium)"
)
@Component
public class TastingNoteFlavourMapperImpl implements TastingNoteFlavourMapper {

    private final ReferenceMapper referenceMapper;

    @Autowired
    public TastingNoteFlavourMapperImpl(ReferenceMapper referenceMapper) {

        this.referenceMapper = referenceMapper;
    }

    @Override
    public TastingNoteGetResponse.TastingNoteGetFlavourResponse toFlavourResponse(TastingNoteFlavourEntity entity) {
        if ( entity == null ) {
            return null;
        }

        TastingNoteGetResponse.TastingNoteGetFlavourResponse.TastingNoteGetFlavourResponseBuilder tastingNoteGetFlavourResponse = TastingNoteGetResponse.TastingNoteGetFlavourResponse.builder();

        tastingNoteGetFlavourResponse.type( entityFlavourTasteFlavourTypeName( entity ) );
        tastingNoteGetFlavourResponse.taste( entityFlavourTasteName( entity ) );
        tastingNoteGetFlavourResponse.id( entity.getId() );

        return tastingNoteGetFlavourResponse.build();
    }

    @Override
    public TastingNoteGetListResponse.TastingNoteGetListFlavourResponse toFlavourListResponse(TastingNoteFlavourEntity entity) {
        if ( entity == null ) {
            return null;
        }

        TastingNoteGetListResponse.TastingNoteGetListFlavourResponse.TastingNoteGetListFlavourResponseBuilder tastingNoteGetListFlavourResponse = TastingNoteGetListResponse.TastingNoteGetListFlavourResponse.builder();

        tastingNoteGetListFlavourResponse.taste( entityFlavourTasteName( entity ) );
        tastingNoteGetListFlavourResponse.id( entity.getId() );

        return tastingNoteGetListFlavourResponse.build();
    }

    @Override
    public TastingNoteFlavourEntity toEntity(Long tastingNoteId, Long flavourTasteId) {
        if ( tastingNoteId == null && flavourTasteId == null ) {
            return null;
        }

        TastingNoteFlavourEntity.TastingNoteFlavourEntityBuilder tastingNoteFlavourEntity = TastingNoteFlavourEntity.builder();

        tastingNoteFlavourEntity.tastingNote( referenceMapper.resolve( TastingNoteEntity.class, tastingNoteId ) );
        tastingNoteFlavourEntity.flavourTaste( referenceMapper.resolve( FlavourTasteEntity.class, flavourTasteId ) );

        return tastingNoteFlavourEntity.build();
    }

    private String entityFlavourTasteFlavourTypeName(TastingNoteFlavourEntity tastingNoteFlavourEntity) {
        if ( tastingNoteFlavourEntity == null ) {
            return null;
        }
        FlavourTasteEntity flavourTaste = tastingNoteFlavourEntity.getFlavourTaste();
        if ( flavourTaste == null ) {
            return null;
        }
        FlavourTypeEntity flavourType = flavourTaste.getFlavourType();
        if ( flavourType == null ) {
            return null;
        }
        String name = flavourType.getName();
        if ( name == null ) {
            return null;
        }
        return name;
    }

    private String entityFlavourTasteName(TastingNoteFlavourEntity tastingNoteFlavourEntity) {
        if ( tastingNoteFlavourEntity == null ) {
            return null;
        }
        FlavourTasteEntity flavourTaste = tastingNoteFlavourEntity.getFlavourTaste();
        if ( flavourTaste == null ) {
            return null;
        }
        String name = flavourTaste.getName();
        if ( name == null ) {
            return null;
        }
        return name;
    }
}
