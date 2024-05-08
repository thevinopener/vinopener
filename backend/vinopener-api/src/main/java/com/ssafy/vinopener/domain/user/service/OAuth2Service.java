package com.ssafy.vinopener.domain.user.service;

import com.ssafy.vinopener.domain.user.data.entity.TokenEntity;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.user.exception.OAuth2ErrorCode;
import com.ssafy.vinopener.domain.user.repository.TokenRepository;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.global.exception.VinopenerException;
import com.ssafy.vinopener.global.jwt.JwtProvider;
import com.ssafy.vinopener.global.oauth2.GoogleClient;
import com.ssafy.vinopener.global.oauth2.dto.response.GoogleAccountProfileResponse;
import javax.security.auth.login.LoginException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class OAuth2Service {

    private final GoogleClient googleClient;
    private final UserRepository userRepository;
    private final JwtProvider jwtProvider;
    private final TokenRepository tokenRepository;

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

    @Transactional
    public UserEntity loadUser(String accessToken) {
        GoogleAccountProfileResponse profile = googleClient.getGoogleAccountProfile(accessToken);
        UserEntity user = userRepository.findByEmail(profile.email()).orElse(null);

        //기가입 회원. 프로필 정보 업데이트
        if (user != null) {
            updateUser(user, profile);
        }
        //신규 회원. DB에 추가
        else {
            user = registerUser(profile);
        }
        return user;
    }

    public String refreshAccessToken(String bearerToken, String oldRefreshToken) {
        String accessToken = bearerToken.substring(7);
        Long userId = jwtProvider.parseIdForRefresh(accessToken);
        TokenEntity token = tokenRepository.findById(userId).orElse(null);
        if (token != null && oldRefreshToken.equals(token.getRefreshToken())) {
            UserEntity user = userRepository.findById(userId).orElse(null);
            if (user != null) {
                return jwtProvider.issueUserAccessToken(user);
            }
        } else {
            throw new VinopenerException(OAuth2ErrorCode.REFRESH_TOKEN_UNAUTHORIZED);
        }
        return null;
    }

    private UserEntity registerUser(GoogleAccountProfileResponse profile) {
        UserEntity user = UserEntity.builder()
                .email(profile.email())
                .nickname(profile.name())
                .imageUrl(profile.picture())
                .build();
        return userRepository.save(user);
    }

    @Transactional
    protected void updateUser(UserEntity user, GoogleAccountProfileResponse profile) {
        UserEntity updatedUser = UserEntity.builder()
                .email(profile.email())
                .nickname(profile.name())
                .imageUrl(profile.picture())
                .build();

        user.update(updatedUser);

//        findBy로 엔티티를 가져오고, 이걸 setter로 수정했으면 save 생략;
//        findBy로 엔티티를 가져온게 아니라, 바로 엔티티 만들어서(id를 넣어서) save하면 update;
//        id를 생략해서 엔티티를 만들면 insert;
    }

}
