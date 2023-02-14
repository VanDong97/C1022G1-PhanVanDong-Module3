package repository.impl;

import model.UserManager;
import repository.IUserRepository;
import sun.awt.windows.WPrinterJob;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {


    private static final String INSERT_USER_SQL = "INSERT INTO users(name,email,country) VALUES(?,?,?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id = ?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";

    public UserRepository() {
    }

    @Override
    public void insertUser(UserManager userManager) throws SQLException {
        System.out.println(INSERT_USER_SQL);
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL);
            preparedStatement.setString(1, userManager.getName());
            preparedStatement.setString(2, userManager.getEmail());
            preparedStatement.setString(3, userManager.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


    @Override
    public UserManager selectUser(int id) {
        UserManager userManager = null;
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userManager = new UserManager(id, name, email, country);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userManager;
    }


    @Override
    public List<UserManager> selectAllUsers() {
        List<UserManager> userManagers = new ArrayList<>();
        try(Connection connection = BaseRepository.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userManagers;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDelete;
        try(Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS_SQL)){
            preparedStatement.setInt(1,id);
            rowDelete = preparedStatement.executeUpdate() > 0;
        }
        return rowDelete;
    }

    @Override
    public boolean updateUser(UserManager userManager) throws SQLException {
        boolean rowUpdate;
        try(Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL)){
            preparedStatement.setString(1,userManager.getName());
            preparedStatement.setString(2,userManager.getEmail());
            preparedStatement.setString(3,userManager.getCountry());
            preparedStatement.setInt(4,userManager.getId());

            rowUpdate = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdate;
    }

    private void printSQLException(SQLException exception){
        for (Throwable throwable:exception){
            if (throwable instanceof SQLException){
                throwable.printStackTrace(System.err);
                System.err.println("SQLState : " + ((SQLException)exception).getSQLState());
                System.err.println("ErrorCode : " + ((SQLException)exception).getErrorCode());
                System.err.println("Messege : " + ((SQLException)exception).getMessage());
                Throwable throwable1 = exception.getCause();
                while (throwable1 != null){
                    System.out.println("Cause :" + throwable1);
                    throwable1 = throwable1.getCause();
                }
            }
        }
    }
}
