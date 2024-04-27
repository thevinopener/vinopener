package com.ssafy.vinopener.global.config;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.security.SecurityScheme;
import io.swagger.v3.oas.models.security.SecurityScheme.Type;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {

    public static final String SECURITY_BEARER = "bearer-key";

    @Bean
    public OpenAPI openAPI() {
        return new OpenAPI()
                .components(new Components()
                        .addSecuritySchemes(SECURITY_BEARER,
                                new SecurityScheme()
                                        .type(Type.HTTP)
                                        .scheme("bearer")
                                        .bearerFormat("JWT")));
    }

}
