package com.ssafy.vinopener.global.jwt;

import com.ssafy.vinopener.global.exception.ErrorCode;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.zalando.problem.Status;

@Getter
@AllArgsConstructor
public enum JwtErrorCode implements ErrorCode {
    MALFORMED_TOKEN(Status.UNAUTHORIZED, "잘못된 JWT 서명입니다."),
    EXPIRED_TOKEN(Status.UNAUTHORIZED, "만료된 JWT 토큰입니다."),
    INVALID_TOKEN(Status.UNAUTHORIZED, "유효하지 않은 토큰입니다.");

    private final Status status;
    private final String detail;
}
