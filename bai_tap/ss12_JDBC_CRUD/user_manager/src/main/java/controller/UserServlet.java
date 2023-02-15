package controller;

import model.UserManager;
import repository.impl.UserRepository;
import service.IUserService;
import service.impl.UserService;

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
    IUserService iUserService = new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "add":
                formAdd(request,response);
                break;
            case "update":
                formUpdate(request,response);
                break;
            case "delete":
                formDelete(request,response);
                break;
            default:
                break;
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "add":
                showFormAdd(request,response);
                break;
            case "update":
                showFormUpdate(request,response);
                break;
            default:
                showList(request,response);
                break;
        }
    }

    private void formAdd(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        UserManager userManager = new UserManager(name,email,country);
        iUserService.add(userManager);
        try {
            response.sendRedirect("/users");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void formUpdate(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        int id = Integer.parseInt(request.getParameter("id"));

        UserManager userManager = iUserService.finById(id);
        userManager.setName(name);
        userManager.setEmail(email);
        userManager.setCountry(country);
        iUserService.update(userManager);
        try {
            response.sendRedirect("/users");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void formDelete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteID"));
        UserManager userManager = iUserService.finById(id);
        iUserService.delete(userManager);
        try {
            response.sendRedirect("/users");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        UserManager userManager = new UserManager(name,email,country);
        iUserService.add(userManager);
        try {
            response.sendRedirect("/users");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        UserManager userManager = iUserService.finById(id);
        request.setAttribute("userManager",userManager);
        try{
            request.getRequestDispatcher("/view/update.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        request.setAttribute("country",country);
        List<UserManager> userManagerList = iUserService.listAll(country);
        request.setAttribute("userManagerList",userManagerList);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
