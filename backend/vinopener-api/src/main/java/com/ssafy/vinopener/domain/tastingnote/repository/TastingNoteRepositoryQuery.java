package com.ssafy.vinopener.domain.tastingnote.repository;

import com.ssafy.vinopener.domain.tastingnote.data.entity.TastingNoteEntity;
import java.util.List;
import java.util.Optional;

public interface TastingNoteRepositoryQuery {

    List<TastingNoteEntity> findAllByUserId(Long userId);

    Optional<TastingNoteEntity> findByIdAndUserId(Long id, Long userId);

}
