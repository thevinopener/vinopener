package com.ssafy.vinopener.domain.user.data.mapper;

import com.ssafy.vinopener.domain.user.data.dto.response.UserGetResponse;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2024-04-30T22:24:01+0900",
    comments = "version: 1.5.5.Final, compiler: IncrementalProcessingEnvironment from gradle-language-java-8.7.jar, environment: Java 21.0.2 (Eclipse Adoptium)"
)
@Component
public class UserMapperImpl implements UserMapper {

    @Override
    public UserGetResponse toGetResponse(UserEntity entity) {
        if ( entity == null ) {
            return null;
        }

        UserGetResponse.UserGetResponseBuilder userGetResponse = UserGetResponse.builder();

        userGetResponse.id( entity.getId() );
        userGetResponse.email( entity.getEmail() );
        userGetResponse.nickname( entity.getNickname() );
        userGetResponse.imageUrl( entity.getImageUrl() );

        return userGetResponse.build();
    }
}
