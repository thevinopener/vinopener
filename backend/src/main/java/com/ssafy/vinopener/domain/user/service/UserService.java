package com.ssafy.vinopener.domain.user.service;

import com.ssafy.vinopener.domain.user.data.dto.response.UserGetResponse;
import com.ssafy.vinopener.domain.user.data.mapper.UserMapper;
import com.ssafy.vinopener.domain.user.repository.TokenRepository;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.global.jwt.JwtProvider;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    private final TokenRepository tokenRepository;
    private final UserRepository userRepository;
    private final UserMapper userMapper;
    private final JwtProvider jwtProvider;

    public UserGetResponse getUserByToken(String token) {
        String accessToken = token.substring(7);
        Long userId = jwtProvider.parseId(accessToken);

        return userRepository.findById(userId).map(entity -> userMapper.toGetResponse(entity)).orElse(null);
    }

    public UserGetResponse getUserByUserId(Long userId) {
        return userRepository.findById(userId).map(entity -> userMapper.toGetResponse(entity)).orElse(null);
    }

    public void deleteTokenByToken(String bearerToken) {
        String accessToken = bearerToken.substring(7);
        log.info("bearer token: {}", bearerToken);
        log.info("accessToken: {}", accessToken);
        Long userId = jwtProvider.parseId(accessToken);
        tokenRepository.deleteById(userId);
    }

}
