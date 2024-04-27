package com.ssafy.vinopener.global.annotations;

import com.ssafy.vinopener.global.config.TimeFormatConfig;
import io.swagger.v3.oas.annotations.media.Schema;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import org.springframework.format.annotation.DateTimeFormat;

@Target({ElementType.ANNOTATION_TYPE, ElementType.FIELD, ElementType.METHOD, ElementType.PARAMETER, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Schema(type = "string", example = TimeFormatConfig.LOCAL_DATE_TIME_EXAMPLE)
@DateTimeFormat(pattern = TimeFormatConfig.LOCAL_DATE_TIME_PATTERN)
public @interface LocalDateTimeFormat {

}
