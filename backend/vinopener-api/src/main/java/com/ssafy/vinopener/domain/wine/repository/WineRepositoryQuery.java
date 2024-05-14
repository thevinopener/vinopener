package com.ssafy.vinopener.domain.wine.repository;

import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import java.util.List;

public interface WineRepositoryQuery {

    List<WineEntity> findAllExceptCellar(Long userId);

}
