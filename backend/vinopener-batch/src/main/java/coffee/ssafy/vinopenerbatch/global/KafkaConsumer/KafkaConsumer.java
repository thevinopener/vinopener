package coffee.ssafy.vinopenerbatch.global.KafkaConsumer;

import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class KafkaConsumer {


    @KafkaListener(topics = "test_topic", groupId = "group_1")
    public void listener(Object data) {
        log.info(data.toString());
    }
}
