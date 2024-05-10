package com.ssafy.vinopener.domain.aichat.data.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QAiChatEntity is a Querydsl query type for AiChatEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QAiChatEntity extends EntityPathBase<AiChatEntity> {

    private static final long serialVersionUID = 161132913L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QAiChatEntity aiChatEntity = new QAiChatEntity("aiChatEntity");

    public final com.ssafy.vinopener.global.common.QBaseTimeEntity _super = new com.ssafy.vinopener.global.common.QBaseTimeEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdTime = _super.createdTime;

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final BooleanPath isBot = createBoolean("isBot");

    public final StringPath message = createString("message");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updatedTime = _super.updatedTime;

    public final com.ssafy.vinopener.domain.user.data.entity.QUserEntity user;

    public QAiChatEntity(String variable) {
        this(AiChatEntity.class, forVariable(variable), INITS);
    }

    public QAiChatEntity(Path<? extends AiChatEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QAiChatEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QAiChatEntity(PathMetadata metadata, PathInits inits) {
        this(AiChatEntity.class, metadata, inits);
    }

    public QAiChatEntity(Class<? extends AiChatEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.user = inits.isInitialized("user") ? new com.ssafy.vinopener.domain.user.data.entity.QUserEntity(forProperty("user")) : null;
    }

}

