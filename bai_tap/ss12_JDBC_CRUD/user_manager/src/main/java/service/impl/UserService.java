package service.impl;

import model.UserManager;
import service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {

    @Override
    public void insertUser(UserManager userManager) throws SQLException {

    }

    @Override
    public UserManager selectUser(int id) {
        return null;
    }

    @Override
    public List<UserManager> selectAllUsers() {
        return null;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateUser(UserManager userManager) throws SQLException {
        return false;
    }
}
