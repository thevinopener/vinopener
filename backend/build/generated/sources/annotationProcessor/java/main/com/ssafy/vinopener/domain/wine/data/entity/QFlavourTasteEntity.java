package com.ssafy.vinopener.domain.wine.data.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QFlavourTasteEntity is a Querydsl query type for FlavourTasteEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QFlavourTasteEntity extends EntityPathBase<FlavourTasteEntity> {

    private static final long serialVersionUID = 543068302L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QFlavourTasteEntity flavourTasteEntity = new QFlavourTasteEntity("flavourTasteEntity");

    public final com.ssafy.vinopener.global.common.QBaseTimeEntity _super = new com.ssafy.vinopener.global.common.QBaseTimeEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdTime = _super.createdTime;

    public final QFlavourTypeEntity flavourType;

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath name = createString("name");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updatedTime = _super.updatedTime;

    public QFlavourTasteEntity(String variable) {
        this(FlavourTasteEntity.class, forVariable(variable), INITS);
    }

    public QFlavourTasteEntity(Path<? extends FlavourTasteEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QFlavourTasteEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QFlavourTasteEntity(PathMetadata metadata, PathInits inits) {
        this(FlavourTasteEntity.class, metadata, inits);
    }

    public QFlavourTasteEntity(Class<? extends FlavourTasteEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.flavourType = inits.isInitialized("flavourType") ? new QFlavourTypeEntity(forProperty("flavourType")) : null;
    }

}

