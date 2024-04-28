package com.ssafy.vinopener.domain.user.controller;

import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.user.repository.TokenRepository;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.domain.user.service.UserService;
import com.ssafy.vinopener.global.config.props.JwtProps;
import com.ssafy.vinopener.global.jwt.JwtProvider;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users")
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserService userService;
    private final TokenRepository tokenRepository;
    private final UserRepository userRepository;
    private final JwtProvider jwtProvider;
    private final JwtProps jwtProps;

    @GetMapping("/testAccess")
    public String getTestAccessToken() {
        Long id = 1L;
        String email = "ssafy.c207@gmail.com";
        String nickname = "ssafy";

        UserEntity user = UserEntity.builder()
                .id(id)
                .email(email)
                .nickname(nickname)
                .build();
        String accessToken = jwtProvider.issueUserAccessToken(user);

        return "Test : " + accessToken;
    }

    @GetMapping("/me")
    public ResponseEntity<UserEntity> getMyInfo(@RequestHeader("Authorization") String accessToken) {

        UserEntity user = userService.getUserByToken(accessToken);
        if (user != null) {
            return ResponseEntity.ok(user);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/{userId}")
    public ResponseEntity<UserEntity> getUserInfo(@PathVariable("userId") Long userId) {

        UserEntity user = userService.getUserByUserId(userId);
        if (user != null) {
            return ResponseEntity.ok(user);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/logout")
    public ResponseEntity<?> logout(@RequestHeader("Authorization") String accessToken) {
        userService.deleteTokenByToken(accessToken);
        return ResponseEntity.noContent().build();
    }

}
