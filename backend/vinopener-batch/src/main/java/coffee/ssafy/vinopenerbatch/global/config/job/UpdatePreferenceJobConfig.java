package coffee.ssafy.vinopenerbatch.global.config.job;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.job.builder.JobBuilder;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//@Configuration
//public class UpdatePreferenceJobConfig {
//    public static final String JOB_NAME = "updatePreferenceJob";
//
//    private final Step updatePreferenceStep;
//
//    public UpdatePreferenceJobConfig(@Qualifier("updatePreferenceStep") final Step updatePreferenceStep) {
//        this.updatePreferenceStep = updatePreferenceStep;
//    }
//
//    @Bean
//    public Job udpatePreferenceJob(final JobRepository jobRepository) {
//        return new JobBuilder(JOB_NAME, jobRepository)
//                .start(updatePreferenceStep)
//                .build();
//    }
//}
