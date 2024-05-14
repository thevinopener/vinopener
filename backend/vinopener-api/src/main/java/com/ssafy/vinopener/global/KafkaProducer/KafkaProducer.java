package com.ssafy.vinopener.global.KafkaProducer;

import lombok.RequiredArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class KafkaProducer {

    private final KafkaTemplate<String, Object> kafkaTemplate;

    public void sendTopic(String topic, Object data) {
        kafkaTemplate.send(topic, data);
    }

}
