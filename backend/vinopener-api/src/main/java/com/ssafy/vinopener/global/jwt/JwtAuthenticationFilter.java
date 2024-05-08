package com.ssafy.vinopener.global.jwt;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssafy.vinopener.global.exception.VinopenerException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
@RequiredArgsConstructor
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private final JwtProvider jwtProvider;
    private final ObjectMapper objectMapper;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {

        if ("/auth/refresh".equals(request.getRequestURI())) {
            filterChain.doFilter(request, response);
            return;
        }
        
        try {
            String bearerToken = request.getHeader(HttpHeaders.AUTHORIZATION);
            if (bearerToken != null && bearerToken.startsWith("Bearer ")) {
                String accessToken = bearerToken.substring(7);
                Authentication authentication = jwtProvider.getAuthentication(accessToken);
                SecurityContextHolder.getContext().setAuthentication(authentication);
            }
            filterChain.doFilter(request, response);
        } catch (VinopenerException ex) {
            // 응답 설정
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.setContentType("application/json;charset=UTF-8");

            logger.info(ex.toString());

            // 문제 상세 정보 작성
            Map<String, Object> errorDetails = new HashMap<>();
            errorDetails.put("title", "JWT Token Error");
            errorDetails.put("status", HttpServletResponse.SC_UNAUTHORIZED);
            errorDetails.put("detail", ex.getMessage());

            // JSON으로 변환하여 응답 본문에 작성
            response.getWriter().write(objectMapper.writeValueAsString(errorDetails));
        }

    }

}
