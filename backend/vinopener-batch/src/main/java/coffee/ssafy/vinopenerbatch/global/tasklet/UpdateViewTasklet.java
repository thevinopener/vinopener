package coffee.ssafy.vinopenerbatch.global.tasklet;

import coffee.ssafy.vinopenerbatch.global.writer.UpdateViewWriter;
import org.springframework.batch.core.StepContribution;
import org.springframework.batch.core.scope.context.ChunkContext;
import org.springframework.batch.core.step.tasklet.Tasklet;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.stereotype.Component;

@Component
public class UpdateViewTasklet implements Tasklet {
    private final UpdateViewWriter updateViewWriter;

    public UpdateViewTasklet(UpdateViewWriter updateViewWriter) {
        this.updateViewWriter = updateViewWriter;
    }

    @Override
    public RepeatStatus execute(StepContribution contribution, ChunkContext chunkContext) throws Exception {
        updateViewWriter.write(null);
        return RepeatStatus.FINISHED;
    }
}
