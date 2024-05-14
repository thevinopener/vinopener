package coffee.ssafy.vinopenerbatch.domain.cellar.repository;

import com.querydsl.core.Tuple;

import java.util.List;

public interface CellarRepositoryQuery {

    List<Tuple> findAllByCellarCount();

}
