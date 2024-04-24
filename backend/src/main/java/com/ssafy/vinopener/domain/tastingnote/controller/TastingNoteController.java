package com.ssafy.vinopener.domain.tastingnote.controller;

import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetListResponse;
import com.ssafy.vinopener.domain.tastingnote.data.dto.response.TastingNoteGetResponse;
import com.ssafy.vinopener.domain.tastingnote.service.TastingNoteService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/tasting-notes")
@RequiredArgsConstructor
public class TastingNoteController {

    private final TastingNoteService tastingNoteService;

    /**
     * 테이스팅노트 목록 조회
     * <p>
     * 페이지네이션이 있습니다.
     *
     * @return 테이스팅노트 목록
     */
    @GetMapping
    public ResponseEntity<List<TastingNoteGetListResponse>> getList(
            // TODO: pagination 추가
    ) {
        return ResponseEntity.ok(tastingNoteService.getList());
    }

    /**
     * 테이스팅노트 상세 조회
     *
     * @param tastingNoteId 테이스팅노트 ID
     * @return 테이스팅노트
     */
    @GetMapping("/{tastingNoteId}")
    public ResponseEntity<TastingNoteGetResponse> get(
            @PathVariable final Long tastingNoteId
    ) {
        return ResponseEntity.ok(tastingNoteService.get(tastingNoteId));
    }

}
