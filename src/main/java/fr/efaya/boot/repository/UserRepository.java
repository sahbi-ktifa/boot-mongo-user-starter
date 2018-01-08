package fr.efaya.boot.repository;

import fr.efaya.boot.domain.User;
import org.springframework.data.repository.CrudRepository;

/**
 * @author Sahbi Ktifa
 * created on 19/12/2017
 */
public interface UserRepository extends CrudRepository<User, String> {

}
