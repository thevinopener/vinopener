package com.ssafy.vinopener.domain.aichat.service;

import com.ssafy.vinopener.domain.aichat.data.entity.AssistantThreadEntity;
import com.ssafy.vinopener.domain.aichat.repository.AssistantThreadRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AiChatSaveService {

    private final AssistantThreadRepository assistantThreadRepository;

    @Transactional
    public void saveThreadId(AssistantThreadEntity assistantThreadEntity) {
        assistantThreadRepository.save(assistantThreadEntity);
    }

}
