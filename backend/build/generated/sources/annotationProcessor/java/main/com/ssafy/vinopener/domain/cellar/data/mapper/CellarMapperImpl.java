package com.ssafy.vinopener.domain.cellar.data.mapper;

import com.ssafy.vinopener.domain.cellar.data.dto.request.CellarCreateRequest;
import com.ssafy.vinopener.domain.cellar.data.dto.request.CellarUpdateRequest;
import com.ssafy.vinopener.domain.cellar.data.dto.response.CellarGetListResponse;
import com.ssafy.vinopener.domain.cellar.data.dto.response.CellarGetResponse;
import com.ssafy.vinopener.domain.cellar.data.entity.CellarEntity;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import java.math.BigDecimal;
import javax.annotation.processing.Generated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2024-04-30T22:24:01+0900",
    comments = "version: 1.5.5.Final, compiler: IncrementalProcessingEnvironment from gradle-language-java-8.7.jar, environment: Java 21.0.2 (Eclipse Adoptium)"
)
@Component
public class CellarMapperImpl implements CellarMapper {

    private final ReferenceMapper referenceMapper;

    @Autowired
    public CellarMapperImpl(ReferenceMapper referenceMapper) {

        this.referenceMapper = referenceMapper;
    }

    @Override
    public CellarGetResponse toGetResponse(CellarEntity entity) {
        if ( entity == null ) {
            return null;
        }

        CellarGetResponse.CellarGetResponseBuilder cellarGetResponse = CellarGetResponse.builder();

        cellarGetResponse.id( entity.getId() );
        cellarGetResponse.finishedDate( entity.getFinishedDate() );
        cellarGetResponse.wine( wineEntityToCellarGetWineResponse( entity.getWine() ) );

        return cellarGetResponse.build();
    }

    @Override
    public CellarGetListResponse toGetListResponse(CellarEntity entity) {
        if ( entity == null ) {
            return null;
        }

        CellarGetListResponse.CellarGetListResponseBuilder cellarGetListResponse = CellarGetListResponse.builder();

        cellarGetListResponse.id( entity.getId() );
        cellarGetListResponse.finishedDate( entity.getFinishedDate() );
        cellarGetListResponse.wine( wineEntityToWineGetListResponse( entity.getWine() ) );

        return cellarGetListResponse.build();
    }

    @Override
    public CellarEntity toEntity(Long userId, CellarCreateRequest request, WineEntity wine) {
        if ( userId == null && request == null && wine == null ) {
            return null;
        }

        CellarEntity.CellarEntityBuilder cellarEntity = CellarEntity.builder();

        if ( request != null ) {
            cellarEntity.wine( referenceMapper.resolve( WineEntity.class, request.wineId() ) );
            cellarEntity.finishedDate( request.finishedDate() );
        }
        cellarEntity.user( referenceMapper.resolve( UserEntity.class, userId ) );

        return cellarEntity.build();
    }

    @Override
    public CellarEntity toEntity(Long id, CellarUpdateRequest request) {
        if ( id == null && request == null ) {
            return null;
        }

        CellarEntity.CellarEntityBuilder cellarEntity = CellarEntity.builder();

        if ( request != null ) {
            cellarEntity.finishedDate( request.finishedDate() );
        }
        cellarEntity.id( id );

        return cellarEntity.build();
    }

    protected CellarGetResponse.CellarGetWineResponse wineEntityToCellarGetWineResponse(WineEntity wineEntity) {
        if ( wineEntity == null ) {
            return null;
        }

        CellarGetResponse.CellarGetWineResponse.CellarGetWineResponseBuilder cellarGetWineResponse = CellarGetResponse.CellarGetWineResponse.builder();

        cellarGetWineResponse.id( wineEntity.getId() );
        cellarGetWineResponse.name( wineEntity.getName() );
        cellarGetWineResponse.imageUrl( wineEntity.getImageUrl() );
        cellarGetWineResponse.grape( wineEntity.getGrape() );
        cellarGetWineResponse.winery( wineEntity.getWinery() );
        cellarGetWineResponse.country( wineEntity.getCountry() );
        cellarGetWineResponse.price( wineEntity.getPrice() );
        cellarGetWineResponse.rating( wineEntity.getRating() );
        if ( wineEntity.getVintage() != null ) {
            cellarGetWineResponse.vintage( BigDecimal.valueOf( wineEntity.getVintage() ) );
        }
        cellarGetWineResponse.type( wineEntity.getType() );
        cellarGetWineResponse.acidity( wineEntity.getAcidity() );
        cellarGetWineResponse.intensity( wineEntity.getIntensity() );
        cellarGetWineResponse.sweetness( wineEntity.getSweetness() );
        cellarGetWineResponse.tannin( wineEntity.getTannin() );
        cellarGetWineResponse.abv( wineEntity.getAbv() );
        cellarGetWineResponse.view( wineEntity.getView() );

        return cellarGetWineResponse.build();
    }

    protected CellarGetListResponse.WineGetListResponse wineEntityToWineGetListResponse(WineEntity wineEntity) {
        if ( wineEntity == null ) {
            return null;
        }

        CellarGetListResponse.WineGetListResponse.WineGetListResponseBuilder wineGetListResponse = CellarGetListResponse.WineGetListResponse.builder();

        wineGetListResponse.id( wineEntity.getId() );
        wineGetListResponse.name( wineEntity.getName() );
        wineGetListResponse.imageUrl( wineEntity.getImageUrl() );
        wineGetListResponse.grape( wineEntity.getGrape() );
        wineGetListResponse.winery( wineEntity.getWinery() );
        wineGetListResponse.country( wineEntity.getCountry() );
        wineGetListResponse.price( wineEntity.getPrice() );
        wineGetListResponse.rating( wineEntity.getRating() );
        if ( wineEntity.getVintage() != null ) {
            wineGetListResponse.vintage( BigDecimal.valueOf( wineEntity.getVintage() ) );
        }
        wineGetListResponse.type( wineEntity.getType() );
        wineGetListResponse.acidity( wineEntity.getAcidity() );
        wineGetListResponse.intensity( wineEntity.getIntensity() );
        wineGetListResponse.sweetness( wineEntity.getSweetness() );
        wineGetListResponse.tannin( wineEntity.getTannin() );
        wineGetListResponse.abv( wineEntity.getAbv() );
        wineGetListResponse.view( wineEntity.getView() );

        return wineGetListResponse.build();
    }
}
