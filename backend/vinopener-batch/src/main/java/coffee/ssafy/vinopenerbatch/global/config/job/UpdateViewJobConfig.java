package coffee.ssafy.vinopenerbatch.global.config.job;

import lombok.RequiredArgsConstructor;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.job.builder.JobBuilder;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class UpdateViewJobConfig {
    public static final String JOB_NAME = "viewUpdateJob";

    private final Step updateViewStep;

    public UpdateViewJobConfig(@Qualifier("updateViewStep") Step updateViewStep) {
        this.updateViewStep = updateViewStep;
    }

    @Bean
    public Job updateViewJob(final JobRepository jobRepository) {
        return new JobBuilder(JOB_NAME, jobRepository)
                .start(updateViewStep)
                .build();
    }

}
