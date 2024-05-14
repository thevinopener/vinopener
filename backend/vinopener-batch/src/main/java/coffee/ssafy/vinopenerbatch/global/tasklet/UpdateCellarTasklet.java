package coffee.ssafy.vinopenerbatch.global.tasklet;

import coffee.ssafy.vinopenerbatch.global.writer.UpdateCellarWriter;
import org.springframework.batch.core.StepContribution;
import org.springframework.batch.core.scope.context.ChunkContext;
import org.springframework.batch.core.step.tasklet.Tasklet;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.stereotype.Component;

@Component
public class UpdateCellarTasklet implements Tasklet {
    private final UpdateCellarWriter updateCellarWriter;

    public UpdateCellarTasklet(UpdateCellarWriter updateCellarWriter) {
        this.updateCellarWriter = updateCellarWriter;
    }

    @Override
    public RepeatStatus execute(StepContribution contribution, ChunkContext chunkContext) throws Exception {
        updateCellarWriter.write(null);
        return RepeatStatus.FINISHED;
    }
}
