package com.ssafy.vinopener.domain.wine.repository;

import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import com.ssafy.vinopener.domain.wine.data.entity.enums.WineType;
import io.lettuce.core.dynamic.annotation.Param;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface WineRepository extends JpaRepository<WineEntity, Long> {

    List<WineEntity> findByType(WineType type);

    List<WineEntity> findBySeoName(String seoName);

    // 대소문자 구분하지 않고 검색
    List<WineEntity> findBySeoNameContainsIgnoreCase(String seoName);

    // 국가 검색
    List<WineEntity> findByCountry(String country);

    @Query("SELECT w FROM wine w WHERE w.id != :wineId")
    List<WineEntity> findAllExceptWineId(@Param("wineId") Long wineId);

}
