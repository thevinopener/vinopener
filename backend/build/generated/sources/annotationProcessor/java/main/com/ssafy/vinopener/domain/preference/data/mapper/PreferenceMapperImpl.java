package com.ssafy.vinopener.domain.preference.data.mapper;

import com.ssafy.vinopener.domain.preference.data.dto.request.PreferenceCreateOrUpdateRequest;
import com.ssafy.vinopener.domain.preference.data.dto.response.PreferenceGetResponse;
import com.ssafy.vinopener.domain.preference.data.entity.PreferenceEntity;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
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
public class PreferenceMapperImpl implements PreferenceMapper {

    private final ReferenceMapper referenceMapper;

    @Autowired
    public PreferenceMapperImpl(ReferenceMapper referenceMapper) {

        this.referenceMapper = referenceMapper;
    }

    @Override
    public PreferenceGetResponse toGetResponse(PreferenceEntity entity) {
        if ( entity == null ) {
            return null;
        }

        PreferenceGetResponse.PreferenceGetResponseBuilder preferenceGetResponse = PreferenceGetResponse.builder();

        preferenceGetResponse.types( map( entity ) );
        preferenceGetResponse.minAbv( entity.getMinAbv() );
        preferenceGetResponse.maxAbv( entity.getMaxAbv() );
        preferenceGetResponse.sweetness( entity.getSweetness() );
        preferenceGetResponse.acidity( entity.getAcidity() );
        preferenceGetResponse.tannin( entity.getTannin() );

        return preferenceGetResponse.build();
    }

    @Override
    public PreferenceEntity toEntity(PreferenceCreateOrUpdateRequest request, Long userId) {
        if ( request == null && userId == null ) {
            return null;
        }

        PreferenceEntity.PreferenceEntityBuilder preferenceEntity = PreferenceEntity.builder();

        if ( request != null ) {
            preferenceEntity.minAbv( request.minAbv() );
            preferenceEntity.maxAbv( request.maxAbv() );
            preferenceEntity.sweetness( request.sweetness() );
            preferenceEntity.acidity( request.acidity() );
            preferenceEntity.tannin( request.tannin() );
        }
        preferenceEntity.user( referenceMapper.resolve( UserEntity.class, userId ) );
        preferenceEntity.isRed( request.types().contains(WineType.RED) );
        preferenceEntity.isWhite( request.types().contains(WineType.WHITE) );
        preferenceEntity.isRose( request.types().contains(WineType.ROSE) );
        preferenceEntity.isSparkling( request.types().contains(WineType.SPARKLING) );
        preferenceEntity.isDessert( request.types().contains(WineType.DESSERT) );
        preferenceEntity.isFortified( request.types().contains(WineType.FORTIFIED) );

        return preferenceEntity.build();
    }

    @Override
    public PreferenceEntity toEntity(Long id, PreferenceCreateOrUpdateRequest request, Long userId) {
        if ( id == null && request == null && userId == null ) {
            return null;
        }

        PreferenceEntity.PreferenceEntityBuilder preferenceEntity = PreferenceEntity.builder();

        if ( request != null ) {
            preferenceEntity.minAbv( request.minAbv() );
            preferenceEntity.maxAbv( request.maxAbv() );
            preferenceEntity.sweetness( request.sweetness() );
            preferenceEntity.acidity( request.acidity() );
            preferenceEntity.tannin( request.tannin() );
        }
        preferenceEntity.id( id );
        preferenceEntity.user( referenceMapper.resolve( UserEntity.class, userId ) );
        preferenceEntity.isRed( request.types().contains(WineType.RED) );
        preferenceEntity.isWhite( request.types().contains(WineType.WHITE) );
        preferenceEntity.isRose( request.types().contains(WineType.ROSE) );
        preferenceEntity.isSparkling( request.types().contains(WineType.SPARKLING) );
        preferenceEntity.isDessert( request.types().contains(WineType.DESSERT) );
        preferenceEntity.isFortified( request.types().contains(WineType.FORTIFIED) );

        return preferenceEntity.build();
    }
}
