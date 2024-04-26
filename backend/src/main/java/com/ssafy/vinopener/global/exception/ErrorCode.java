package com.ssafy.vinopener.global.exception;

import org.zalando.problem.Status;

public interface ErrorCode {

    String name();

    Status getStatus();

    String getDetail();

}
