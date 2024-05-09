package com.ssafy.vinopener.domain.bookmark.repository;

import com.ssafy.vinopener.domain.bookmark.data.entity.BookmarkEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface BookmarkRepository extends JpaRepository<BookmarkEntity, Long> {

    @Modifying
    @Query("DELETE FROM bookmark b WHERE b.wine.id = :wineId AND b.user.id = :userId")
    void deleteByWineIdAndUserId(Long userId, Long wineId);

    List<BookmarkEntity> findAllByUserId(Long userId);

    // 즐겨찾기 존재 여부
    boolean existsByWineIdAndUserId(Long wineId, Long userId);

    void deleteByIdAndUserId(Long id, Long userId);

    boolean existsByIdAndUserId(Long id, Long userId);

}
