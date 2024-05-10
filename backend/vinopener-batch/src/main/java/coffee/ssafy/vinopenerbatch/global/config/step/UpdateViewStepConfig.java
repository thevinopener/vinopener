package coffee.ssafy.vinopenerbatch.global.config.step;

import coffee.ssafy.vinopenerbatch.global.reader.UpdateViewReader;
import coffee.ssafy.vinopenerbatch.global.writer.UpdateViewWriter;
import lombok.RequiredArgsConstructor;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.batch.core.step.builder.StepBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.PlatformTransactionManager;

@Configuration
public class UpdateViewStepConfig {

    private final String STEP_NAME = "updateViewStep";
    private final UpdateViewReader updateViewReader;
    private final UpdateViewWriter updateViewWriter;

    public UpdateViewStepConfig(
            UpdateViewReader updateViewReader,
            UpdateViewWriter updateViewWriter
    ) {
        this.updateViewReader = updateViewReader;
        this.updateViewWriter = updateViewWriter;
    }


    @Bean
    public Step updateViewStep(final JobRepository jobRepository,
            final PlatformTransactionManager platformTransactionManager) {
        return new StepBuilder(STEP_NAME, jobRepository)
                .<String, String>chunk(5, platformTransactionManager)
                .reader(updateViewReader.updateViewKafkaItemReader())
                .writer(updateViewWriter)
                .build();
    }

}
