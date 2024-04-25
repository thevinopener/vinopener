package com.ssafy.vinopener.domain.user.service;

import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.global.oauth2.AuthProviderType;
import com.ssafy.vinopener.global.oauth2.OAuth2UserInfo;
import com.ssafy.vinopener.global.oauth2.OAuth2UserInfoFactory;
import com.ssafy.vinopener.global.oauth2.UserPrincipal;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@RequiredArgsConstructor
@Service
@Slf4j
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {

    private final UserRepository userRepository;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest oAuth2UserRequest) throws OAuth2AuthenticationException {

        OAuth2UserService<OAuth2UserRequest, OAuth2User> oAuth2UserService = new DefaultOAuth2UserService();
        //oAuth2UserService.loadUser >>  (AccessToken을 가지고) OAuth2 제공자로부터 사용자 정보를 가져오는 역할
        OAuth2User oAuth2User = oAuth2UserService.loadUser(oAuth2UserRequest);

        //디버깅용 로그
        log.info("Loading OAuth2User: {}", oAuth2User);
        log.info("Authorities: {}", oAuth2User.getAuthorities());
        log.info("Attributes: {}", oAuth2User.getAttributes());

        if (oAuth2User.getAttributes().containsKey("email")) {
            log.info("User email: {}", oAuth2User.getAttributes().get("email"));
        }

        return processOAuth2User(oAuth2UserRequest, oAuth2User);

    }

    protected OAuth2User processOAuth2User(OAuth2UserRequest oAuth2UserRequest, OAuth2User oAuth2User) {
        AuthProviderType authProviderType = AuthProviderType.valueOf(
                oAuth2UserRequest.getClientRegistration().getRegistrationId().toUpperCase());
        OAuth2UserInfo oAuth2UserInfo = OAuth2UserInfoFactory.getOAuth2UserInfo(authProviderType,
                oAuth2User.getAttributes());

        if (!StringUtils.hasText(oAuth2UserInfo.getEmail())) {
            throw new RuntimeException("vinopener : Email not found from OAuth2 provider");
        }

        UserEntity user = userRepository.findByEmail(oAuth2UserInfo.getEmail()).orElse(null);
        //이미 회원가입된 회원이라면
        if (user != null) {
            user = updateUser(user, oAuth2UserInfo);
        }
        //가입되지 않은 경우
        else {
            user = registerUser(authProviderType, oAuth2UserInfo);
        }

        return UserPrincipal.create(user, oAuth2UserInfo.getAttributes());
    }

    private UserEntity registerUser(AuthProviderType authProvidertype, OAuth2UserInfo oAuth2UserInfo) {
        UserEntity user = UserEntity.builder()
                .email(oAuth2UserInfo.getEmail())
                .nickname(oAuth2UserInfo.getNickname())
//                .oauth2Id(oAuth2UserInfo.getOAuth2Id())
//                .authProvider(authProvider)
//                .role(Role.ROLE_USER)
                .build();

        return userRepository.save(user);
    }

    private UserEntity updateUser(UserEntity user, OAuth2UserInfo oAuth2UserInfo) {
        return userRepository.save(user.update(oAuth2UserInfo));
    }

}
