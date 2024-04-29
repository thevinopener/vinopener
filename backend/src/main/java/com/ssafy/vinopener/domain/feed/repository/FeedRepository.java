package com.ssafy.vinopener.domain.feed.repository;

import com.ssafy.vinopener.domain.feed.data.entity.FeedEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedRepository extends JpaRepository<FeedEntity, Long> {

    List<FeedEntity> findAllByUserId(Long userId);

    boolean existsByIdAndUserId(Long id, Long userId);

    void deleteByIdAndUserId(Long id, Long userId);

}
