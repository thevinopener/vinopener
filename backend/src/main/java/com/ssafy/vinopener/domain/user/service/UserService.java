package com.ssafy.vinopener.domain.user.service;

import com.ssafy.vinopener.domain.user.data.entity.TokenEntity;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.user.repository.TokenRepository;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.global.jwt.JwtProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private final TokenRepository tokenRepository;
    private final UserRepository userRepository;
    private final JwtProvider jwtProvider;

    public String getRefreshTokenByUserId(Long userId) {
        TokenEntity tokenEntity = tokenRepository.findById(userId).orElse(null);
        if (tokenEntity != null) {
            return tokenEntity.getRefreshToken();
        }
        return null;
    }

    public UserEntity getUserByToken(String token) {
        String accessToken = token.substring(7);
        Long userId = jwtProvider.parseId(accessToken);
        return userRepository.findById(userId).orElse(null);
    }

    public UserEntity getUserByUserId(Long userId) {
        return userRepository.findById(userId).orElse(null);
    }

    public void deleteTokenByToken(String bearerToken) {
        String accessToken = bearerToken.substring(7);
        Long userId = jwtProvider.parseId(accessToken);
        tokenRepository.deleteById(userId);
    }

}
