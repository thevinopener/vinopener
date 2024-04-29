package com.ssafy.vinopener.domain.user.repository;

import com.ssafy.vinopener.domain.user.data.entity.TokenEntity;
import org.springframework.data.repository.CrudRepository;

public interface TokenRepository extends CrudRepository<TokenEntity, Long> {

}
