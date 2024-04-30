package com.ssafy.vinopener.domain.feed.repository;

import com.ssafy.vinopener.domain.feed.data.entity.FeedLikeEntity;
import java.util.List;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedLikeRepository extends JpaRepository<FeedLikeEntity, Long> {

    @EntityGraph(attributePaths = {"user"})
    List<FeedLikeEntity> findAllByFeedId(Long feedId);

    @EntityGraph(attributePaths = {"user"})
    FeedLikeEntity findByFeedId(Long feedId);

    void deleteAllByFeedId(Long feedId);

}
