package com.ssafy.vinopener.domain.user.service;

import com.ssafy.vinopener.domain.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OAuth2Service extends DefaultOAuth2UserService {

    private final UserRepository userRepository;

    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User user = super.loadUser(userRequest);

//        try {
//            return this.process(userRequest, user);
//        } catch (AuthenticationException e) {
//            throw e;
//        } catch (Exception e) {
//            e.printStackTrace();
//            throw new InternalAuthenticationServiceException(e.getMessage(), e.getCause());
//        }

        try {
            return this.process(userRequest, user);
        } catch (Exception e) {
            e.printStackTrace();
            throw new InternalAuthenticationServiceException(e.getMessage(), e.getCause());
        }

    }

    private OAuth2User process(OAuth2UserRequest userRequest, OAuth2User user) {
        return null;
    }

}
