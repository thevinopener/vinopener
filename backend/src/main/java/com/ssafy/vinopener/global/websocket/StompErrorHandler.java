package com.ssafy.vinopener.global.websocket;

import com.ssafy.vinopener.global.exception.VinopenerException;
import java.nio.charset.StandardCharsets;
import org.springframework.lang.Nullable;
import org.springframework.messaging.Message;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.StompSubProtocolErrorHandler;

@Component
public class StompErrorHandler extends StompSubProtocolErrorHandler {

    @Override
    public Message<byte[]> handleClientMessageProcessingError(
            @Nullable final Message<byte[]> clientMessage,
            final Throwable ex
    ) {
        if (ex instanceof VinopenerException e) {
            final var accessor = StompHeaderAccessor.create(StompCommand.ERROR);
            accessor.setMessage(e.getTitle());
            accessor.setLeaveMutable(true);
            return MessageBuilder.createMessage(
                    e.getDetail().getBytes(StandardCharsets.UTF_8),
                    accessor.getMessageHeaders()
            );
        }
        return super.handleClientMessageProcessingError(clientMessage, ex);
    }

}
