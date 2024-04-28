package com.ssafy.vinopener.domain.bookmark.repository;

import com.ssafy.vinopener.domain.bookmark.data.entity.BookmarkEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface BookmarkRepository extends JpaRepository<BookmarkEntity, Long> {

    List<BookmarkEntity> findAllByUserId(Long userId);

    void deleteByIdAndUserId(Long id, Long userId);

    boolean existsByIdAndUserId(Long id, Long userId);

}
