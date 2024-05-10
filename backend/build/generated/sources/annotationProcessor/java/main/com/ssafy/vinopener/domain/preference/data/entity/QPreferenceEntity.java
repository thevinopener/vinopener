package com.ssafy.vinopener.domain.preference.data.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QPreferenceEntity is a Querydsl query type for PreferenceEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QPreferenceEntity extends EntityPathBase<PreferenceEntity> {

    private static final long serialVersionUID = -1240253583L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QPreferenceEntity preferenceEntity = new QPreferenceEntity("preferenceEntity");

    public final com.ssafy.vinopener.global.common.QBaseTimeEntity _super = new com.ssafy.vinopener.global.common.QBaseTimeEntity(this);

    public final NumberPath<Integer> acidity = createNumber("acidity", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdTime = _super.createdTime;

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final BooleanPath isDessert = createBoolean("isDessert");

    public final BooleanPath isFortified = createBoolean("isFortified");

    public final BooleanPath isRed = createBoolean("isRed");

    public final BooleanPath isRose = createBoolean("isRose");

    public final BooleanPath isSparkling = createBoolean("isSparkling");

    public final BooleanPath isWhite = createBoolean("isWhite");

    public final NumberPath<Integer> maxAbv = createNumber("maxAbv", Integer.class);

    public final NumberPath<Integer> minAbv = createNumber("minAbv", Integer.class);

    public final NumberPath<Integer> sweetness = createNumber("sweetness", Integer.class);

    public final NumberPath<Integer> tannin = createNumber("tannin", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updatedTime = _super.updatedTime;

    public final com.ssafy.vinopener.domain.user.data.entity.QUserEntity user;

    public QPreferenceEntity(String variable) {
        this(PreferenceEntity.class, forVariable(variable), INITS);
    }

    public QPreferenceEntity(Path<? extends PreferenceEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QPreferenceEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QPreferenceEntity(PathMetadata metadata, PathInits inits) {
        this(PreferenceEntity.class, metadata, inits);
    }

    public QPreferenceEntity(Class<? extends PreferenceEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.user = inits.isInitialized("user") ? new com.ssafy.vinopener.domain.user.data.entity.QUserEntity(forProperty("user")) : null;
    }

}

