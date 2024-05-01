package com.ssafy.vinopener.domain.wine.repository;

import com.ssafy.vinopener.domain.wine.data.entity.FlavourTasteEntity;
import com.ssafy.vinopener.domain.wine.data.entity.FlavourTypeEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FlavourTasteRepository extends JpaRepository<FlavourTasteEntity, Long> {

    List<FlavourTypeEntity> findAllByIdIn(List<Long> ids);

}
