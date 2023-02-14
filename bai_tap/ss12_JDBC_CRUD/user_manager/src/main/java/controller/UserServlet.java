package controller;

import model.UserManager;
import repository.impl.UserRepository;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUD = 1L;
    private UserRepository UserRepository;

    public void init() {
        UserRepository = new UserRepository();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showNewForms(request, response);
                    break;
                case "edit":
                    showEditForms(request, response);
                    break;
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }

    private void showNewForms(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        UserManager userManager = new UserManager(name, email, country);
        UserRepository.insertUser(userManager);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showEditForms(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        UserManager userManager = new UserManager(id, name, email, country);
        UserRepository.updateUser(userManager);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        UserManager manager = UserRepository.selectUser(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<UserManager> userManagerList = UserRepository.selectAllUsers();
        request.setAttribute("userManagerList", userManagerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/list.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        UserRepository.deleteUser(id);

        List<UserManager> userManagerList = UserRepository.selectAllUsers();
        request.setAttribute("userManagerList", userManagerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/delete.jsp");
        requestDispatcher.forward(request, response);
    }
}
