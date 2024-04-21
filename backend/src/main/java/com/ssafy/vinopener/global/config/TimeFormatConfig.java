package com.ssafy.vinopener.global.config;

import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import java.time.format.DateTimeFormatter;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TimeFormatConfig {

    private static final String LOCAL_DATE_TIME_PATTERN = "yyyy-MM-dd'T'HH:mm:ss";

    @Bean
    public Jackson2ObjectMapperBuilderCustomizer jackson2ObjectMapperBuilderCustomizer() {
        return builder -> builder
            .timeZone("Asia/Seoul")
            .simpleDateFormat(LOCAL_DATE_TIME_PATTERN)
            .serializers(
                new LocalDateSerializer(DateTimeFormatter.ofPattern(LOCAL_DATE_TIME_PATTERN)));
    }
}
