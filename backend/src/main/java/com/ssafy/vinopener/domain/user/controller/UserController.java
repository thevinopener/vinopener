package com.ssafy.vinopener.domain.user.controller;

import com.ssafy.vinopener.domain.user.repository.TokenRepository;
import com.ssafy.vinopener.domain.user.repository.UserRepository;
import com.ssafy.vinopener.domain.user.service.UserService;
import com.ssafy.vinopener.global.config.props.JwtProps;
import com.ssafy.vinopener.global.jwt.JwtProvider;
import com.ssafy.vinopener.global.oauth2.UserPrincipal;
import java.util.HashMap;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserService userService;
    private final TokenRepository tokenRepository;
    private final UserRepository userRepository;
    private final JwtProvider jwtProvider;
    private final JwtProps jwtProps;

    @PostMapping("/test")
    public String test() {
        log.info("test 실행되었음. jwt도 잘 된듯?");
        String refreshToken = userService.getRefreshTokenByUserId(3L);
        log.info("test : refreshToken = " + refreshToken);
        return "test";
    }

//    @GetMapping("/refresh")
//    public ResponseEntity<?> refreshPage(HttpServletRequest request) {
//        //Access 토큰 재발급
//        String refreshToken = request.getParameter("Refresh-Token");
//        Claims payload = Jwts.parser()
//                .verifyWith(jwtProps.getAccessSecretKey())
//                .build()
//                .parseSignedClaims(refreshToken)
//                .getPayload();
//
//        TokenEntity token = tokenRepository.findByRefreshToken(refreshToken).orElse(null);
//
//        if (token != null) {
//            Long userId = token.getUserId();
//            if (userId == null) {
//                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Not found user");
//            }
//
//            UserEntity user = userRepository.findById(userId).orElse(null);
//            if (user != null) {
//                UserPrincipal principal;
////                String newAccessToken = jwtProvider.issueUserAccessToken()
//            }
//        }
//
//        return null;
//
//    }

    @GetMapping("/testAccess")
    public String getTestAccessToken() {
        Long id = 1L;
        String email = "ssafy.c207@gmail.com";
        String authority = "ROLE_USER";
        Map<String, Object> attributes = new HashMap<>();

        UserPrincipal user = new UserPrincipal(id, email, authority, attributes);
        String accessToken = jwtProvider.issueUserAccessToken(user);

        return "Test : " + accessToken;
    }

}
