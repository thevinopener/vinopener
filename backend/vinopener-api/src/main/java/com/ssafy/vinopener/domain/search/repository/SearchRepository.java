package com.ssafy.vinopener.domain.search.repository;

import com.ssafy.vinopener.domain.search.data.entity.SearchEntity;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SearchRepository extends JpaRepository<SearchEntity, Long> {

    List<SearchEntity> findAllByUserId(Long userId);

    // 개별 삭제
    void deleteByIdAndUserId(Long id, Long userId);

    // 전체 삭제
    void deleteAllByUserId(Long userId);

    // 검색어가 이미 존재하는지 확인
//    Optional<SearchEntity> findByContent(String query);
    Optional<SearchEntity> findByUserIdAndContent(Long userId, String query);

}
