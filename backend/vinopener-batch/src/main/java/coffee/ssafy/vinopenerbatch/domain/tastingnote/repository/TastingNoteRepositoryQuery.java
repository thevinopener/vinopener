package coffee.ssafy.vinopenerbatch.domain.tastingnote.repository;

import coffee.ssafy.vinopenerbatch.domain.tastingnote.entity.TastingNoteEntity;

import java.util.List;
import java.util.Optional;

public interface TastingNoteRepositoryQuery {

    List<TastingNoteEntity> findAllByUserId(Long userId);

    Optional<TastingNoteEntity> findByIdAndUserId(Long id, Long userId);

}
