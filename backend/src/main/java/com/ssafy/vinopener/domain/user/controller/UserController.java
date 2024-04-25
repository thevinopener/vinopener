package com.ssafy.vinopener.domain.user.controller;

import com.ssafy.vinopener.domain.user.service.UserService;
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

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/test")
    public String test() {
        log.info("test 실행되었음. jwt도 잘 된듯?");
        String refreshToken = userService.getRefreshTokenByUserId(3L);
        log.info("test : refreshToken = " + refreshToken);
        return "test";
    }

}
