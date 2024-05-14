package coffee.ssafy.vinopenerbatch.global.config.step;

import coffee.ssafy.vinopenerbatch.global.reader.UpdateViewReader;
import coffee.ssafy.vinopenerbatch.global.tasklet.UpdateCellarTasklet;
import coffee.ssafy.vinopenerbatch.global.tasklet.UpdateRateTasklet;
import coffee.ssafy.vinopenerbatch.global.writer.UpdateViewWriter;
import lombok.RequiredArgsConstructor;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.batch.core.step.builder.StepBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.PlatformTransactionManager;

@Configuration
@RequiredArgsConstructor
public class StepConfig {
    private final UpdateCellarTasklet updateCellarTasklet;
    private final UpdateRateTasklet updateRateTasklet;
    private final UpdateViewReader updateViewReader;
    private final UpdateViewWriter updateViewWriter;

    @Bean
    public Step updateViewStep(
            final JobRepository jobRepository,
            final PlatformTransactionManager platformTransactionManager
    ) {
        return new StepBuilder("updateViewStep", jobRepository)
                .<String, String>chunk(5, platformTransactionManager)
                .reader(updateViewReader.updateViewKafkaItemReader())
                .writer(updateViewWriter)
                .build();
    }

    @Bean
    public Step updateCellarStep(
            final JobRepository jobRepository,
            final PlatformTransactionManager platformTransactionManager
    ) {
        return new StepBuilder("updateCellarStep", jobRepository)
                .tasklet(updateCellarTasklet, platformTransactionManager)
                .build();

    }

    @Bean
    public Step updateRateStep(
            final JobRepository jobRepository,
            final PlatformTransactionManager platformTransactionManager
    ) {
        return new StepBuilder("updateRateStep", jobRepository)
                .tasklet(updateRateTasklet, platformTransactionManager)
                .build();
    }

}
