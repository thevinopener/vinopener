package coffee.ssafy.vinopenerbatch.global.tasklet;

import coffee.ssafy.vinopenerbatch.global.writer.UpdateRateWriter;
import org.springframework.batch.core.StepContribution;
import org.springframework.batch.core.scope.context.ChunkContext;
import org.springframework.batch.core.step.tasklet.Tasklet;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.stereotype.Component;

@Component
public class UpdateRateTasklet implements Tasklet {
    private final UpdateRateWriter updateRateWriter;

    public UpdateRateTasklet(UpdateRateWriter updateRateWriter) {
        this.updateRateWriter = updateRateWriter;
    }

    @Override
    public RepeatStatus execute(StepContribution contribution, ChunkContext chunkContext) throws Exception {
        updateRateWriter.write(null);  // 특정 데이터 없이 writer를 실행
        return RepeatStatus.FINISHED;
    }
}
