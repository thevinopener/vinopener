package com.ssafy.vinopener.domain.bookmark.data.mapper;

import com.ssafy.vinopener.domain.bookmark.data.dto.request.BookmarkCreateRequest;
import com.ssafy.vinopener.domain.bookmark.data.dto.response.BookmarkGetListResponse;
import com.ssafy.vinopener.domain.bookmark.data.entity.BookmarkEntity;
import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR)
public interface BookmarkMapper {
    BookmarkGetListResponse toGetListResponse(BookmarkEntity entity);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "wine", source = "wine")
    @Mapping(target = "user.id", source="userId")
    BookmarkEntity toEntity(Long userId, BookmarkCreateRequest request, WineEntity wine);
}
