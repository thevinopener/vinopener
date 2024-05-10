package com.ssafy.vinopener.domain.bookmark.data.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QBookmarkEntity is a Querydsl query type for BookmarkEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QBookmarkEntity extends EntityPathBase<BookmarkEntity> {

    private static final long serialVersionUID = -913259183L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QBookmarkEntity bookmarkEntity = new QBookmarkEntity("bookmarkEntity");

    public final com.ssafy.vinopener.global.common.QBaseTimeEntity _super = new com.ssafy.vinopener.global.common.QBaseTimeEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdTime = _super.createdTime;

    public final NumberPath<Long> id = createNumber("id", Long.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updatedTime = _super.updatedTime;

    public final com.ssafy.vinopener.domain.user.data.entity.QUserEntity user;

    public final com.ssafy.vinopener.domain.wine.data.entity.QWineEntity wine;

    public QBookmarkEntity(String variable) {
        this(BookmarkEntity.class, forVariable(variable), INITS);
    }

    public QBookmarkEntity(Path<? extends BookmarkEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QBookmarkEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QBookmarkEntity(PathMetadata metadata, PathInits inits) {
        this(BookmarkEntity.class, metadata, inits);
    }

    public QBookmarkEntity(Class<? extends BookmarkEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.user = inits.isInitialized("user") ? new com.ssafy.vinopener.domain.user.data.entity.QUserEntity(forProperty("user")) : null;
        this.wine = inits.isInitialized("wine") ? new com.ssafy.vinopener.domain.wine.data.entity.QWineEntity(forProperty("wine")) : null;
    }

}

