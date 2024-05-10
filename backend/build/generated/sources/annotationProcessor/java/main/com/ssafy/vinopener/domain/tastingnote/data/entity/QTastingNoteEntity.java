package com.ssafy.vinopener.domain.tastingnote.data.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTastingNoteEntity is a Querydsl query type for TastingNoteEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QTastingNoteEntity extends EntityPathBase<TastingNoteEntity> {

    private static final long serialVersionUID = 539165427L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTastingNoteEntity tastingNoteEntity = new QTastingNoteEntity("tastingNoteEntity");

    public final com.ssafy.vinopener.global.common.QBaseTimeEntity _super = new com.ssafy.vinopener.global.common.QBaseTimeEntity(this);

    public final NumberPath<java.math.BigDecimal> acidity = createNumber("acidity", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> alcohol = createNumber("alcohol", java.math.BigDecimal.class);

    public final QColorEntity color;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdTime = _super.createdTime;

    public final ListPath<TastingNoteFlavourEntity, QTastingNoteFlavourEntity> flavours = this.<TastingNoteFlavourEntity, QTastingNoteFlavourEntity>createList("flavours", TastingNoteFlavourEntity.class, QTastingNoteFlavourEntity.class, PathInits.DIRECT2);

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final NumberPath<java.math.BigDecimal> intensity = createNumber("intensity", java.math.BigDecimal.class);

    public final StringPath opinion = createString("opinion");

    public final NumberPath<java.math.BigDecimal> rating = createNumber("rating", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> sweetness = createNumber("sweetness", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> tannin = createNumber("tannin", java.math.BigDecimal.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updatedTime = _super.updatedTime;

    public final com.ssafy.vinopener.domain.user.data.entity.QUserEntity user;

    public final com.ssafy.vinopener.domain.wine.data.entity.QWineEntity wine;

    public QTastingNoteEntity(String variable) {
        this(TastingNoteEntity.class, forVariable(variable), INITS);
    }

    public QTastingNoteEntity(Path<? extends TastingNoteEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTastingNoteEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTastingNoteEntity(PathMetadata metadata, PathInits inits) {
        this(TastingNoteEntity.class, metadata, inits);
    }

    public QTastingNoteEntity(Class<? extends TastingNoteEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.color = inits.isInitialized("color") ? new QColorEntity(forProperty("color")) : null;
        this.user = inits.isInitialized("user") ? new com.ssafy.vinopener.domain.user.data.entity.QUserEntity(forProperty("user")) : null;
        this.wine = inits.isInitialized("wine") ? new com.ssafy.vinopener.domain.wine.data.entity.QWineEntity(forProperty("wine")) : null;
    }

}

