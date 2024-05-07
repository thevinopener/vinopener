package com.ssafy.vinopener.domain.wine.repository;

import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WineRepository extends JpaRepository<WineEntity, Long> {

    List<WineEntity> findByType(WineType type);

    List<WineEntity> findBySeoName(String seoName);

    List<WineEntity> findBySeoNameContaining(String seoName);

}
