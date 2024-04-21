DROP TABLE IF EXISTS
    `AiChat`,
    `WineChat`,
    `UserChat`,
    `UserChatRoom`,
    `CellarItem`,
    `Bookmark`,
    `WineView`,
    `Search`,
    `FeedLike`,
    `FeedWine`,
    `Feed`,
    `TastingNoteResponseChoice`,
    `TastingNoteResponse`,
    `TastingNoteQuestion`,
    `TastingNote`,
    `PreferenceSurvey`,
    `Wine`,
    `User`;

CREATE TABLE `User`
(
    `user_id`      BIGINT PRIMARY KEY AUTO_INCREMENT,
    `email`        VARCHAR(320) NOT NULL UNIQUE,
    `nickname`     VARCHAR(16)  NOT NULL UNIQUE,
    `image_url`    VARCHAR(512),
    `created_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `Wine`
(
    `wine_id`      BIGINT PRIMARY KEY AUTO_INCREMENT,
    `name_ko`      VARCHAR(255)                                                       NOT NULL,
    `name_en`      VARCHAR(255)                                                       NOT NULL,
    `image_url`    VARCHAR(512)                                                       NOT NULL,
    `grape`        VARCHAR(255)                                                       NOT NULL,
    `country`      VARCHAR(255)                                                       NOT NULL,
    `region`       VARCHAR(255)                                                       NOT NULL,
    `price_min`    INT                                                                NOT NULL,
    `price_max`    INT                                                                NOT NULL,
    `price_avg`    INT                                                                NOT NULL,
    `score`        INT                                                                NOT NULL,
    `winery`       VARCHAR(255)                                                       NOT NULL,
    `year`         INT                                                                NOT NULL,
    `type`         ENUM ('RED', 'WHITE', 'ROSE', 'SPARKLING', 'DESSERT', 'FORTIFIED') NOT NULL,
    `view`         INT                                                                NOT NULL DEFAULT 0,
    `created_time` TIMESTAMP                                                          NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time` TIMESTAMP                                                          NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `PreferenceSurvey`
(
    `preference_survey_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    `user_id`              BIGINT                                                             NOT NULL,
    `type`                 ENUM ('RED', 'WHITE', 'ROSE', 'SPARKLING', 'DESSERT', 'FORTIFIED') NOT NULL,
    `min_abv`              INT                                                                NOT NULL,
    `max_abv`              INT                                                                NOT NULL,
    `sugar`                INT                                                                NOT NULL,
    `acidity`              INT                                                                NOT NULL,
    `tannin`               INT                                                                NOT NULL,
    `created_time`         TIMESTAMP                                                          NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time`         TIMESTAMP                                                          NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
);

CREATE TABLE `TastingNote`
(
    `tasting_note_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    `user_id`         BIGINT       NOT NULL,
    `wine_id`         BIGINT       NOT NULL,
    `image_url`       VARCHAR(512),
    `sugar`           INT          NOT NULL,
    `body`            INT          NOT NULL,
    `acidity`         INT          NOT NULL,
    `alcohol`         INT          NOT NULL,
    `tannin`          INT          NOT NULL,
    `opinion`         VARCHAR(255) NOT NULL,
    `score`           INT          NOT NULL,
    `created_time`    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time`    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
    FOREIGN KEY (`wine_id`) REFERENCES `Wine` (`wine_id`)
);

CREATE TABLE `TastingNoteQuestion`
(
    `tasting_note_question_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    `question`                 VARCHAR(16) NOT NULL,
    `is_multiple_choice`       BOOLEAN     NOT NULL,
    `created_time`             TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time`             TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `TastingNoteResponse`
(
    `tasting_note_response_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    `tasting_note_question_id` BIGINT      NOT NULL,
    `response`                 VARCHAR(16) NOT NULL,
    `created_time`             TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time`             TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`tasting_note_question_id`) REFERENCES `TastingNoteQuestion` (`tasting_note_question_id`)
);

CREATE TABLE `TastingNoteResponseChoice`
(
    `tasting_note_response_choice_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    `tasting_note_id`                 BIGINT    NOT NULL,
    `tasting_note_question_id`        BIGINT    NOT NULL,
    `tasting_note_response_id`        BIGINT    NOT NULL,
    `created_time`                    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time`                    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`tasting_note_id`) REFERENCES `TastingNote` (`tasting_note_id`),
    FOREIGN KEY (`tasting_note_question_id`) REFERENCES `TastingNoteQuestion` (`tasting_note_question_id`),
    FOREIGN KEY (`tasting_note_response_id`) REFERENCES `TastingNoteResponse` (`tasting_note_response_id`)
);

CREATE TABLE `Feed`
(
    `feed_id`      BIGINT PRIMARY KEY AUTO_INCREMENT,
    `user_id`      BIGINT       NOT NULL,
    `content`      VARCHAR(255) NOT NULL,
    `image_url`    VARCHAR(512) NOT NULL,
    `is_public`    BOOLEAN      NOT NULL,
    `created_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
);

CREATE TABLE `FeedWine`
(
    `feed_id`      BIGINT    NOT NULL,
    `wine_id`      BIGINT    NOT NULL,
    `created_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`feed_id`, `wine_id`),
    FOREIGN KEY (`feed_id`) REFERENCES `Feed` (`feed_id`),
    FOREIGN KEY (`wine_id`) REFERENCES `Wine` (`wine_id`)
);

CREATE TABLE `FeedLike`
(
    `feed_id`      BIGINT    NOT NULL,
    `user_id`      BIGINT    NOT NULL,
    `created_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`feed_id`, `user_id`),
    FOREIGN KEY (`feed_id`) REFERENCES `Feed` (`feed_id`),
    FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
);

CREATE TABLE `Search`
(
    `search_id`    BIGINT PRIMARY KEY AUTO_INCREMENT,
    `user_id`      BIGINT       NOT NULL,
    `content`      VARCHAR(255) NOT NULL,
    `created_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
);

CREATE TABLE `WineView`
(
    `user_id`      BIGINT    NOT NULL,
    `wine_id`      BIGINT    NOT NULL,
    `created_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`, `wine_id`),
    FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
    FOREIGN KEY (`wine_id`) REFERENCES `Wine` (`wine_id`)
);

CREATE TABLE `Bookmark`
(
    `user_id`      BIGINT    NOT NULL,
    `wine_id`      BIGINT    NOT NULL,
    `created_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`, `wine_id`),
    FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
    FOREIGN KEY (`wine_id`) REFERENCES `Wine` (`wine_id`)
);

CREATE TABLE `CellarItem`
(
    `cellar_id`     BIGINT PRIMARY KEY AUTO_INCREMENT,
    `user_id`       BIGINT    NOT NULL,
    `wine_id`       BIGINT    NOT NULL,
    `is_finished`   BOOLEAN   NOT NULL,
    `finished_date` TIMESTAMP NULL,
    `created_time`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
    FOREIGN KEY (`wine_id`) REFERENCES `Wine` (`wine_id`)
);

CREATE TABLE `UserChatRoom`
(
    `user_chat_room_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    `creator_id`        BIGINT    NOT NULL,
    `partner_id`        BIGINT    NOT NULL,
    `created_time`      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time`      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`creator_id`) REFERENCES `User` (`user_id`),
    FOREIGN KEY (`partner_id`) REFERENCES `User` (`user_id`)
);

CREATE TABLE `UserChat`
(
    `user_chat_id`      BIGINT PRIMARY KEY AUTO_INCREMENT,
    `user_chat_room_id` BIGINT       NOT NULL,
    `message`           VARCHAR(255) NOT NULL,
    `created_time`      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time`      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_chat_room_id`) REFERENCES `UserChatRoom` (`user_chat_room_id`)
);

CREATE TABLE `WineChat`
(
    `wine_chat_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    `wine_id`      BIGINT       NOT NULL,
    `user_id`      BIGINT       NOT NULL,
    `message`      VARCHAR(255) NOT NULL,
    `created_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`wine_id`) REFERENCES `Wine` (`wine_id`),
    FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
);

CREATE TABLE `AiChat`
(
    `ai_chat_id`   BIGINT PRIMARY KEY AUTO_INCREMENT,
    `user_id`      BIGINT       NOT NULL,
    `message`      VARCHAR(255) NOT NULL,
    `is_bot`       BOOLEAN      NOT NULL,
    `created_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
);
