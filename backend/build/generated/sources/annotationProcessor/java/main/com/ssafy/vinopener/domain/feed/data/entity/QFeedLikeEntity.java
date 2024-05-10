package com.ssafy.vinopener.domain.feed.data.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QFeedLikeEntity is a Querydsl query type for FeedLikeEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QFeedLikeEntity extends EntityPathBase<FeedLikeEntity> {

    private static final long serialVersionUID = 653822536L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QFeedLikeEntity feedLikeEntity = new QFeedLikeEntity("feedLikeEntity");

    public final com.ssafy.vinopener.global.common.QBaseTimeEntity _super = new com.ssafy.vinopener.global.common.QBaseTimeEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdTime = _super.createdTime;

    public final QFeedEntity feed;

    public final NumberPath<Long> id = createNumber("id", Long.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updatedTime = _super.updatedTime;

    public final com.ssafy.vinopener.domain.user.data.entity.QUserEntity user;

    public QFeedLikeEntity(String variable) {
        this(FeedLikeEntity.class, forVariable(variable), INITS);
    }

    public QFeedLikeEntity(Path<? extends FeedLikeEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QFeedLikeEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QFeedLikeEntity(PathMetadata metadata, PathInits inits) {
        this(FeedLikeEntity.class, metadata, inits);
    }

    public QFeedLikeEntity(Class<? extends FeedLikeEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.feed = inits.isInitialized("feed") ? new QFeedEntity(forProperty("feed"), inits.get("feed")) : null;
        this.user = inits.isInitialized("user") ? new com.ssafy.vinopener.domain.user.data.entity.QUserEntity(forProperty("user")) : null;
    }

}

