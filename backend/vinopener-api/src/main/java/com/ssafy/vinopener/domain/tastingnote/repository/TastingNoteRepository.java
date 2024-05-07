package com.ssafy.vinopener.domain.tastingnote.repository;

import com.ssafy.vinopener.domain.tastingnote.data.entity.TastingNoteEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TastingNoteRepository extends JpaRepository<TastingNoteEntity, Long>, TastingNoteRepositoryQuery {

    void deleteByIdAndUserId(Long id, Long userId);

    // 테이스팅 노트 작성 개수
    int countByWineIdAndUserId(Long wineId, Long userId);

}
