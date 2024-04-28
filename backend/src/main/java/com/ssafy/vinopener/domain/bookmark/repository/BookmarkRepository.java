package com.ssafy.vinopener.domain.bookmark.repository;

import com.ssafy.vinopener.domain.bookmark.data.entity.BookmarkEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookmarkRepository extends JpaRepository<BookmarkEntity, Long> {

    List<BookmarkEntity> findAllByUserId(Long userId);

    void deleteByUserIdAndWineId(Long userId, Long wineId);

    boolean existsByUserIdAndWineId(Long userId, Long wineId);

    boolean existsByUserId(Long userId);

}
