package com.ssafy.vinopener.domain.cellar.repository;

import com.querydsl.core.Tuple;
import java.util.List;

public interface CellarRepositoryQuery {

    List<Tuple> findAllByCellarCount();

}