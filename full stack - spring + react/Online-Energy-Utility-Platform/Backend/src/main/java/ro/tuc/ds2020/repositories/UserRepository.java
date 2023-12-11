package ro.tuc.ds2020.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ro.tuc.ds2020.entities.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User,Long> {
    List<User> findUserByUsername(String username);
}
