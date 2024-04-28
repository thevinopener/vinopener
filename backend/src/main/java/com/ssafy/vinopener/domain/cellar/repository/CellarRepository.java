package com.ssafy.vinopener.domain.cellar.repository;

import com.ssafy.vinopener.domain.cellar.data.entity.CellarEntity;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CellarRepository extends JpaRepository<CellarEntity, Long> {

    List<CellarEntity> findAllByUserId(Long userId);

    Optional<CellarEntity> findByIdAndUserId(Long id, Long userId);

    void deleteByIdAndUserId(Long id, Long userId);

    boolean existsByIdAndUserId(Long id, Long userId);

}
