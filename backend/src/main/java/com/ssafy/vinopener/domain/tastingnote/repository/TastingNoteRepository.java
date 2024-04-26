package com.ssafy.vinopener.domain.tastingnote.repository;

import com.ssafy.vinopener.domain.tastingnote.data.entity.TastingNoteEntity;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TastingNoteRepository extends JpaRepository<TastingNoteEntity, Long> {

    List<TastingNoteEntity> findAllByUserId(Long userId);

    Optional<TastingNoteEntity> findByIdAndUserId(Long id, Long userId);

    boolean existsByIdAndUserId(Long id, Long userId);

    void deleteByIdAndUserId(Long id, Long userId);

}
