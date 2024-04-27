package com.ssafy.vinopener.domain.user.service;

import com.ssafy.vinopener.global.oauth2.GoogleClient;
import javax.security.auth.login.LoginException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OAuth2Service {

    private final GoogleClient googleClient;

    public String requestAccessToken(String authentication) throws LoginException {
        return googleClient.getGoogleAccessToken(authentication);
    }

}
