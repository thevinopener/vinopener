package com.ssafy.vinopener.domain.tastingnote.data.mapper;

import com.ssafy.vinopener.domain.tastingnote.data.dto.request.TastingNoteCreateRequest;
import com.ssafy.vinopener.domain.tastingnote.data.dto.request.TastingNoteUpdateRequest;
import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetListResponse;
import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetResponse;
import com.ssafy.vinopener.domain.tastingnote.data.entity.ColorEntity;
import com.ssafy.vinopener.domain.tastingnote.data.entity.TastingNoteEntity;
import com.ssafy.vinopener.domain.tastingnote.data.entity.TastingNoteFlavourEntity;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import javax.annotation.processing.Generated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2024-04-30T22:24:01+0900",
    comments = "version: 1.5.5.Final, compiler: IncrementalProcessingEnvironment from gradle-language-java-8.7.jar, environment: Java 21.0.2 (Eclipse Adoptium)"
)
@Component
public class TastingNoteMapperImpl implements TastingNoteMapper {

    private final ReferenceMapper referenceMapper;
    private final TastingNoteFlavourMapper tastingNoteFlavourMapper;

    @Autowired
    public TastingNoteMapperImpl(ReferenceMapper referenceMapper, TastingNoteFlavourMapper tastingNoteFlavourMapper) {

        this.referenceMapper = referenceMapper;
        this.tastingNoteFlavourMapper = tastingNoteFlavourMapper;
    }

    @Override
    public TastingNoteGetResponse toGetResponse(TastingNoteEntity entity) {
        if ( entity == null ) {
            return null;
        }

        TastingNoteGetResponse.TastingNoteGetResponseBuilder tastingNoteGetResponse = TastingNoteGetResponse.builder();

        tastingNoteGetResponse.id( entity.getId() );
        tastingNoteGetResponse.wine( wineEntityToTastingNoteGetWineResponse( entity.getWine() ) );
        tastingNoteGetResponse.color( colorEntityToTastingNoteGetColorResponse( entity.getColor() ) );
        tastingNoteGetResponse.sweetness( entity.getSweetness() );
        tastingNoteGetResponse.intensity( entity.getIntensity() );
        tastingNoteGetResponse.acidity( entity.getAcidity() );
        tastingNoteGetResponse.alcohol( entity.getAlcohol() );
        tastingNoteGetResponse.tannin( entity.getTannin() );
        tastingNoteGetResponse.opinion( entity.getOpinion() );
        tastingNoteGetResponse.rating( entity.getRating() );
        tastingNoteGetResponse.flavours( tastingNoteFlavourEntityListToTastingNoteGetFlavourResponseSet( entity.getFlavours() ) );
        tastingNoteGetResponse.updatedTime( entity.getUpdatedTime() );

        return tastingNoteGetResponse.build();
    }

    @Override
    public TastingNoteGetListResponse toGetListResponse(TastingNoteEntity entity) {
        if ( entity == null ) {
            return null;
        }

        TastingNoteGetListResponse.TastingNoteGetListResponseBuilder tastingNoteGetListResponse = TastingNoteGetListResponse.builder();

        tastingNoteGetListResponse.id( entity.getId() );
        tastingNoteGetListResponse.wine( wineEntityToTastingNoteGetListWineResponse( entity.getWine() ) );
        tastingNoteGetListResponse.color( colorEntityToTastingNoteGetListColorResponse( entity.getColor() ) );
        tastingNoteGetListResponse.rating( entity.getRating() );
        tastingNoteGetListResponse.flavours( tastingNoteFlavourEntityListToTastingNoteGetListFlavourResponseSet( entity.getFlavours() ) );

        return tastingNoteGetListResponse.build();
    }

    @Override
    public TastingNoteEntity toEntity(TastingNoteCreateRequest request, Long userId) {
        if ( request == null && userId == null ) {
            return null;
        }

        TastingNoteEntity.TastingNoteEntityBuilder tastingNoteEntity = TastingNoteEntity.builder();

        if ( request != null ) {
            tastingNoteEntity.wine( referenceMapper.resolve( WineEntity.class, request.wineId() ) );
            tastingNoteEntity.color( referenceMapper.resolve( ColorEntity.class, request.colorId() ) );
            tastingNoteEntity.flavours( longSetToTastingNoteFlavourEntityList( request.flavourTasteIds() ) );
            tastingNoteEntity.sweetness( request.sweetness() );
            tastingNoteEntity.intensity( request.intensity() );
            tastingNoteEntity.acidity( request.acidity() );
            tastingNoteEntity.alcohol( request.alcohol() );
            tastingNoteEntity.tannin( request.tannin() );
            tastingNoteEntity.opinion( request.opinion() );
            tastingNoteEntity.rating( request.rating() );
        }
        tastingNoteEntity.user( referenceMapper.resolve( UserEntity.class, userId ) );

        return tastingNoteEntity.build();
    }

    @Override
    public TastingNoteEntity toEntity(Long id, TastingNoteUpdateRequest request) {
        if ( id == null && request == null ) {
            return null;
        }

        TastingNoteEntity.TastingNoteEntityBuilder tastingNoteEntity = TastingNoteEntity.builder();

        if ( request != null ) {
            tastingNoteEntity.color( referenceMapper.resolve( ColorEntity.class, request.colorId() ) );
            tastingNoteEntity.flavours( longListToTastingNoteFlavourEntityList( request.flavourTasteIds() ) );
            tastingNoteEntity.sweetness( request.sweetness() );
            tastingNoteEntity.intensity( request.intensity() );
            tastingNoteEntity.acidity( request.acidity() );
            tastingNoteEntity.alcohol( request.alcohol() );
            tastingNoteEntity.tannin( request.tannin() );
            tastingNoteEntity.opinion( request.opinion() );
            tastingNoteEntity.rating( request.rating() );
        }
        tastingNoteEntity.id( id );

        return tastingNoteEntity.build();
    }

    protected TastingNoteGetResponse.TastingNoteGetWineResponse wineEntityToTastingNoteGetWineResponse(WineEntity wineEntity) {
        if ( wineEntity == null ) {
            return null;
        }

        TastingNoteGetResponse.TastingNoteGetWineResponse.TastingNoteGetWineResponseBuilder tastingNoteGetWineResponse = TastingNoteGetResponse.TastingNoteGetWineResponse.builder();

        tastingNoteGetWineResponse.id( wineEntity.getId() );
        tastingNoteGetWineResponse.name( wineEntity.getName() );
        tastingNoteGetWineResponse.imageUrl( wineEntity.getImageUrl() );
        tastingNoteGetWineResponse.winery( wineEntity.getWinery() );
        tastingNoteGetWineResponse.country( wineEntity.getCountry() );
        tastingNoteGetWineResponse.type( wineEntity.getType() );

        return tastingNoteGetWineResponse.build();
    }

    protected TastingNoteGetResponse.TastingNoteGetColorResponse colorEntityToTastingNoteGetColorResponse(ColorEntity colorEntity) {
        if ( colorEntity == null ) {
            return null;
        }

        TastingNoteGetResponse.TastingNoteGetColorResponse.TastingNoteGetColorResponseBuilder tastingNoteGetColorResponse = TastingNoteGetResponse.TastingNoteGetColorResponse.builder();

        tastingNoteGetColorResponse.id( colorEntity.getId() );
        tastingNoteGetColorResponse.name( colorEntity.getName() );

        return tastingNoteGetColorResponse.build();
    }

    protected Set<TastingNoteGetResponse.TastingNoteGetFlavourResponse> tastingNoteFlavourEntityListToTastingNoteGetFlavourResponseSet(List<TastingNoteFlavourEntity> list) {
        if ( list == null ) {
            return null;
        }

        Set<TastingNoteGetResponse.TastingNoteGetFlavourResponse> set = new LinkedHashSet<TastingNoteGetResponse.TastingNoteGetFlavourResponse>( Math.max( (int) ( list.size() / .75f ) + 1, 16 ) );
        for ( TastingNoteFlavourEntity tastingNoteFlavourEntity : list ) {
            set.add( tastingNoteFlavourMapper.toFlavourResponse( tastingNoteFlavourEntity ) );
        }

        return set;
    }

    protected TastingNoteGetListResponse.TastingNoteGetListWineResponse wineEntityToTastingNoteGetListWineResponse(WineEntity wineEntity) {
        if ( wineEntity == null ) {
            return null;
        }

        TastingNoteGetListResponse.TastingNoteGetListWineResponse.TastingNoteGetListWineResponseBuilder tastingNoteGetListWineResponse = TastingNoteGetListResponse.TastingNoteGetListWineResponse.builder();

        tastingNoteGetListWineResponse.id( wineEntity.getId() );
        tastingNoteGetListWineResponse.name( wineEntity.getName() );
        tastingNoteGetListWineResponse.imageUrl( wineEntity.getImageUrl() );
        tastingNoteGetListWineResponse.winery( wineEntity.getWinery() );
        tastingNoteGetListWineResponse.country( wineEntity.getCountry() );

        return tastingNoteGetListWineResponse.build();
    }

    protected TastingNoteGetListResponse.TastingNoteGetListColorResponse colorEntityToTastingNoteGetListColorResponse(ColorEntity colorEntity) {
        if ( colorEntity == null ) {
            return null;
        }

        TastingNoteGetListResponse.TastingNoteGetListColorResponse.TastingNoteGetListColorResponseBuilder tastingNoteGetListColorResponse = TastingNoteGetListResponse.TastingNoteGetListColorResponse.builder();

        tastingNoteGetListColorResponse.id( colorEntity.getId() );
        tastingNoteGetListColorResponse.name( colorEntity.getName() );

        return tastingNoteGetListColorResponse.build();
    }

    protected Set<TastingNoteGetListResponse.TastingNoteGetListFlavourResponse> tastingNoteFlavourEntityListToTastingNoteGetListFlavourResponseSet(List<TastingNoteFlavourEntity> list) {
        if ( list == null ) {
            return null;
        }

        Set<TastingNoteGetListResponse.TastingNoteGetListFlavourResponse> set = new LinkedHashSet<TastingNoteGetListResponse.TastingNoteGetListFlavourResponse>( Math.max( (int) ( list.size() / .75f ) + 1, 16 ) );
        for ( TastingNoteFlavourEntity tastingNoteFlavourEntity : list ) {
            set.add( tastingNoteFlavourMapper.toFlavourListResponse( tastingNoteFlavourEntity ) );
        }

        return set;
    }

    protected List<TastingNoteFlavourEntity> longSetToTastingNoteFlavourEntityList(Set<Long> set) {
        if ( set == null ) {
            return null;
        }

        List<TastingNoteFlavourEntity> list = new ArrayList<TastingNoteFlavourEntity>( set.size() );
        for ( Long long1 : set ) {
            list.add( referenceMapper.resolve( TastingNoteFlavourEntity.class, long1 ) );
        }

        return list;
    }

    protected List<TastingNoteFlavourEntity> longListToTastingNoteFlavourEntityList(List<Long> list) {
        if ( list == null ) {
            return null;
        }

        List<TastingNoteFlavourEntity> list1 = new ArrayList<TastingNoteFlavourEntity>( list.size() );
        for ( Long long1 : list ) {
            list1.add( referenceMapper.resolve( TastingNoteFlavourEntity.class, long1 ) );
        }

        return list1;
    }
}
