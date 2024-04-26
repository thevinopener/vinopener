package com.ssafy.vinopener.global.config;

import com.ssafy.vinopener.domain.user.service.CustomOAuth2UserService;
import com.ssafy.vinopener.global.jwt.JwtAuthenticationFilter;
import com.ssafy.vinopener.global.oauth2.AuthEntryPoint;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.zalando.problem.spring.web.advice.security.SecurityProblemSupport;

@Configuration
@EnableWebSecurity
@Import(SecurityProblemSupport.class)
@RequiredArgsConstructor
public class SecurityConfig {

    private final SecurityProblemSupport problemSupport;
    private final CustomOAuth2UserService customOAuth2UserService;

    @Bean
    public SecurityFilterChain configure(HttpSecurity http, JwtAuthenticationFilter jwtAuthenticationFilter)
            throws Exception {
        http
                .httpBasic(AbstractHttpConfigurer::disable)
                .formLogin(AbstractHttpConfigurer::disable)
                .logout(AbstractHttpConfigurer::disable)
                .csrf(AbstractHttpConfigurer::disable)
                .headers(headers -> headers.frameOptions(HeadersConfigurer.FrameOptionsConfig::disable))
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS));
        http
                .exceptionHandling(configurer -> configurer
//                        .authenticationEntryPoint(problemSupport)
                        .authenticationEntryPoint(new AuthEntryPoint())
                        .accessDeniedHandler(problemSupport));

        //로그인 구현 완료 이전 테스트용 설정
        http
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(HttpMethod.POST, "/test1", "/test2", "/user/test").hasAnyAuthority("ROLE_USER")
                        .anyRequest().permitAll())
                .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);

        //로그인 구현이 완료 되었을 때 아래 설정을 적용.
//        http
//                .authorizeHttpRequests(auth -> auth
//                        //로그인 시에는 Token 인증 패스
//                        .requestMatchers(HttpMethod.POST, "/auth/login/**").permitAll()
//                        //액세스토큰 만료로 인한 토큰 재발급시에도 Token 인증 패스
//                        .requestMatchers(HttpMethod.GET, "/user/refresh/").permitAll()
//                        .anyRequest().authenticated())
//                .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);

//        http
//                .oauth2Login(oAuth2LoginConfigurer -> oAuth2LoginConfigurer
//                        // 최초 소셜로그인 버튼 클릭시 FE -> BE 로 요청되는 주소. FE에서 /auth/login/** 으로 요청이 들어오면 Security가 해당 OAuth제공측의 페이지로 넘겨줌.
//                        // 이때, 모든 과정이 끝나고 우리의 커스텀accessToken, refreshToken을 FE에 다시 보내줘야 하므로, FE측에선 redirect_url을 줘야함.
//                        .authorizationEndpoint(
//                                config -> config.baseUri("/auth/login")
//                                        .authorizationRequestRepository(httpCookieOAuth2Repository)
//                        )
//                        // 사용자가 소셜 로그인을 성공했을 경우, redirectionEndpoint로 인가코드가 들어온다.
//                        // Security는 그 인가코드를 OAuth제공자에게 보내 AccessToken(From OAuth제공 측)을 발급받고,
//                        // customOAuth2UserService에서 그 AccessToken으로 사용자 정보를 받아와 우리의 DB에 등록한다.
//                        .redirectionEndpoint(config -> config.baseUri("/auth/callback/**"))
//                        .userInfoEndpoint(config -> config.userService(customOAuth2UserService))
//                        // 위의 과정이 성공하면 SuccessHandler로 가서 authorizationEndpoint에 들어온 당시의 redirect_url로
//                        // accessToken(우리꺼), refreshToken을 담아서 보낸다.
//                        .successHandler(oAuth2AuthenticationSuccessHandler)
//                        .failureHandler(oAuth2AuthenticationFailureHandler));

        return http.build();
    }

}
