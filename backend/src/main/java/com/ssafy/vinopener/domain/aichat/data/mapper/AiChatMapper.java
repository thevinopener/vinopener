package com.ssafy.vinopener.domain.aichat.data.mapper;

import com.ssafy.vinopener.domain.aichat.data.dto.AiChatCreateAiMessageInfo;
import com.ssafy.vinopener.domain.aichat.data.dto.AiChatCreateAiMessageInfo.AiChatCreateResponseAiMessageInfoCommand;
import com.ssafy.vinopener.domain.aichat.data.dto.AiChatCreateUserMessageInfo;
import com.ssafy.vinopener.domain.aichat.data.dto.AiChatCreateUserMessageInfo.AiChatCreateUserMessageInfoState;
import com.ssafy.vinopener.domain.aichat.data.dto.request.AiChatCreateRequest;
import com.ssafy.vinopener.domain.aichat.data.dto.response.AiChatCreateResponse;
import com.ssafy.vinopener.domain.aichat.data.dto.response.AiChatCreateResponse.AiChatCreateResponseCommand;
import com.ssafy.vinopener.domain.aichat.data.dto.response.AiChatCreateResponse.AiChatCreateResponseCommand.CommandFlavour;
import com.ssafy.vinopener.domain.aichat.data.dto.response.AiChatGetListResponse;
import com.ssafy.vinopener.domain.aichat.data.entity.AiChatEntity;
import com.ssafy.vinopener.domain.tastingnote.data.entity.ColorEntity;
import com.ssafy.vinopener.domain.wine.data.entity.FlavourTasteEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import java.util.List;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class})
public interface AiChatMapper {

    @Mapping(target = "command", source = "responseCommand")
    AiChatCreateResponse toCreateResponse(AiChatEntity entity, AiChatCreateResponseCommand responseCommand);

    @Mapping(target = "color", source = "colorEntity")
    @Mapping(target = "flavours", source = "flavourEntities")
    AiChatCreateResponseCommand toCreateResponseCommand(AiChatCreateResponseAiMessageInfoCommand infoCommand,
            ColorEntity colorEntity, List<FlavourTasteEntity> flavourEntities);

    @Mapping(target = "taste", source = "name")
    CommandFlavour map(FlavourTasteEntity entity);

    AiChatGetListResponse toGetListResponse(AiChatEntity entity);

    @Mapping(target = "state", source = "infoState")
    AiChatCreateUserMessageInfo toInfo(AiChatCreateRequest request, AiChatCreateUserMessageInfoState infoState);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "user", source = "userId")
    @Mapping(target = "isBot", constant = "false")
    AiChatEntity toEntity(AiChatCreateRequest request, Long userId);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "user", source = "userId")
    @Mapping(target = "isBot", constant = "true")
    AiChatEntity toEntity(AiChatCreateAiMessageInfo info, Long userId);

}
