package com.ssafy.vinopener.domain.wine.data.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QWineEntity is a Querydsl query type for WineEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QWineEntity extends EntityPathBase<WineEntity> {

    private static final long serialVersionUID = 1244077617L;

    public static final QWineEntity wineEntity = new QWineEntity("wineEntity");

    public final com.ssafy.vinopener.global.common.QBaseTimeEntity _super = new com.ssafy.vinopener.global.common.QBaseTimeEntity(this);

    public final NumberPath<java.math.BigDecimal> abv = createNumber("abv", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> acidity = createNumber("acidity", java.math.BigDecimal.class);

    public final StringPath country = createString("country");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdTime = _super.createdTime;

    public final StringPath grape = createString("grape");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath imageUrl = createString("imageUrl");

    public final NumberPath<java.math.BigDecimal> intensity = createNumber("intensity", java.math.BigDecimal.class);

    public final StringPath name = createString("name");

    public final NumberPath<java.math.BigDecimal> price = createNumber("price", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> rating = createNumber("rating", java.math.BigDecimal.class);

    public final StringPath seoName = createString("seoName");

    public final NumberPath<java.math.BigDecimal> sweetness = createNumber("sweetness", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> tannin = createNumber("tannin", java.math.BigDecimal.class);

    public final EnumPath<com.ssafy.vinopener.domain.wine.data.entity.enums.WineType> type = createEnum("type", com.ssafy.vinopener.domain.wine.data.entity.enums.WineType.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updatedTime = _super.updatedTime;

    public final NumberPath<Integer> view = createNumber("view", Integer.class);

    public final NumberPath<Integer> vintage = createNumber("vintage", Integer.class);

    public final StringPath winery = createString("winery");

    public QWineEntity(String variable) {
        super(WineEntity.class, forVariable(variable));
    }

    public QWineEntity(Path<? extends WineEntity> path) {
        super(path.getType(), path.getMetadata());
    }

    public QWineEntity(PathMetadata metadata) {
        super(WineEntity.class, metadata);
    }

}

