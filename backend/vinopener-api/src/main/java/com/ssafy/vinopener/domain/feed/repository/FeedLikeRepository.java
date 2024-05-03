package com.ssafy.vinopener.domain.feed.repository;

import com.ssafy.vinopener.domain.feed.data.entity.FeedLikeEntity;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedLikeRepository extends JpaRepository<FeedLikeEntity, Long> {

    @EntityGraph(attributePaths = {"user"})
    List<FeedLikeEntity> findAllByFeedId(Long feedId);

    // 좋아요
    @EntityGraph(attributePaths = {"user"})
    Optional<FeedLikeEntity> findByFeedIdAndUserId(Long feedId, Long userId);

    // 좋아요 취소
    void deleteByFeedIdAndUserId(Long feedId, Long userId);

    int countByFeedId(Long feedId);

//    void deleteAllByFeedId(Long feedId);

}
