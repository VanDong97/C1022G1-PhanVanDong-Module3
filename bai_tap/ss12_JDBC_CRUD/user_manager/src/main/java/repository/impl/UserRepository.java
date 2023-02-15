package repository.impl;

import model.UserManager;
import repository.IUserRepository;
import sun.awt.windows.WPrinterJob;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {

    @Override
    public void add(UserManager userManager) {
//        PreparedStatement preparedStatement;
//        try{
//            preparedStatement = BaseRepository.getConnection().
//                    prepareStatement("insert into user(name ,email,country) value (?,?,?)");
//            preparedStatement.setString(1,userManager.getName());
//            preparedStatement.setString(2,userManager.getEmail());
//            preparedStatement.setString(3,userManager.getCountry());
//        } catch (SQLException exception) {
//            exception.printStackTrace();
//        }

        CallableStatement callableStatement;
        try {
            callableStatement = BaseRepository.getConnection().
                    prepareCall("call insert_user(?,?,?)");
            callableStatement.setString(1, userManager.getName());
            callableStatement.setString(2, userManager.getEmail());
            callableStatement.setString(3, userManager.getCountry());
            callableStatement.executeUpdate();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }

    @Override
    public UserManager findById(int id) {
//        PreparedStatement preparedStatement = null;
//        try{
//            preparedStatement = BaseRepository.getConnection().
//                    prepareStatement("select id,name,email,country from user where id =? order by name");
//            preparedStatement.setInt(1,id);
//            UserManager userManager;
//            ResultSet resultSet = preparedStatement.executeQuery();
//            if (resultSet.next()){
//                userManager = new UserManager();
//                userManager.setId(resultSet.getInt("id"));
//                userManager.setName(resultSet.getString("name"));
//                userManager.setEmail(resultSet.getString("email"));
//                userManager.setCountry(resultSet.getString("country"));
//            }
//        } catch (SQLException exception) {
//            exception.printStackTrace();
//        }
//        return null;

        CallableStatement callableStatement = null;
        try {
            callableStatement = BaseRepository.getConnection().
                    prepareCall("call find_by_id(?)");
            callableStatement.setInt(1, id);
            UserManager userManager;
            ResultSet resultSet = callableStatement.executeQuery();
            if (resultSet.next()) {
                userManager = new UserManager();
                userManager.setId(resultSet.getInt("id"));
                userManager.setName(resultSet.getString("name"));
                userManager.setEmail(resultSet.getString("email"));
                userManager.setCountry(resultSet.getString("country"));
                return userManager;
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return null;
    }

    @Override
    public List<UserManager> listAll(String country) {
//        List<UserManager> userManagerList = new ArrayList<>();
//        try{
//            PreparedStatement preparedStatement = BaseRepository.getConnection().
//                    prepareStatement("select id,name,email,country from user where country like ('%', ?, '%') order by name");
//            preparedStatement.setString(1,country);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            UserManager userManager;
//            while (resultSet.next()){
//                userManager = new UserManager();
//                userManager.setId(resultSet.getInt("id"));
//                userManager.setName(resultSet.getString("name"));
//                userManager.setEmail(resultSet.getString("email"));
//                userManager.setCountry(resultSet.getString("country"));
//            }
//        } catch (SQLException exception) {
//            exception.printStackTrace();
//        }
//        return userManagerList;

        List<UserManager> userManagerList = new ArrayList<>();
        try {
            CallableStatement callableStatement = BaseRepository.getConnection().
                    prepareCall("call list_user(?)");
            callableStatement.setString(1, country);
            ResultSet resultSet = callableStatement.executeQuery();
            UserManager userManager;
            while (resultSet.next()) {
                userManager = new UserManager();
                userManager.setId(resultSet.getInt("id"));
                userManager.setName(resultSet.getString("name"));
                userManager.setEmail(resultSet.getString("email"));
                userManager.setCountry(resultSet.getString("country"));
                userManagerList.add(userManager);
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return userManagerList;
    }

    @Override
    public void delete(UserManager userManager) {
//        try{
//            PreparedStatement preparedStatement = BaseRepository.getConnection().
//                    prepareStatement("delete from user where id =?");
//            preparedStatement.setInt(1,userManager.getId());
//            preparedStatement.executeUpdate();
//        } catch (SQLException exception) {
//            exception.printStackTrace();
//        }

        try {
            CallableStatement callableStatement = BaseRepository.getConnection().
                    prepareCall("call delete_user(?)");
            callableStatement.setInt(1, userManager.getId());
            callableStatement.executeUpdate();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }

    @Override
    public void update(UserManager userManager) {
//        PreparedStatement preparedStatement = null;
//        try {
//            preparedStatement = BaseRepository.getConnection().
//                prepareStatement("update  user\n" + "set name = ?, email = ?,country = ? \n" + "where  id = ?");
//        preparedStatement.setString(1,userManager.getName());
//        preparedStatement.setString(2,userManager.getEmail());
//        preparedStatement.setString(3,userManager.getCountry());
//        preparedStatement.setInt(4,userManager.getId());
//            preparedStatement.executeUpdate();
//        } catch (SQLException exception) {
//            exception.printStackTrace();
//        }

        try {
            CallableStatement callableStatement = BaseRepository.getConnection().
                    prepareCall("call update _user (?,?,?,?)");
            callableStatement.setString(1, userManager.getName());
            callableStatement.setString(2, userManager.getEmail());
            callableStatement.setString(3, userManager.getCountry());
            callableStatement.setInt(4, userManager.getId());
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }
}
