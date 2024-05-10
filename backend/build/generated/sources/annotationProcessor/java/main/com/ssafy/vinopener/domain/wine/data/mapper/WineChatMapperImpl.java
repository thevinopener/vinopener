package com.ssafy.vinopener.domain.wine.data.mapper;

import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.wine.data.dto.request.WineChatCreateRequest;
import com.ssafy.vinopener.domain.wine.data.dto.response.WineChatGetOrGetListResponse;
import com.ssafy.vinopener.domain.wine.data.entity.WineChatEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
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
public class WineChatMapperImpl implements WineChatMapper {

    private final ReferenceMapper referenceMapper;

    @Autowired
    public WineChatMapperImpl(ReferenceMapper referenceMapper) {

        this.referenceMapper = referenceMapper;
    }

    @Override
    public WineChatGetOrGetListResponse toGetOrGetListResponse(WineChatEntity entity) {
        if ( entity == null ) {
            return null;
        }

        WineChatGetOrGetListResponse.WineChatGetOrGetListResponseBuilder wineChatGetOrGetListResponse = WineChatGetOrGetListResponse.builder();

        wineChatGetOrGetListResponse.id( entity.getId() );
        wineChatGetOrGetListResponse.user( userEntityToWineChatGetListUserResponse( entity.getUser() ) );
        wineChatGetOrGetListResponse.message( entity.getMessage() );
        wineChatGetOrGetListResponse.createdTime( entity.getCreatedTime() );

        return wineChatGetOrGetListResponse.build();
    }

    @Override
    public WineChatEntity toEntity(WineChatCreateRequest request, Long wineId, Long userId) {
        if ( request == null && wineId == null && userId == null ) {
            return null;
        }

        WineChatEntity.WineChatEntityBuilder wineChatEntity = WineChatEntity.builder();

        if ( request != null ) {
            wineChatEntity.message( request.message() );
        }
        wineChatEntity.wine( referenceMapper.resolve( WineEntity.class, wineId ) );
        wineChatEntity.user( referenceMapper.resolve( UserEntity.class, userId ) );

        return wineChatEntity.build();
    }

    protected WineChatGetOrGetListResponse.WineChatGetListUserResponse userEntityToWineChatGetListUserResponse(UserEntity userEntity) {
        if ( userEntity == null ) {
            return null;
        }

        WineChatGetOrGetListResponse.WineChatGetListUserResponse.WineChatGetListUserResponseBuilder wineChatGetListUserResponse = WineChatGetOrGetListResponse.WineChatGetListUserResponse.builder();

        wineChatGetListUserResponse.id( userEntity.getId() );
        wineChatGetListUserResponse.nickname( userEntity.getNickname() );

        return wineChatGetListUserResponse.build();
    }
}
