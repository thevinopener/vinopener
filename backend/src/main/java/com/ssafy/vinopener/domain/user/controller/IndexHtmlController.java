package com.ssafy.vinopener.domain.user.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexHtmlController {

    @GetMapping("/")
    public ResponseEntity<String> ShowIndexHtml() throws IOException {
        Resource resource = new ClassPathResource("static/index.html");
        String body = StreamUtils.copyToString(resource.getInputStream(), Charset.defaultCharset());
        return ResponseEntity.ok().body(body);
    }

}
