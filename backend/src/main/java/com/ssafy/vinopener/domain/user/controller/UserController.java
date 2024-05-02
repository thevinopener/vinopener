package com.ssafy.vinopener.domain.user.controller;

import com.ssafy.vinopener.domain.user.data.dto.response.UserGetResponse;
import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import com.ssafy.vinopener.domain.user.repository.TokenRepository;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.domain.user.service.UserService;
import com.ssafy.vinopener.global.config.SwaggerConfig;
import com.ssafy.vinopener.global.config.props.JwtProps;
import com.ssafy.vinopener.global.jwt.JwtProvider;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final TokenRepository tokenRepository;
    private final UserRepository userRepository;
    private final JwtProvider jwtProvider;
    private final JwtProps jwtProps;

    /***
     * 테스트용 AccessToken 생성
     *
     * @return "Test : {테스트용 AccessToken}"
     */
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

    @GetMapping("/testRefreshToken")
    public String getTestRefreshToken(@RequestHeader("Authorization") String token) {

        String accessToken = token.substring(7);
        Long id = jwtProvider.parseId(accessToken);
        String email = "ssafy.c207@gmail.com";
        String nickname = "ssafy";

        UserEntity user = UserEntity.builder()
                .id(id)
                .email(email)
                .nickname(nickname)
                .build();

        return jwtProvider.issueUserRefreshToken(user);
    }

    /**
     * 사용자(자신, 본인)의 정보 조회
     *
     * @param accessToken JWT 액세스 토큰
     * @return 사용자 프로필 정보
     */
    @GetMapping("/me")
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<UserGetResponse> getMyInfo(@RequestHeader("Authorization") String accessToken) {

        UserGetResponse user = userService.getUserByToken(accessToken);
        if (user != null) {
            return ResponseEntity.ok(user);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    //다른 사용자의 정보를 가져오는게 필요하다면 더 자세한 구현이 필요. 아래 코드로는 정상작동하지 않습니다.
    @GetMapping("/{userId}")
    public ResponseEntity<UserGetResponse> getUserInfo(@PathVariable("userId") Long userId) {

        UserGetResponse user = userService.getUserByUserId(userId);
        if (user != null) {
            return ResponseEntity.ok(user);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * 사용자 로그아웃
     *
     * @param accessToken JWT 액세스 토큰
     */
    @DeleteMapping("/logout")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @Operation(security = @SecurityRequirement(name = SwaggerConfig.SECURITY_BEARER))
    public ResponseEntity<?> logout(@RequestHeader("Authorization") String accessToken) {
        userService.deleteTokenByToken(accessToken);
        return ResponseEntity.noContent().build();
    }

}
