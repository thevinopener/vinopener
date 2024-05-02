package com.ssafy.vinopener.domain.user.controller;

import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.user.service.OAuth2Service;
import com.ssafy.vinopener.global.jwt.JwtProvider;
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
    private final JwtProvider jwtProvider;

    /**
     * @param token 사용자 구글 프로필 요청을 위한 Access Token
     * @return vinopener에서 사용할 Access Token과 Refresh Token
     */
    @PostMapping("/login/google")
    public ResponseEntity<Map<String, String>> login(@RequestParam("token") String token) {

        //프로필 정보 요청 및 가입여부 확인 후 유저 정보 return
        UserEntity user = oAuth2Service.loadUser(token);
        String accessToken = jwtProvider.issueUserAccessToken(user);
        String refreshToken = jwtProvider.issueUserRefreshToken(user);

        Map<String, String> tokens = new HashMap<>();
        tokens.put("access-token", "Bearer " + accessToken);
        tokens.put("refresh-token", refreshToken);

        return ResponseEntity.ok(tokens);
    }

    /**
     * @param accessToken  vinopener Access Token
     * @param refreshToken vinopener Refresh Token
     * @return 새로 발급된 Access Token
     */
    @PostMapping("/refresh")
    public ResponseEntity<Map<String, String>> refresh(
            @RequestHeader("Authorization") String accessToken,
            @RequestHeader("refresh-token") String refreshToken
    ) {
        String newAccessToken = oAuth2Service.refreshAccessToken(accessToken, refreshToken);

        Map<String, String> token = new HashMap<>();
        token.put("access-token", "Bearer " + newAccessToken);

        return ResponseEntity.ok(token);
    }

    @PostMapping("/testAccessToken")
    public ResponseEntity<?> testAccessToken(@RequestParam("token") String token) {
        UserEntity user = oAuth2Service.loadUser(token);

        return ResponseEntity.ok(user);
    }

}
