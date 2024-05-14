package com.ssafy.vinopener.global.config;

import java.util.HashMap;
import java.util.Map;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.common.serialization.StringSerializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.core.DefaultKafkaProducerFactory;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.core.ProducerFactory;

@Configuration
public class KafkaProducerConfig {

    @Bean
    public ProducerFactory<String, Object> producerFactory() {
        Map<String, Object> props = new HashMap<>();

        //Producer가 kafka에 연결할 broker의 위치.
        props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
        //producer가 key, value를 kafka에 전송하기 전에, 데이터를 byte array로 변환하는 직렬화 과정이 필요함.
        //Serializer 및 DeSerializer 에는 다음이 있음.
        //String, Boolean, Byte, Double, Float, Integer, Long, Short, UUID, List, Void
        //보통 데이터를 kafka에 보낼때, send("topic명", 보낼 데이터) 이렇게 보내는데, 보낼 데이터의 타입이 Serializer에서
        //직렬화가 가능한 타입이어야 함.
        props.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
        props.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
//        props.put("acks", "all");
//        props.put("retries", 0);
//        props.put("batch.size", 16384);
//        props.put("linger.ms", 1);
//        props.put("buffer.memory", 33554432);
        return new DefaultKafkaProducerFactory<>(props);
    }

    @Bean
    public KafkaTemplate<String, Object> kafkaTemplate() {
        return new KafkaTemplate<>(producerFactory());
    }

}
