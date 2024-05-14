package coffee.ssafy.vinopenerbatch;

import org.apache.kafka.clients.admin.NewTopic;
import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.config.TopicBuilder;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
@EnableBatchProcessing
public class VinopenerBatchApplication {

    public static void main(String[] args) {
        SpringApplication.run(VinopenerBatchApplication.class, args);
    }

//    @Bean
//    public NewTopic topic() {
//        return TopicBuilder.name("topic1")
//                .partitions(10)
//                .replicas(1)
//                .build();
//    }
//
//    @KafkaListener(id = "myId", topics = "topic1")
//    public void listen(String in) {
//        System.out.println(in);
//    }

}
