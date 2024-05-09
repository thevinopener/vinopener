package coffee.ssafy.vinopenerbatch.global.config;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.job.builder.JobBuilder;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.batch.core.step.builder.StepBuilder;
import org.springframework.batch.item.ItemReader;
import org.springframework.batch.item.ItemWriter;
import org.springframework.batch.item.NonTransientResourceException;
import org.springframework.batch.item.ParseException;
import org.springframework.batch.item.UnexpectedInputException;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.PlatformTransactionManager;

@Configuration
@RequiredArgsConstructor
@Slf4j
public class JobConfig {

    private final PlatformTransactionManager transactionManager;

    @Bean
    public Job testJob(JobRepository jobRepository) {
        return new JobBuilder("testJob", jobRepository)
                .start(testFirstStep(jobRepository))
                .build();
    }

    @Bean
    public Step testFirstStep(JobRepository jobRepository) {
        return new StepBuilder("testFirstStep", jobRepository)
                .<String, String>chunk(1000, transactionManager)
                .reader(itemReader())
//                .processor(itemProcessor())
                .writer(itemWriter())
                .build();
    }

    @Bean
    public ItemReader<String> itemReader() {

        // 실질적으로 DB와의 통신이 구현되는 부분임.
        return new ItemReader<String>() {
            private boolean dataRead = false;
            @Override
            public String read()
                    throws Exception, UnexpectedInputException, ParseException, NonTransientResourceException {

                //Spring Batch의 ItemReader는 null이 return 될때까지 계속 읽는다고함.
                //그래서 EOF 처럼, 모든 작업이 끝났을 때 null이 return 되어야함.
                if (!dataRead) {
                    dataRead = true; // 데이터를 한 번 읽었음을 표시
                    return "READ OK";
                } else {
                    return null; // 데이터가 더 이상 없음을 알림
                }
            }
        };
    }

    @Bean
    public ItemWriter<String> itemWriter() {
        return strList -> {
            strList.forEach(
                    str -> log.info("str : {}", str)
            );
        };
    }


}
