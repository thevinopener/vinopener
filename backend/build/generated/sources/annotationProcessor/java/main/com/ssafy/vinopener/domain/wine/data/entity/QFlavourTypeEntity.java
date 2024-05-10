package com.ssafy.vinopener.domain.wine.data.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QFlavourTypeEntity is a Querydsl query type for FlavourTypeEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QFlavourTypeEntity extends EntityPathBase<FlavourTypeEntity> {

    private static final long serialVersionUID = 120013833L;

    public static final QFlavourTypeEntity flavourTypeEntity = new QFlavourTypeEntity("flavourTypeEntity");

    public final com.ssafy.vinopener.global.common.QBaseTimeEntity _super = new com.ssafy.vinopener.global.common.QBaseTimeEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdTime = _super.createdTime;

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath name = createString("name");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updatedTime = _super.updatedTime;

    public QFlavourTypeEntity(String variable) {
        super(FlavourTypeEntity.class, forVariable(variable));
    }

    public QFlavourTypeEntity(Path<? extends FlavourTypeEntity> path) {
        super(path.getType(), path.getMetadata());
    }

    public QFlavourTypeEntity(PathMetadata metadata) {
        super(FlavourTypeEntity.class, metadata);
    }

}

