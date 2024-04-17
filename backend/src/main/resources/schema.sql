DROP TABLE IF EXISTS
    `Wine`;

CREATE TABLE `Wine`
(
    `wine_id`      bigint PRIMARY KEY AUTO_INCREMENT,
    `name_ko`      varchar(255) NOT NULL,
    `name_en`      varchar(255) NOT NULL,
    `grape`        varchar(255) NOT NULL,
    `country`      varchar(255) NOT NULL,
    `region`       varchar(255) NOT NULL,
    `price_min`    int          NOT NULL,
    `price_max`    int          NOT NULL,
    `price_avg`    int          NOT NULL,
    `score`        int          NOT NULL,
    `winery`       varchar(255) NOT NULL,
    `year`         int          NOT NULL,
    `type`         enum ('RED', 'WHITE', 'ROSE', 'SPARKLING', 'DESSERT', 'FORTIFIED')
                                NOT NULL,
    `view`         int          NOT NULL DEFAULT 0,
    `created_time` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
