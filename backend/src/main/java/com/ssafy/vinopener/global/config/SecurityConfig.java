package com.ssafy.vinopener.global.config;

import com.ssafy.vinopener.domain.user.service.CustomOAuth2UserService;
import com.ssafy.vinopener.global.jwt.JwtAuthenticationFilter;
import com.ssafy.vinopener.global.oauth2.HttpCookieOAuth2Repository;
import com.ssafy.vinopener.global.oauth2.OAuth2AuthenticationFailureHandler;
import com.ssafy.vinopener.global.oauth2.OAuth2AuthenticationSuccessHandler;
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
    private final OAuth2AuthenticationSuccessHandler oAuth2AuthenticationSuccessHandler;
    private final OAuth2AuthenticationFailureHandler oAuth2AuthenticationFailureHandler;
    private final HttpCookieOAuth2Repository httpCookieOAuth2Repository;

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
                        .authenticationEntryPoint(problemSupport)
                        .accessDeniedHandler(problemSupport));
        http
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(HttpMethod.POST, "/test1", "/test2", "/user/test").hasAnyAuthority("ROLE_USER")
                        .anyRequest().permitAll())
                .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);
//        http
//                .oauth2Login(oAuth2LoginConfigurer -> oAuth2LoginConfigurer
//                        .authorizationEndpoint(config -> config.baseUri("/v1/oauth2/authorize"))
//                        .redirectionEndpoint(config -> config.baseUri("/v1/oauth2/callback/**")));
        http
                .oauth2Login(oAuth2LoginConfigurer -> oAuth2LoginConfigurer
                        // 최초 소셜로그인 버튼 클릭시 FE -> BE 로 요청되는 주소. 이떄 FE는, BE가 FE에 인가코드를 요청하기 위한 주소를 {authorizationEndpoint} 단계에서 넘겨준다.
                        .authorizationEndpoint(
                                config -> config.baseUri("/auth/authorize")
                                        .authorizationRequestRepository(httpCookieOAuth2Repository)
                        )
                        // 이후 BE는 FE에 {redirect-url}로 Redirection 하면서 인가코드를 요청하게 되는데,
                        // 이때 요청하면서 BE는 FE가 인가코드를 받아왔을 때 BE에 넘겨주기 위한 Redirection 주소를 {redirectionEndpoint} 단계에서 넘겨준다.
                        .redirectionEndpoint(config -> config.baseUri("/auth/callback/**"))
                        .userInfoEndpoint(config -> config.userService(customOAuth2UserService))
                        .successHandler(oAuth2AuthenticationSuccessHandler)
                        .failureHandler(oAuth2AuthenticationFailureHandler));

        return http.build();
    }

}
