package coffee.ssafy.vinopenerbatch.global.scheduler;

//import coffee.ssafy.vinopenerbatch.global.config.JobConfigurer;
import coffee.ssafy.vinopenerbatch.global.config.job.JobConfig;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.JobParametersInvalidException;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.repository.JobExecutionAlreadyRunningException;
import org.springframework.batch.core.repository.JobInstanceAlreadyCompleteException;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
@Slf4j
@RequiredArgsConstructor
public class BatchScheduler {

    private final JobLauncher jobLauncher;
    private final JobRepository jobRepository;
    private final JobConfig jobConfig;


    //조회수 기반 추천 스케쥴러
    @Scheduled(cron = "0 */2 * * * *")
    public void viewRecommendationSchedule() {
        // job parameter 설정

        JobParameters jobParameters = new JobParametersBuilder()
                .addString("view.id", createTimestamp())
                .toJobParameters();

        try {
            jobLauncher.run(jobConfig.updateViewJob(jobRepository), jobParameters);
        } catch (JobExecutionAlreadyRunningException | JobInstanceAlreadyCompleteException
                 | JobParametersInvalidException | org.springframework.batch.core.repository.JobRestartException e) {

            log.error(e.getMessage());

        }
    }

    //평점 기반 추천 스케쥴러
    @Scheduled(cron = "20 */2 * * * *")
    public void rateRecommendationSchedule() {
        // job parameter 설정

        JobParameters jobParameters = new JobParametersBuilder()
                .addString("rate.id", createTimestamp())
                .toJobParameters();

        try {
            jobLauncher.run(jobConfig.updateRateJob(jobRepository), jobParameters);
        } catch (JobExecutionAlreadyRunningException | JobInstanceAlreadyCompleteException
                 | JobParametersInvalidException | org.springframework.batch.core.repository.JobRestartException e) {

            log.error(e.getMessage());

        }
    }

    //셀러에 많이 추가한 사람 수 기반 추천 스케쥴러
    @Scheduled(cron = "30 */2 * * * *")
    public void cellarRecommendationSchedule() {
        // job parameter 설정

        JobParameters jobParameters = new JobParametersBuilder()
                .addString("cellar.id", createTimestamp())
                .toJobParameters();

        try {
            jobLauncher.run(jobConfig.updateCellarJob(jobRepository), jobParameters);
        } catch (JobExecutionAlreadyRunningException | JobInstanceAlreadyCompleteException
                 | JobParametersInvalidException | org.springframework.batch.core.repository.JobRestartException e) {

            log.error(e.getMessage());

        }
    }

    private String createTimestamp() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        return dateFormat.format(new Date());
    }

}
