package coffee.ssafy.vinopenerbatch.global.reader;

import coffee.ssafy.vinopenerbatch.global.config.KafkaConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.springframework.batch.item.kafka.KafkaItemReader;
import org.springframework.batch.item.kafka.builder.KafkaItemReaderBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.boot.ssl.SslBundles;
import org.springframework.stereotype.Component;
import java.time.Duration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

@Component
public class UpdateViewReader {

    private final KafkaConsumerConfig kafkaConsumerConfig;
    private final KafkaConsumer<String, String> kafkaConsumer;

    public UpdateViewReader(
            KafkaConsumerConfig kafkaConsumerConfig,
            KafkaConsumer<String, String> kafkaConsumer) {
        this.kafkaConsumerConfig = kafkaConsumerConfig;
        this.kafkaConsumer = kafkaConsumer;
    }

    @Value("${kafka.topics.update-view}")
    public String topic;

    public KafkaItemReader<String, String> updateViewKafkaItemReader() {
        Properties props = new Properties();
        Map<String, Object> mapProps = new HashMap<>(kafkaConsumerConfig.consumerFactory().getConfigurationProperties());
//        mapProps.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");

        props.putAll(mapProps);
//        props.putAll(kafkaProperties.buildConsumerProperties(sslBundles));
//        props.put("group.id", "vinopener_group");

        return new KafkaItemReaderBuilder<String, String>()
                .name("updateViewReader")
                .topic(topic)
                .partitions(0)
                .consumerProperties(props)
                .pollTimeout(Duration.ofSeconds(1L))
                .partitionOffsets(new HashMap<>())
                .saveState(true)
                .build();
    }


}
