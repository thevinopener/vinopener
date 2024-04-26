package com.ssafy.vinopener.domain.preference.data.mapper;

import com.ssafy.vinopener.domain.preference.data.dto.request.PreferenceCreateOrUpdateRequest;
import com.ssafy.vinopener.domain.preference.data.dto.response.PreferenceGetResponse;
import com.ssafy.vinopener.domain.preference.data.entity.PreferenceEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class})
public interface PreferenceMapper {

    PreferenceGetResponse toGetResponse(PreferenceEntity entity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "user", source = "userId")
    PreferenceEntity toEntity(PreferenceCreateOrUpdateRequest request, Long userId);

    @Mapping(target = "user", source = "userId")
    PreferenceEntity toEntity(Long id, PreferenceCreateOrUpdateRequest request, Long userId);

}
