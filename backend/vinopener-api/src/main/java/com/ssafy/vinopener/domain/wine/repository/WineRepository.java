package com.ssafy.vinopener.domain.wine.repository;

import com.ssafy.vinopener.domain.wine.data.entity.WineEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WineRepository extends JpaRepository<WineEntity, Long> {

}
