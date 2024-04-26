package com.ssafy.vinopener.global.config;

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

        return http.build();
    }

}
