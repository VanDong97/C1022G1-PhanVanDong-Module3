package service;

import model.UserManager;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    public void insertUser(UserManager userManager) throws SQLException;

    public UserManager selectUser(int id);

    public List<UserManager> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser (UserManager userManager) throws SQLException ;
}
