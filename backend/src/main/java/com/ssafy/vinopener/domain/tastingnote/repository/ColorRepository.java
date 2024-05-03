package com.ssafy.vinopener.domain.tastingnote.repository;

import com.ssafy.vinopener.domain.tastingnote.data.entity.ColorEntity;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ColorRepository extends JpaRepository<ColorEntity, Long> {

    Optional<ColorEntity> findByName(String name);

}
