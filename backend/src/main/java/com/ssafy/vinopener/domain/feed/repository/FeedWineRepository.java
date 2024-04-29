package com.ssafy.vinopener.domain.feed.repository;

import com.ssafy.vinopener.domain.feed.data.entity.FeedWineEntity;
import java.util.List;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedWineRepository extends JpaRepository<FeedWineEntity, Long> {

    // EntityGraph : 지정된 속성(테이블)이 즉시 로딩, N+1 해결.
    // 주어진 feedId를 가진 모든 FeedWineEntity 객체를 리스트로.
    @EntityGraph(attributePaths = {"wine"})
    List<FeedWineEntity> findAllByFeedId(Long feedId);

    // feedId를 가진 모든 FeedWineEntity 객체 삭제.
    void deleteAllByFeedId(Long feedId);

}
