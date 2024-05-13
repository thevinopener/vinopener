package coffee.ssafy.vinopenerbatch.global.config.job;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.job.builder.JobBuilder;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class UpdateRateJobConfig {
    public static final String JOB_NAME = "updateRateJob";

    private final Step updateRateStep;

    public UpdateRateJobConfig(@Qualifier("updateRateStep") final Step updateRateStep) {
        this.updateRateStep = updateRateStep;
    }

    @Bean
    public Job updateRateJob(final JobRepository jobRepository) {
        return new JobBuilder(JOB_NAME, jobRepository)
                .start(updateRateStep)
                .build();
    }
}
