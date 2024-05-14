package coffee.ssafy.vinopenerbatch.global.config;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.springframework.batch.item.ItemReader;
import org.springframework.batch.item.ItemWriter;
import org.springframework.batch.item.NonTransientResourceException;
import org.springframework.batch.item.ParseException;
import org.springframework.batch.item.UnexpectedInputException;
import org.springframework.batch.item.kafka.KafkaItemReader;
import org.springframework.batch.item.kafka.builder.KafkaItemReaderBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.core.ConsumerFactory;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

@Configuration
@Slf4j
@RequiredArgsConstructor
public class BatchConfig {

    private final KafkaConsumerConfig kafkaConsumerConfig;

    @Bean
    public KafkaItemReader<String, String> kakfaItemReader() {
        Map<String, Object> props = new HashMap<>(kafkaConsumerConfig.consumerFactory().getConfigurationProperties());
        props.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");

        Properties consumerProps = new Properties();
        consumerProps.putAll(props);

        return new KafkaItemReaderBuilder<String, String>()
                .name("wineViewReader")
                .partitions(0)
                .consumerProperties(consumerProps)
                .topic("view")
                .build();
    }

}
