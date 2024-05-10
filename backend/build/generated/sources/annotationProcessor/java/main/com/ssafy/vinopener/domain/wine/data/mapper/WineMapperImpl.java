package com.ssafy.vinopener.domain.wine.data.mapper;

import com.ssafy.vinopener.domain.wine.data.dto.request.WineCreateRequest;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetListResponse;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineGetResponse;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2024-04-30T22:24:01+0900",
    comments = "version: 1.5.5.Final, compiler: IncrementalProcessingEnvironment from gradle-language-java-8.7.jar, environment: Java 21.0.2 (Eclipse Adoptium)"
)
@Component
public class WineMapperImpl implements WineMapper {

    @Override
    public WineGetResponse toGetResponse(WineEntity entity) {
        if ( entity == null ) {
            return null;
        }

        WineGetResponse.WineGetResponseBuilder wineGetResponse = WineGetResponse.builder();

        wineGetResponse.id( entity.getId() );
        wineGetResponse.name( entity.getName() );
        wineGetResponse.imageUrl( entity.getImageUrl() );
        wineGetResponse.grape( entity.getGrape() );
        wineGetResponse.winery( entity.getWinery() );
        wineGetResponse.country( entity.getCountry() );
        wineGetResponse.price( entity.getPrice() );
        wineGetResponse.rating( entity.getRating() );
        wineGetResponse.vintage( entity.getVintage() );
        wineGetResponse.type( entity.getType() );
        wineGetResponse.acidity( entity.getAcidity() );
        wineGetResponse.intensity( entity.getIntensity() );
        wineGetResponse.sweetness( entity.getSweetness() );
        wineGetResponse.tannin( entity.getTannin() );
        wineGetResponse.abv( entity.getAbv() );
        wineGetResponse.view( entity.getView() );

        return wineGetResponse.build();
    }

    @Override
    public WineGetListResponse toGetListResponse(WineEntity entity) {
        if ( entity == null ) {
            return null;
        }

        WineGetListResponse.WineGetListResponseBuilder wineGetListResponse = WineGetListResponse.builder();

        wineGetListResponse.id( entity.getId() );
        wineGetListResponse.name( entity.getName() );
        wineGetListResponse.imageUrl( entity.getImageUrl() );
        wineGetListResponse.grape( entity.getGrape() );
        wineGetListResponse.winery( entity.getWinery() );
        wineGetListResponse.country( entity.getCountry() );
        wineGetListResponse.price( entity.getPrice() );
        wineGetListResponse.rating( entity.getRating() );
        wineGetListResponse.vintage( entity.getVintage() );
        wineGetListResponse.type( entity.getType() );
        wineGetListResponse.acidity( entity.getAcidity() );
        wineGetListResponse.intensity( entity.getIntensity() );
        wineGetListResponse.sweetness( entity.getSweetness() );
        wineGetListResponse.tannin( entity.getTannin() );
        wineGetListResponse.abv( entity.getAbv() );
        wineGetListResponse.view( entity.getView() );

        return wineGetListResponse.build();
    }

    @Override
    public WineEntity toEntity(WineCreateRequest request) {
        if ( request == null ) {
            return null;
        }

        WineEntity.WineEntityBuilder wineEntity = WineEntity.builder();

        wineEntity.name( request.name() );
        wineEntity.seoName( request.seoName() );
        wineEntity.imageUrl( request.imageUrl() );
        wineEntity.grape( request.grape() );
        wineEntity.winery( request.winery() );
        wineEntity.country( request.country() );
        wineEntity.price( request.price() );
        wineEntity.rating( request.rating() );
        wineEntity.vintage( request.vintage() );
        wineEntity.type( request.type() );
        wineEntity.acidity( request.acidity() );
        wineEntity.intensity( request.intensity() );
        wineEntity.sweetness( request.sweetness() );
        wineEntity.tannin( request.tannin() );
        wineEntity.abv( request.abv() );

        return wineEntity.build();
    }
}
