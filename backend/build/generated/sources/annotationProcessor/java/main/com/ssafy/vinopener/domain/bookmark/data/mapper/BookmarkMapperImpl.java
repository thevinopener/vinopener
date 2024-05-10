package com.ssafy.vinopener.domain.bookmark.data.mapper;

import com.ssafy.vinopener.domain.bookmark.data.dto.request.BookmarkCreateRequest;
import com.ssafy.vinopener.domain.bookmark.data.dto.response.BookmarkGetListResponse;
import com.ssafy.vinopener.domain.bookmark.data.entity.BookmarkEntity;
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
public class BookmarkMapperImpl implements BookmarkMapper {

    private final ReferenceMapper referenceMapper;

    @Autowired
    public BookmarkMapperImpl(ReferenceMapper referenceMapper) {

        this.referenceMapper = referenceMapper;
    }

    @Override
    public BookmarkGetListResponse toGetListResponse(BookmarkEntity entity) {
        if ( entity == null ) {
            return null;
        }

        BookmarkGetListResponse.BookmarkGetListResponseBuilder bookmarkGetListResponse = BookmarkGetListResponse.builder();

        bookmarkGetListResponse.id( entity.getId() );
        bookmarkGetListResponse.wine( wineEntityToWineGetListResponse( entity.getWine() ) );

        return bookmarkGetListResponse.build();
    }

    @Override
    public BookmarkEntity toEntity(Long userId, BookmarkCreateRequest request, WineEntity wine) {
        if ( userId == null && request == null && wine == null ) {
            return null;
        }

        BookmarkEntity.BookmarkEntityBuilder bookmarkEntity = BookmarkEntity.builder();

        if ( request != null ) {
            bookmarkEntity.wine( referenceMapper.resolve( WineEntity.class, request.wineId() ) );
        }
        bookmarkEntity.user( referenceMapper.resolve( UserEntity.class, userId ) );

        return bookmarkEntity.build();
    }

    protected BookmarkGetListResponse.WineGetListResponse wineEntityToWineGetListResponse(WineEntity wineEntity) {
        if ( wineEntity == null ) {
            return null;
        }

        BookmarkGetListResponse.WineGetListResponse.WineGetListResponseBuilder wineGetListResponse = BookmarkGetListResponse.WineGetListResponse.builder();

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
