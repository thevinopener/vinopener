package coffee.ssafy.vinopenerbatch.global.config.job;

import coffee.ssafy.vinopenerbatch.global.config.step.StepConfig;
import lombok.RequiredArgsConstructor;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.job.builder.JobBuilder;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@RequiredArgsConstructor
public class JobConfig {

    //각각의 Step의 구현은 StepConfig에서 확인.
    private final StepConfig stepConfig;
    private final Step updateViewStep;
    private final Step updateRateStep;
    private final Step updateCellarStep;

    @Bean
    public Job updateViewJob(final JobRepository jobRepository) {
        return new JobBuilder("updateViewJob", jobRepository)
                .start(updateViewStep)
                .build();
    }

    @Bean
    public Job updateRateJob(final JobRepository jobRepository) {
        return new JobBuilder("updateRateJob", jobRepository)
                .start(updateRateStep)
                .build();
    }

    @Bean
    public Job updateCellarJob(final JobRepository jobRepository) {
        return new JobBuilder("updateCellarJob", jobRepository)
                .start(updateCellarStep)
                .build();
    }
}
