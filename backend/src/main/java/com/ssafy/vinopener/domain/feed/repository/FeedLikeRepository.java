package com.ssafy.vinopener.domain.feed.repository;

import com.ssafy.vinopener.domain.feed.data.entity.FeedLikeEntity;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FeedLikeRepository extends JpaRepository<FeedLikeEntity, Long> {

    @EntityGraph(attributePaths = {"user"})
    List<FeedLikeRepository> findAllByFeedId(Long feedId);

    void deleteAllByFeedId(Long feedId);

}
