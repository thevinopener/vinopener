package com.ssafy.vinopener.domain.user.controller;

import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.user.service.OAuth2Service;
import com.ssafy.vinopener.global.jwt.JwtProvider;
import com.ssafy.vinopener.global.oauth2.GoogleClient;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
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

    @PostMapping("/login/google")
    public ResponseEntity<?> login(@RequestParam("code") String code,
            HttpServletResponse response,
            HttpServletRequest request) {

        //액세스 토큰 요청
        String oAuth2AccessToken = oAuth2Service.requestAccessToken(code);
        //프로필 정보 요청 및 가입여부 확인 후 유저 정보 return
        UserEntity user = oAuth2Service.loadUser(oAuth2AccessToken);
        String accessToken = jwtProvider.issueUserAccessToken(user);
        String refreshToken = jwtProvider.issueUserRefreshToken(user);

        Map<String, String> tokens = new HashMap<>();
        tokens.put("access-token", "Bearer " + accessToken);
        tokens.put("refresh-token", refreshToken);

        return ResponseEntity.ok(tokens);
    }

    @PostMapping("/refresh")
    public ResponseEntity<?> refresh(
            @RequestHeader("Authorization") String accessToken,
            @RequestHeader("refresh-token") String refreshToken
    ) {
        String newAccessToken = oAuth2Service.refreshAccessToken(accessToken, refreshToken);

        Map<String, String> token = new HashMap<>();
        token.put("access-token", "Bearer " + newAccessToken);

        return ResponseEntity.ok(token);
    }

}
