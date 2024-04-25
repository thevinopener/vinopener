package com.ssafy.vinopener.domain.user.service;

import com.ssafy.vinopener.domain.user.data.entity.TokenEntity;
import com.ssafy.vinopener.domain.user.repository.TokenRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    @Autowired
    private TokenRepository tokenRepository;

    public String getRefreshTokenByUserId(Long userId) {
        TokenEntity tokenEntity = tokenRepository.findById(userId).orElse(null);
        if (tokenEntity != null) {
            return tokenEntity.getRefreshToken();
        }
        return null;
    }

}
