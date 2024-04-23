INSERT INTO `tasting_note_question`
(tasting_note_question_id,
 question,
 is_multiple_choice)
VALUES (1, '색상', FALSE),
       (2, '붉은과일', TRUE),
       (3, '푸른과일', TRUE),
       (4, '검은과일', TRUE),
       (5, '말린과일', TRUE),
       (6, '녹색과일', TRUE),
       (7, '시트러스', TRUE),
       (8, '핵과류/멜론', TRUE),
       (9, '열대과일', TRUE),
       (10, '꽃', TRUE),
       (11, '그린노트', TRUE),
       (12, '향신료', TRUE),
       (13, '기타/흙', TRUE),
       (14, '오크/숙성', TRUE);

INSERT INTO `tasting_note_response`
(tasting_note_question_id,
 response)
VALUES (1, '밀짚색'),
       (1, '노란색'),
       (1, '황금색'),
       (1, '호박색'),
       (1, '갈색'),
       (1, '구리색'),
       (1, '연어색'),
       (1, '분홍색'),
       (1, '루비색'),
       (1, '보라색'),
       (1, '석류색'),
       (1, '황갈색');
