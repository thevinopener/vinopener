package com.ssafy.vinopener.domain.cellar.repository;

import com.ssafy.vinopener.domain.cellar.data.entity.CellarEntity;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CellarRepository extends JpaRepository<CellarEntity, Long> {

    List<CellarEntity> findAllByUserId(Long userId);

    Page<CellarEntity> findAllByUserId(Long userId, Pageable pageable);

    Optional<CellarEntity> findByIdAndUserId(Long id, Long userId);

    void deleteByIdAndUserId(Long id, Long userId);

    boolean existsByIdAndUserId(Long id, Long userId);

    boolean existsByWineIdAndUserId(Long wineId, Long userId);

    void deleteByWineIdAndUserId(Long wineId, Long userId);

}
