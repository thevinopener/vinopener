package com.ssafy.vinopener.domain.feed.data.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QFeedEntity is a Querydsl query type for FeedEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QFeedEntity extends EntityPathBase<FeedEntity> {

    private static final long serialVersionUID = 1827168977L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QFeedEntity feedEntity = new QFeedEntity("feedEntity");

    public final com.ssafy.vinopener.global.common.QBaseTimeEntity _super = new com.ssafy.vinopener.global.common.QBaseTimeEntity(this);

    public final StringPath content = createString("content");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdTime = _super.createdTime;

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath imageUrl = createString("imageUrl");

    public final BooleanPath is_public = createBoolean("is_public");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updatedTime = _super.updatedTime;

    public final com.ssafy.vinopener.domain.user.data.entity.QUserEntity user;

    public QFeedEntity(String variable) {
        this(FeedEntity.class, forVariable(variable), INITS);
    }

    public QFeedEntity(Path<? extends FeedEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QFeedEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QFeedEntity(PathMetadata metadata, PathInits inits) {
        this(FeedEntity.class, metadata, inits);
    }

    public QFeedEntity(Class<? extends FeedEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.user = inits.isInitialized("user") ? new com.ssafy.vinopener.domain.user.data.entity.QUserEntity(forProperty("user")) : null;
    }

}

