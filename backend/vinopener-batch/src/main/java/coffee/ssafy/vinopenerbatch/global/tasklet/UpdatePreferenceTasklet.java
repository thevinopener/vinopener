package coffee.ssafy.vinopenerbatch.global.tasklet;

import coffee.ssafy.vinopenerbatch.global.writer.UpdatePreferenceWriter;
import org.springframework.batch.core.StepContribution;
import org.springframework.batch.core.scope.context.ChunkContext;
import org.springframework.batch.core.step.tasklet.Tasklet;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.stereotype.Component;

@Component
public class UpdatePreferenceTasklet implements Tasklet {
    private final UpdatePreferenceWriter updatePreferenceWriter;

    public UpdatePreferenceTasklet(final UpdatePreferenceWriter updatePreferenceWriter) {
        this.updatePreferenceWriter = updatePreferenceWriter;
    }

    @Override
    public RepeatStatus execute(StepContribution contribution, ChunkContext chunkContext) throws Exception {
        updatePreferenceWriter.write(null);
        return RepeatStatus.FINISHED;
    }

}
