package com.ssafy.vinopener;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

@SpringBootApplication
@ConfigurationPropertiesScan
public class VinopenerApplication {

    public static void main(String[] args) {
        SpringApplication.run(VinopenerApplication.class, args);
    }

}
