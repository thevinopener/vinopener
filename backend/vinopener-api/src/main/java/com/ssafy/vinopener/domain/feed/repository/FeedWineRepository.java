package com.ssafy.vinopener.domain.feed.repository;

import com.ssafy.vinopener.domain.feed.data.entity.FeedWineEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface FeedWineRepository extends JpaRepository<FeedWineEntity, Long> {

    // EntityGraph : 지정된 속성(테이블)이 즉시 로딩, N+1 해결.
    // 주어진 feedId를 가진 모든 FeedWineEntity 객체를 리스트로.
    @EntityGraph(attributePaths = {"wine"})
    List<FeedWineEntity> findAllByFeedId(Long feedId);

    @EntityGraph(attributePaths = {"wine"})
    Page<FeedWineEntity> findAllByFeedId(Long feedId, Pageable pageable);

    @EntityGraph(attributePaths = {"wine"})
    List<FeedWineEntity> findByFeedId(Long feedId);

    @EntityGraph(attributePaths = {"wine"})
    Page<FeedWineEntity> findByFeedId(Long feedId, Pageable pageable);

    // feedId를 가진 모든 FeedWineEntity 객체 삭제.
    void deleteAllByFeedId(Long feedId);

}
