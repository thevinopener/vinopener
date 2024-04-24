package com.ssafy.vinopener.domain.user.repository;

import com.ssafy.vinopener.domain.user.data.entity.TokenEntity;
import java.util.Optional;
import org.springframework.data.repository.CrudRepository;

public interface TokenRepository extends CrudRepository<TokenEntity, Long> {

    Optional<TokenEntity> findByRefreshToken(final String refreshToken);

    Optional<TokenEntity> findByAccessToken(final String accessToken);

}
