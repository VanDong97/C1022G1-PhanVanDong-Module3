package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService iProductService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionUser = request.getParameter("actionUser");
        if (actionUser == null){
            actionUser = "";
        }
        switch (actionUser){
            case "create":
                String name = request.getParameter("name");
                String price = request.getParameter("price");
                String status = request.getParameter("status");
                String producer = request.getParameter("producer");
                Product product = new Product(name,price,status,producer);
                iProductService.save(product);
                response.sendRedirect("/product");
                break;
            case "edit":
                break;
            case "delete":
                break;
            default:
                request.setAttribute("productList",iProductService.findAll());
                request.getRequestDispatcher("/view/list.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionUser = request.getParameter("actionUser");
        if (actionUser == null){
            actionUser = "";
        }
        switch (actionUser){
            case "create":
                showProductForm (request,response);
                break;
            case "edit":
                break;
            case "delete":
                break;
            case "view":
                break;
            default:
                productList(request,response);
                request.setAttribute("productList",iProductService.findAll());
                request.getRequestDispatcher("/view/list.jsp").forward(request,response);
                break;
        }
    }

    private void showProductForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/create.jsp").forward(request,response);
    }

    private void productList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = this.iProductService.findAll();
        request.setAttribute("productList",productList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        try{
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
