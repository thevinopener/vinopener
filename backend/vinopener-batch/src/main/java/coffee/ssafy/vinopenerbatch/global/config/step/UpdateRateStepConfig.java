package coffee.ssafy.vinopenerbatch.global.config.step;

import coffee.ssafy.vinopenerbatch.global.reader.UpdateRateReader;
import coffee.ssafy.vinopenerbatch.global.tasklet.UpdateRateTasklet;
import coffee.ssafy.vinopenerbatch.global.writer.UpdateRateWriter;
import coffee.ssafy.vinopenerbatch.global.writer.UpdateViewWriter;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.batch.core.step.builder.StepBuilder;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.PlatformTransactionManager;

@Configuration
public class UpdateRateStepConfig {

    private final String STEP_NAME = "updateRateStep";
    private final UpdateRateTasklet updateRateTasklet;

    public UpdateRateStepConfig(UpdateRateTasklet updateRateTasklet) {
        this.updateRateTasklet = updateRateTasklet;
    }


    @Bean
    public Step updateRateStep(final JobRepository jobRepository,
            final PlatformTransactionManager platformTransactionManager) {
//        return new StepBuilder(STEP_NAME, jobRepository)
//                .<String, String>chunk(5, platformTransactionManager)
//                .reader(updateRateReader.updateRateKafkaItemReader())
//                .writer(updateRateWriter)
//                .build();

        return new StepBuilder(STEP_NAME, jobRepository)
                .tasklet(updateRateTasklet)
                .transactionManager(platformTransactionManager)
                .build();
    }
}
