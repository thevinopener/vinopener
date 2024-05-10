package com.ssafy.vinopener.domain.wine.data.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QWineChatEntity is a Querydsl query type for WineChatEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QWineChatEntity extends EntityPathBase<WineChatEntity> {

    private static final long serialVersionUID = 1703077033L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QWineChatEntity wineChatEntity = new QWineChatEntity("wineChatEntity");

    public final com.ssafy.vinopener.global.common.QBaseTimeEntity _super = new com.ssafy.vinopener.global.common.QBaseTimeEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdTime = _super.createdTime;

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath message = createString("message");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updatedTime = _super.updatedTime;

    public final com.ssafy.vinopener.domain.user.data.entity.QUserEntity user;

    public final QWineEntity wine;

    public QWineChatEntity(String variable) {
        this(WineChatEntity.class, forVariable(variable), INITS);
    }

    public QWineChatEntity(Path<? extends WineChatEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QWineChatEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QWineChatEntity(PathMetadata metadata, PathInits inits) {
        this(WineChatEntity.class, metadata, inits);
    }

    public QWineChatEntity(Class<? extends WineChatEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.user = inits.isInitialized("user") ? new com.ssafy.vinopener.domain.user.data.entity.QUserEntity(forProperty("user")) : null;
        this.wine = inits.isInitialized("wine") ? new QWineEntity(forProperty("wine")) : null;
    }

}

