package com.ssafy.vinopener.domain.search.data.mapper;

import com.ssafy.vinopener.domain.search.data.dto.response.SearchGetListResponse;
import com.ssafy.vinopener.domain.search.data.entity.SearchEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class})
public interface SearchMapper {

    SearchGetListResponse toGetListResponse(SearchEntity entity);

}
