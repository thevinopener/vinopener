package com.ssafy.vinopener.domain.aichat.data.mapper;

import com.ssafy.vinopener.domain.aichat.data.dto.request.AiChatCreateRequest;
import com.ssafy.vinopener.domain.aichat.data.dto.response.AiChatGetListResponse;
import com.ssafy.vinopener.domain.aichat.data.entity.AiChatEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class})
public interface AiChatMapper {

    AiChatGetListResponse toGetResponse(AiChatEntity entity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "user", source = "userId")
    @Mapping(target = "isBot", constant = "true")
    AiChatEntity toEntity(AiChatCreateRequest request, Long userId);

}
