package com.ssafy.vinopener.domain.wine.repository;

import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import java.util.List;

public interface WineRepositoryQuery {

    List<WineEntity> findAllExceptCellar(Long userId);

    List<WineEntity> findAllByTypeExceptCellar(WineType type, Long userId);

}
