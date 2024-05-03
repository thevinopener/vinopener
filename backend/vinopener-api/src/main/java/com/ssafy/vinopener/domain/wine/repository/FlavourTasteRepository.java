package com.ssafy.vinopener.domain.wine.repository;

import com.ssafy.vinopener.domain.wine.data.entity.FlavourTasteEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FlavourTasteRepository extends JpaRepository<FlavourTasteEntity, Long> {

    List<FlavourTasteEntity> findAllByIdIn(List<Long> ids);

    List<FlavourTasteEntity> findAllByNameIn(List<String> names);

}
