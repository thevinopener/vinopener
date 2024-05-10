package com.ssafy.vinopener.domain.tastingnote.data.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTastingNoteFlavourEntity is a Querydsl query type for TastingNoteFlavourEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QTastingNoteFlavourEntity extends EntityPathBase<TastingNoteFlavourEntity> {

    private static final long serialVersionUID = 522444836L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTastingNoteFlavourEntity tastingNoteFlavourEntity = new QTastingNoteFlavourEntity("tastingNoteFlavourEntity");

    public final com.ssafy.vinopener.global.common.QBaseTimeEntity _super = new com.ssafy.vinopener.global.common.QBaseTimeEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdTime = _super.createdTime;

    public final com.ssafy.vinopener.domain.wine.data.entity.QFlavourTasteEntity flavourTaste;

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final QTastingNoteEntity tastingNote;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updatedTime = _super.updatedTime;

    public QTastingNoteFlavourEntity(String variable) {
        this(TastingNoteFlavourEntity.class, forVariable(variable), INITS);
    }

    public QTastingNoteFlavourEntity(Path<? extends TastingNoteFlavourEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTastingNoteFlavourEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTastingNoteFlavourEntity(PathMetadata metadata, PathInits inits) {
        this(TastingNoteFlavourEntity.class, metadata, inits);
    }

    public QTastingNoteFlavourEntity(Class<? extends TastingNoteFlavourEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.flavourTaste = inits.isInitialized("flavourTaste") ? new com.ssafy.vinopener.domain.wine.data.entity.QFlavourTasteEntity(forProperty("flavourTaste"), inits.get("flavourTaste")) : null;
        this.tastingNote = inits.isInitialized("tastingNote") ? new QTastingNoteEntity(forProperty("tastingNote"), inits.get("tastingNote")) : null;
    }

}

