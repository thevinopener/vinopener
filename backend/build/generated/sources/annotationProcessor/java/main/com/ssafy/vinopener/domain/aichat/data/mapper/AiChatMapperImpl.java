package com.ssafy.vinopener.domain.aichat.data.mapper;

import com.ssafy.vinopener.domain.aichat.data.dto.request.AiChatCreateRequest;
import com.ssafy.vinopener.domain.aichat.data.dto.response.AiChatGetListResponse;
import com.ssafy.vinopener.domain.aichat.data.entity.AiChatEntity;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
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
public class AiChatMapperImpl implements AiChatMapper {

    private final ReferenceMapper referenceMapper;

    @Autowired
    public AiChatMapperImpl(ReferenceMapper referenceMapper) {

        this.referenceMapper = referenceMapper;
    }

    @Override
    public AiChatGetListResponse toGetResponse(AiChatEntity entity) {
        if ( entity == null ) {
            return null;
        }

        AiChatGetListResponse.AiChatGetListResponseBuilder aiChatGetListResponse = AiChatGetListResponse.builder();

        aiChatGetListResponse.id( entity.getId() );
        aiChatGetListResponse.message( entity.getMessage() );
        aiChatGetListResponse.isBot( entity.getIsBot() );
        aiChatGetListResponse.createdTime( entity.getCreatedTime() );

        return aiChatGetListResponse.build();
    }

    @Override
    public AiChatEntity toEntity(AiChatCreateRequest request, Long userId) {
        if ( request == null && userId == null ) {
            return null;
        }

        AiChatEntity.AiChatEntityBuilder aiChatEntity = AiChatEntity.builder();

        if ( request != null ) {
            aiChatEntity.message( request.message() );
        }
        aiChatEntity.user( referenceMapper.resolve( UserEntity.class, userId ) );
        aiChatEntity.isBot( true );

        return aiChatEntity.build();
    }
}
