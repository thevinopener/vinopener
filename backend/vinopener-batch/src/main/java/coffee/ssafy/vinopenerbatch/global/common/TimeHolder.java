package coffee.ssafy.vinopenerbatch.global.common;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

public class TimeHolder {

    @Getter
    private static volatile LocalDateTime viewLastTime = null;

    public static void setLastTime(final LocalDateTime viewLastTime) {
        TimeHolder.viewLastTime = viewLastTime;
    }


}
