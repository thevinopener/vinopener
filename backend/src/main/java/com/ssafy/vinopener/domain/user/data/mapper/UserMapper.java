package com.ssafy.vinopener.domain.user.data.mapper;

import com.ssafy.vinopener.domain.user.data.dto.response.UserGetResponse;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class})
public interface UserMapper {

    UserGetResponse toGetResponse(UserEntity entity);

}
