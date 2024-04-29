package com.ssafy.vinopener.domain.user.service;

import com.ssafy.vinopener.domain.user.data.dto.response.UserGetResponse;
import com.ssafy.vinopener.domain.user.data.mapper.UserMapper;
import com.ssafy.vinopener.domain.user.exception.UserErrorCode;
import com.ssafy.vinopener.domain.user.repository.TokenRepository;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.global.exception.VinopenerException;
import com.ssafy.vinopener.global.jwt.JwtProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private final TokenRepository tokenRepository;
    private final UserRepository userRepository;
    private final UserMapper userMapper;
    private final JwtProvider jwtProvider;

    public UserGetResponse getUserByToken(String token) {
        String accessToken = token.substring(7);
        Long userId = jwtProvider.parseId(accessToken);

        return userRepository.findById(userId)
                .map(userMapper::toGetResponse)
                .orElseThrow(() -> new VinopenerException(UserErrorCode.USER_NOT_FOUND));
    }

    public UserGetResponse getUserByUserId(Long userId) {
        return userRepository.findById(userId)
                .map(userMapper::toGetResponse)
                .orElseThrow(() -> new VinopenerException(UserErrorCode.USER_NOT_FOUND));
    }

    public void deleteTokenByToken(String bearerToken) {
        String accessToken = bearerToken.substring(7);
        Long userId = jwtProvider.parseId(accessToken);
        tokenRepository.deleteById(userId);
    }

}
