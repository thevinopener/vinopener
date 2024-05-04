package com.ssafy.vinopener.domain.search.data.mapper;

import com.ssafy.vinopener.domain.search.data.dto.response.SearchGetListResponse;
import com.ssafy.vinopener.domain.search.data.entity.SearchEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class})
public interface SearchMapper {

    @Mapping(target = "id", source = "entity.id")
    @Mapping(target = "userId", source = "entity.user.id")
    @Mapping(target = "content", source = "entity.content")
    SearchGetListResponse toGetListResponse(SearchEntity entity);

}
