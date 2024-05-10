package com.ssafy.vinopener.domain.feed.data.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QFeedWineEntity is a Querydsl query type for FeedWineEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QFeedWineEntity extends EntityPathBase<FeedWineEntity> {

    private static final long serialVersionUID = -574362310L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QFeedWineEntity feedWineEntity = new QFeedWineEntity("feedWineEntity");

    public final com.ssafy.vinopener.global.common.QBaseTimeEntity _super = new com.ssafy.vinopener.global.common.QBaseTimeEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdTime = _super.createdTime;

    public final QFeedEntity feed;

    public final NumberPath<Long> id = createNumber("id", Long.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updatedTime = _super.updatedTime;

    public final com.ssafy.vinopener.domain.wine.data.entity.QWineEntity wine;

    public QFeedWineEntity(String variable) {
        this(FeedWineEntity.class, forVariable(variable), INITS);
    }

    public QFeedWineEntity(Path<? extends FeedWineEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QFeedWineEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QFeedWineEntity(PathMetadata metadata, PathInits inits) {
        this(FeedWineEntity.class, metadata, inits);
    }

    public QFeedWineEntity(Class<? extends FeedWineEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.feed = inits.isInitialized("feed") ? new QFeedEntity(forProperty("feed"), inits.get("feed")) : null;
        this.wine = inits.isInitialized("wine") ? new com.ssafy.vinopener.domain.wine.data.entity.QWineEntity(forProperty("wine")) : null;
    }

}

