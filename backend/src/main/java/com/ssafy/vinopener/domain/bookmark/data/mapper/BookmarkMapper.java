package com.ssafy.vinopener.domain.bookmark.data.mapper;

import com.ssafy.vinopener.domain.bookmark.data.dto.request.BookmarkCreateRequest;
import com.ssafy.vinopener.domain.bookmark.data.dto.response.BookmarkGetListResponse;
import com.ssafy.vinopener.domain.bookmark.data.entity.BookmarkEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class})
public interface BookmarkMapper {

    BookmarkGetListResponse toGetListResponse(BookmarkEntity entity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "user", source = "userId")
    @Mapping(target = "wine", source = "request.wineId")
    BookmarkEntity toEntity(Long userId, BookmarkCreateRequest request, WineEntity wine);

}
