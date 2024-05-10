package com.ssafy.vinopener.domain.tastingnote.data.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QColorEntity is a Querydsl query type for ColorEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QColorEntity extends EntityPathBase<ColorEntity> {

    private static final long serialVersionUID = 2070005360L;

    public static final QColorEntity colorEntity = new QColorEntity("colorEntity");

    public final com.ssafy.vinopener.global.common.QBaseTimeEntity _super = new com.ssafy.vinopener.global.common.QBaseTimeEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdTime = _super.createdTime;

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath name = createString("name");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updatedTime = _super.updatedTime;

    public QColorEntity(String variable) {
        super(ColorEntity.class, forVariable(variable));
    }

    public QColorEntity(Path<? extends ColorEntity> path) {
        super(path.getType(), path.getMetadata());
    }

    public QColorEntity(PathMetadata metadata) {
        super(ColorEntity.class, metadata);
    }

}

