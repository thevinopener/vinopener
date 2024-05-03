package com.ssafy.vinopener.global.websocket;

import com.ssafy.vinopener.global.jwt.JwtProvider;
import com.ssafy.vinopener.global.oauth2.UserPrincipal;
import java.util.Objects;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class StompInterceptor implements ChannelInterceptor {

    private final JwtProvider jwtProvider;

    @Override
    public Message<?> preSend(final Message<?> message, final MessageChannel channel) {
        final var accessor = StompHeaderAccessor.wrap(message);
        if (StompCommand.CONNECT == accessor.getCommand()) {
            final var accessToken = accessor.getFirstNativeHeader("accessToken");
            final var userPrincipal = (UserPrincipal) jwtProvider.getAuthentication(accessToken).getPrincipal();
            Objects.requireNonNull(accessor.getSessionAttributes()).put("userId", userPrincipal.getId());
        }
        return message;
    }

}
