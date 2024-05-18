package coffee.ssafy.vinopenerbatch.global.config.step;

import coffee.ssafy.vinopenerbatch.global.tasklet.UpdateCellarTasklet;
import coffee.ssafy.vinopenerbatch.global.tasklet.UpdateRateTasklet;
import coffee.ssafy.vinopenerbatch.global.tasklet.UpdateViewTasklet;
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
    private final UpdateViewTasklet updateViewTasklet;
    private final UpdateCellarTasklet updateCellarTasklet;
    private final UpdateRateTasklet updateRateTasklet;

    // 일단 kafka 없이 scheduler로만 조회수 기반 추천 테이블 갱신
    @Bean
    public Step updateViewStep(
            final JobRepository jobRepository,
            final PlatformTransactionManager platformTransactionManager
    ) {
        return new StepBuilder("updateViewStep", jobRepository)
                .tasklet(updateViewTasklet, platformTransactionManager)
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
