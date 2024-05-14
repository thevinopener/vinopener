package coffee.ssafy.vinopenerbatch.domain.user.repository;

import coffee.ssafy.vinopenerbatch.domain.user.entity.UserEntity;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserEntity, Long> {

    Optional<UserEntity> findByEmail(String email);

}
