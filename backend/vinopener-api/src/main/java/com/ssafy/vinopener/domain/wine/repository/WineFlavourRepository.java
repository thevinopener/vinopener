package com.ssafy.vinopener.domain.wine.repository;

import com.ssafy.vinopener.domain.wine.data.entity.WineFlavourEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WineFlavourRepository extends JpaRepository<WineFlavourEntity, Long> {

    //    List<Long> findAllByWineId(Long wineId);
    List<WineFlavourEntity> findByWineId(Long wineId);

}
