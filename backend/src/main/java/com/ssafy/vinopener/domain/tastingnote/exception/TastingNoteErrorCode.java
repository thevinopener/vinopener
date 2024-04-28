package com.ssafy.vinopener.domain.tastingnote.exception;

import com.ssafy.vinopener.global.exception.ErrorCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.zalando.problem.Status;

@Getter
@RequiredArgsConstructor
public enum TastingNoteErrorCode implements ErrorCode {
    TASTING_NOTE_NOT_FOUND(Status.NOT_FOUND, "테이스팅노트를 찾을 수 없습니다.");

    private final Status status;
    private final String detail;

}
