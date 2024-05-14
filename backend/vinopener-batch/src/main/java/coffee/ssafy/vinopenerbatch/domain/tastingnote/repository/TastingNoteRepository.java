package coffee.ssafy.vinopenerbatch.domain.tastingnote.repository;

import coffee.ssafy.vinopenerbatch.domain.tastingnote.entity.TastingNoteEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TastingNoteRepository extends JpaRepository<TastingNoteEntity, Long>, TastingNoteRepositoryQuery {

    void deleteByIdAndUserId(Long id, Long userId);

    // 테이스팅 노트 작성 개수
    int countByWineIdAndUserId(Long wineId, Long userId);

}
