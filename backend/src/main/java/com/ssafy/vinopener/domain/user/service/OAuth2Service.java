package com.ssafy.vinopener.domain.user.service;

import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.user.exception.OAuth2ErrorCode;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.global.exception.VinopenerException;
import com.ssafy.vinopener.global.oauth2.GoogleClient;
import com.ssafy.vinopener.global.oauth2.dto.response.GoogleAccountProfileResponse;
import javax.security.auth.login.LoginException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OAuth2Service {

    private final GoogleClient googleClient;
    private final UserRepository userRepository;

    public String requestAccessToken(String authentication) {
        try {
            return googleClient.getGoogleAccessToken(authentication);
        } catch (LoginException e) {
            throw new VinopenerException(OAuth2ErrorCode.ACCESS_TOKEN_NOT_FOUND);
        }
    }

    public GoogleAccountProfileResponse requestAccountProfile(String accessToken) {
        try {
            return googleClient.getGoogleAccountProfile(accessToken);
        } catch (Exception e) {
            throw new VinopenerException(OAuth2ErrorCode.PROFILE_NOT_FOUND);
        }
    }

    public UserEntity loadUser(String accessToken) {
        GoogleAccountProfileResponse profile = googleClient.getGoogleAccountProfile(accessToken);
        UserEntity user = userRepository.findByEmail(profile.email()).orElse(null);

        //기가입 회원. 프로필 정보 업데이트
        if (user != null) {
            user = updateUser(user);
        }
        //신규 회원. DB에 추가
        else {
            user = registerUser(profile);
        }

        return user;
    }

    private UserEntity registerUser(GoogleAccountProfileResponse profile) {
        UserEntity user = UserEntity.builder()
                .email(profile.email())
                .nickname(profile.name())
                .build();

        return userRepository.save(user);
    }

    private UserEntity updateUser(UserEntity user) {
        return userRepository.save(user.update(user));
    }

}
