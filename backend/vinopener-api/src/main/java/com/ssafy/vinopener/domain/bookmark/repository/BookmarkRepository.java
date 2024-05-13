package com.ssafy.vinopener.domain.bookmark.repository;

import com.ssafy.vinopener.domain.bookmark.data.entity.BookmarkEntity;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookmarkRepository extends JpaRepository<BookmarkEntity, Long> {

    void deleteByWineIdAndUserId(Long wineId, Long userId);

    List<BookmarkEntity> findAllByUserId(Long userId);

    Page<BookmarkEntity> findAllByUserId(Long userId, Pageable pageable);

    // 즐겨찾기 존재 여부
    boolean existsByWineIdAndUserId(Long wineId, Long userId);

    void deleteByIdAndUserId(Long id, Long userId);

    boolean existsByIdAndUserId(Long id, Long userId);

}
