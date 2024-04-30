package com.ssafy.vinopener.domain.preference.data.mapper;

import com.ssafy.vinopener.domain.preference.data.dto.request.PreferenceCreateOrUpdateRequest;
import com.ssafy.vinopener.domain.preference.data.dto.response.PreferenceGetResponse;
import com.ssafy.vinopener.domain.preference.data.entity.PreferenceEntity;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import com.ssafy.vinopener.global.common.ReferenceMapper;
import java.util.EnumSet;
import java.util.Set;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR,
        uses = {ReferenceMapper.class},
        imports = {WineType.class})
public interface PreferenceMapper {

    @Mapping(target = "types", source = "entity")
    PreferenceGetResponse toGetResponse(PreferenceEntity entity);

    default Set<WineType> map(final PreferenceEntity entity) {
        Set<WineType> wineTypes = EnumSet.noneOf(WineType.class);
        if (entity.getIsRed()) {
            wineTypes.add(WineType.RED);
        }
        if (entity.getIsWhite()) {
            wineTypes.add(WineType.WHITE);
        }
        if (entity.getIsRose()) {
            wineTypes.add(WineType.ROSE);
        }
        if (entity.getIsSparkling()) {
            wineTypes.add(WineType.SPARKLING);
        }
        if (entity.getIsDessert()) {
            wineTypes.add(WineType.DESSERT);
        }
        if (entity.getIsFortified()) {
            wineTypes.add(WineType.FORTIFIED);
        }
        return wineTypes;
    }

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "user", source = "userId")
    @Mapping(target = "isRed", expression = "java(request.types().contains(WineType.RED))")
    @Mapping(target = "isWhite", expression = "java(request.types().contains(WineType.WHITE))")
    @Mapping(target = "isRose", expression = "java(request.types().contains(WineType.ROSE))")
    @Mapping(target = "isSparkling", expression = "java(request.types().contains(WineType.SPARKLING))")
    @Mapping(target = "isDessert", expression = "java(request.types().contains(WineType.DESSERT))")
    @Mapping(target = "isFortified", expression = "java(request.types().contains(WineType.FORTIFIED))")
    PreferenceEntity toEntity(PreferenceCreateOrUpdateRequest request, Long userId);

    @Mapping(target = "user", source = "userId")
    @Mapping(target = "isRed", expression = "java(request.types().contains(WineType.RED))")
    @Mapping(target = "isWhite", expression = "java(request.types().contains(WineType.WHITE))")
    @Mapping(target = "isRose", expression = "java(request.types().contains(WineType.ROSE))")
    @Mapping(target = "isSparkling", expression = "java(request.types().contains(WineType.SPARKLING))")
    @Mapping(target = "isDessert", expression = "java(request.types().contains(WineType.DESSERT))")
    @Mapping(target = "isFortified", expression = "java(request.types().contains(WineType.FORTIFIED))")
    PreferenceEntity toEntity(Long id, PreferenceCreateOrUpdateRequest request, Long userId);

}
