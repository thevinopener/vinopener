package com.ssafy.vinopener.domain.user.exception;

import com.ssafy.vinopener.global.exception.ErrorCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.zalando.problem.Status;

@Getter
@RequiredArgsConstructor
public enum OAuth2ErrorCode implements ErrorCode {
    ACCESS_TOKEN_NOT_FOUND(Status.NOT_FOUND, "액세스토큰 발급에 실패했습니다."),
    PROFILE_NOT_FOUND(Status.NOT_FOUND, "프로필 정보를 가져오는데 실패했습니다."),
    REFRESH_TOKEN_UNAUTHORIZED(Status.UNAUTHORIZED, "리프레시 토큰이 만료되었습니다. 재로그인 해주세요");

    private final Status status;
    private final String detail;
}
