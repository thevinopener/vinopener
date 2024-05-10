package com.ssafy.vinopener.domain.cellar.data.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QCellarEntity is a Querydsl query type for CellarEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QCellarEntity extends EntityPathBase<CellarEntity> {

    private static final long serialVersionUID = 653457009L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QCellarEntity cellarEntity = new QCellarEntity("cellarEntity");

    public final com.ssafy.vinopener.global.common.QBaseTimeEntity _super = new com.ssafy.vinopener.global.common.QBaseTimeEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdTime = _super.createdTime;

    public final DatePath<java.time.LocalDate> finishedDate = createDate("finishedDate", java.time.LocalDate.class);

    public final NumberPath<Long> id = createNumber("id", Long.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updatedTime = _super.updatedTime;

    public final com.ssafy.vinopener.domain.user.data.entity.QUserEntity user;

    public final com.ssafy.vinopener.domain.wine.data.entity.QWineEntity wine;

    public QCellarEntity(String variable) {
        this(CellarEntity.class, forVariable(variable), INITS);
    }

    public QCellarEntity(Path<? extends CellarEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QCellarEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QCellarEntity(PathMetadata metadata, PathInits inits) {
        this(CellarEntity.class, metadata, inits);
    }

    public QCellarEntity(Class<? extends CellarEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.user = inits.isInitialized("user") ? new com.ssafy.vinopener.domain.user.data.entity.QUserEntity(forProperty("user")) : null;
        this.wine = inits.isInitialized("wine") ? new com.ssafy.vinopener.domain.wine.data.entity.QWineEntity(forProperty("wine")) : null;
    }

}

