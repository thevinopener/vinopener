DROP TABLE IF EXISTS
  `ai_chat`,
  `wine_chat`,
  `user_chat`,
  `user_chat_room`,
  `cellar_wine`,
  `bookmark`,
  `wine_view`,
  `search`,
  `feed_like`,
  `feed_wine`,
  `feed`,
  `tasting_note_flavour`,
  `tasting_note`,
  `color`,
  `wine_flavour`,
  `wine`,
  `flavour_taste`,
  `flavour_type`,
  `preference`,
  `user`;

CREATE TABLE `user`
(
  `user_id`      BIGINT PRIMARY KEY AUTO_INCREMENT,
  `email`        VARCHAR(320) NOT NULL UNIQUE,
  `nickname`     VARCHAR(16)  NOT NULL UNIQUE,
  `image_url`    VARCHAR(512),
  `created_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `preference`
(
  `preference_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `user_id`       BIGINT                                                             NOT NULL,
  `type`          ENUM ('RED', 'WHITE', 'ROSE', 'SPARKLING', 'DESSERT', 'FORTIFIED') NOT NULL,
  `min_abv`       INT                                                                NOT NULL,
  `max_abv`       INT                                                                NOT NULL,
  `sweetness`     DECIMAL(2, 1)                                                      NOT NULL,
  `acidity`       DECIMAL(2, 1)                                                      NOT NULL,
  `tannin`        DECIMAL(2, 1)                                                      NOT NULL,
  `created_time`  TIMESTAMP                                                          NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time`  TIMESTAMP                                                          NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
);

CREATE TABLE `flavour_type`
(
  `flavour_type_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `name`            VARCHAR(16) NOT NULL,
  `created_time`    TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time`    TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `flavour_taste`
(
  `flavour_taste_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `flavour_type_id`  BIGINT      NOT NULL,
  `name`             VARCHAR(16) NOT NULL,
  `created_time`     TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time`     TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`flavour_type_id`) REFERENCES `flavour_type` (`flavour_type_id`)
);

CREATE TABLE `wine`
(
  `wine_id`      BIGINT PRIMARY KEY AUTO_INCREMENT,
  `name`         VARCHAR(255)                                                       NOT NULL,
  `image_url`    VARCHAR(512)                                                       NOT NULL,
  `grape`        VARCHAR(255)                                                       NOT NULL,
  `winery`       VARCHAR(255)                                                       NOT NULL,
  `country`      VARCHAR(255)                                                       NOT NULL,
  `price`        DECIMAL(8, 2)                                                      NOT NULL,
  `rating`       DECIMAL(2, 1)                                                      NOT NULL,
  `vintage`      INT                                                                NOT NULL,
  `type`         ENUM ('RED', 'WHITE', 'ROSE', 'SPARKLING', 'DESSERT', 'FORTIFIED') NOT NULL,
  `acidity`      decimal(8, 7)                                                      NOT NULL,
  `intensity`    decimal(8, 7)                                                      NOT NULL,
  `sweetness`    decimal(8, 7)                                                      NOT NULL,
  `tannin`       decimal(8, 7)                                                      NOT NULL,
  `abv`          decimal(4, 1)                                                      NOT NULL,
  `view`         INT                                                                NOT NULL DEFAULT 0,
  `created_time` TIMESTAMP                                                          NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` TIMESTAMP                                                          NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE (`name`, `vintage`)
);

CREATE TABLE `wine_flavour`
(
  `wine_flavour_id`  BIGINT PRIMARY KEY AUTO_INCREMENT,
  `wine_id`          BIGINT    NOT NULL,
  `flavour_taste_id` BIGINT    NOT NULL,
  `created_time`     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time`     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE (`wine_id`, `flavour_taste_id`),
  FOREIGN KEY (`wine_id`) REFERENCES `wine` (`wine_id`),
  FOREIGN KEY (`flavour_taste_id`) REFERENCES `flavour_taste` (`flavour_taste_id`)
);

CREATE TABLE `color`
(
  `color_id`     BIGINT PRIMARY KEY AUTO_INCREMENT,
  `name`         VARCHAR(16) NOT NULL,
  `created_time` TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `tasting_note`
(
  `tasting_note_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `user_id`         BIGINT        NOT NULL,
  `wine_id`         BIGINT        NOT NULL,
  `color_id`        BIGINT        NOT NULL,
  `sweetness`       DECIMAL(2, 1) NOT NULL,
  `intensity`       DECIMAL(2, 1) NOT NULL,
  `acidity`         DECIMAL(2, 1) NOT NULL,
  `alcohol`         DECIMAL(2, 1) NOT NULL,
  `tannin`          DECIMAL(2, 1) NOT NULL,
  `opinion`         VARCHAR(255)  NOT NULL,
  `rating`          DECIMAL(2, 1) NOT NULL,
  `created_time`    TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time`    TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  FOREIGN KEY (`wine_id`) REFERENCES `wine` (`wine_id`),
  FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`)
);

CREATE TABLE `tasting_note_flavour`
(
  `tasting_note_flavour_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `tasting_note_id`         BIGINT    NOT NULL,
  `flavour_taste_id`        BIGINT    NOT NULL,
  `created_time`            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time`            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE (`tasting_note_id`, `flavour_taste_id`),
  FOREIGN KEY (`tasting_note_id`) REFERENCES `tasting_note` (`tasting_note_id`),
  FOREIGN KEY (`flavour_taste_id`) REFERENCES `flavour_taste` (`flavour_taste_id`)
);

CREATE TABLE `feed`
(
  `feed_id`      BIGINT PRIMARY KEY AUTO_INCREMENT,
  `user_id`      BIGINT       NOT NULL,
  `content`      VARCHAR(255) NOT NULL,
  `image_url`    VARCHAR(512) NOT NULL,
  `is_public`    BOOLEAN      NOT NULL,
  `created_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
);

CREATE TABLE `feed_wine`
(
  `feed_wine_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `feed_id`      BIGINT    NOT NULL,
  `wine_id`      BIGINT    NOT NULL,
  `created_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE (`feed_id`, `wine_id`),
  FOREIGN KEY (`feed_id`) REFERENCES `feed` (`feed_id`),
  FOREIGN KEY (`wine_id`) REFERENCES `wine` (`wine_id`)
);

CREATE TABLE `feed_like`
(
  `feed_like_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `feed_id`      BIGINT    NOT NULL,
  `user_id`      BIGINT    NOT NULL,
  `created_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE (`feed_id`, `user_id`),
  FOREIGN KEY (`feed_id`) REFERENCES `feed` (`feed_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
);

CREATE TABLE `search`
(
  `search_id`    BIGINT PRIMARY KEY AUTO_INCREMENT,
  `user_id`      BIGINT       NOT NULL,
  `content`      VARCHAR(255) NOT NULL,
  `created_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
);

CREATE TABLE `wine_view`
(
  `wine_view`    BIGINT PRIMARY KEY AUTO_INCREMENT,
  `user_id`      BIGINT    NOT NULL,
  `wine_id`      BIGINT    NOT NULL,
  `created_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE (`user_id`, `wine_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  FOREIGN KEY (`wine_id`) REFERENCES `wine` (`wine_id`)
);

CREATE TABLE `bookmark`
(
  `bookmark_id`  BIGINT PRIMARY KEY AUTO_INCREMENT,
  `user_id`      BIGINT    NOT NULL,
  `wine_id`      BIGINT    NOT NULL,
  `created_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE (`user_id`, `wine_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  FOREIGN KEY (`wine_id`) REFERENCES `wine` (`wine_id`)
);

CREATE TABLE `cellar_wine`
(
  `cellar_wine_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `user_id`        BIGINT    NOT NULL,
  `wine_id`        BIGINT    NOT NULL,
  `finished_date`  DATE      NULL,
  `created_time`   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time`   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  FOREIGN KEY (`wine_id`) REFERENCES `wine` (`wine_id`)
);

CREATE TABLE `user_chat_room`
(
  `user_chat_room_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `creator_id`        BIGINT    NOT NULL,
  `partner_id`        BIGINT    NOT NULL,
  `created_time`      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time`      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE (`creator_id`, `partner_id`),
  FOREIGN KEY (`creator_id`) REFERENCES `user` (`user_id`),
  FOREIGN KEY (`partner_id`) REFERENCES `user` (`user_id`)
);

CREATE TABLE `user_chat`
(
  `user_chat_id`      BIGINT PRIMARY KEY AUTO_INCREMENT,
  `user_chat_room_id` BIGINT       NOT NULL,
  `message`           VARCHAR(255) NOT NULL,
  `created_time`      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time`      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_chat_room_id`) REFERENCES `user_chat_room` (`user_chat_room_id`)
);

CREATE TABLE `wine_chat`
(
  `wine_chat_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `wine_id`      BIGINT       NOT NULL,
  `user_id`      BIGINT       NOT NULL,
  `message`      VARCHAR(255) NOT NULL,
  `created_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`wine_id`) REFERENCES `wine` (`wine_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
);

CREATE TABLE `ai_chat`
(
  `ai_chat_id`   BIGINT PRIMARY KEY AUTO_INCREMENT,
  `user_id`      BIGINT       NOT NULL,
  `message`      VARCHAR(255) NOT NULL,
  `is_bot`       BOOLEAN      NOT NULL,
  `created_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
);
