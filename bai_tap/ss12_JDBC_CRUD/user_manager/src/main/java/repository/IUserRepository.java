package repository;

import model.UserManager;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    void add(UserManager userManager);

    UserManager findById(int id);

    List<UserManager> listAll (String country);

    void delete(UserManager userManager);

    void update(UserManager userManager);

}
