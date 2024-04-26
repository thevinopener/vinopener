package com.ssafy.vinopener.domain.bookmark.repository;

import com.ssafy.vinopener.domain.bookmark.data.dto.response.BookmarkGetListResponse;
import com.ssafy.vinopener.domain.bookmark.data.entity.BookmarkEntity;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.*;

public interface BookmarkRepository extends JpaRepository<BookmarkEntity, Long> {
    List<BookmarkEntity> findAllByUserId(Long userId);

    void deleteByUserIdAndWineId(Long userId, Long wineId);

    boolean existsByUserIdAndWineId(Long userId, Long wineId);

    boolean existsByUserId(Long userId);
}
