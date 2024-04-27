package com.ssafy.vinopener.domain.user.controller;

import com.ssafy.vinopener.domain.user.service.OAuth2Service;
import com.ssafy.vinopener.global.jwt.JwtProvider;
import com.ssafy.vinopener.global.oauth2.GoogleClient;
import com.ssafy.vinopener.global.oauth2.dto.response.GoogleAccountProfileResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.security.auth.login.LoginException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class OAuth2Controller {

    private final OAuth2Service oAuth2Service;
    private final GoogleClient googleClient;
    private final JwtProvider jwtProvider;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestParam("authentication") String authentication,
            HttpServletResponse response,
            HttpServletRequest request) {

        //액세스 토큰 요청
        String accessToken;

        try {
            accessToken = oAuth2Service.requestAccessToken(authentication);
        } catch (LoginException e) {
            return (ResponseEntity<?>) ResponseEntity.notFound();
        }

        //프로필 정보 받고
        GoogleAccountProfileResponse profile
                = googleClient.getGoogleAccountProfile(accessToken);

        //DB에 해당 이메일이 존재하는가?
        //신규 >>

//        String refreshToken;

        request.setAttribute("Authorization", "Bearer " + accessToken);
//        request.setAttribute("Refresh-Token", refreshToken);
        return ResponseEntity.ok(authentication);
    }

}
