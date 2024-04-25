package com.ssafy.vinopener.domain.tastingnote.repository;

import com.ssafy.vinopener.domain.tastingnote.data.entity.TastingNoteFlavourEntity;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TastingNoteFlavourRepository extends JpaRepository<TastingNoteFlavourEntity, Long> {

    @EntityGraph(attributePaths = {"flavourType", "flavourTaste"})
    List<TastingNoteFlavourEntity> findAllByTastingNoteId(Long tastingNoteId);

    void deleteAllByTastingNoteId(Long tastingNoteId);

}
