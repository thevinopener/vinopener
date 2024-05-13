package com.ssafy.vinopener.domain.feed.repository;

import com.ssafy.vinopener.domain.feed.data.entity.FeedEntity;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedRepository extends JpaRepository<FeedEntity, Long> {

    List<FeedEntity> findAllByUserId(Long userId);

    Page<FeedEntity> findAllByUserId(Long userId, Pageable pageable);

    Optional<FeedEntity> findByIdAndUserId(Long id, Long userId);

    boolean existsByIdAndUserId(Long id, Long userId);

    void deleteByIdAndUserId(Long id, Long userId);

}
