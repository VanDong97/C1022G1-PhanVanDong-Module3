package service;

import model.UserManager;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {

    void add(UserManager userManager);

    UserManager finById(int id);

    List<UserManager> listAll (String country);

    void delete(UserManager userManager);

    void update(UserManager userManager);
}
