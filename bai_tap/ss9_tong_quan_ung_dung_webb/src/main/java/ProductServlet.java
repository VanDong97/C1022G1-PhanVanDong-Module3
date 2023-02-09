import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productDescription = request.getParameter("product-description");
        double listPrice = Double.parseDouble(request.getParameter("list-price"));
        double discountPercent = Double.parseDouble(request.getParameter("discount-percent"));

        double sum = listPrice * discountPercent * 0.01;

        request.setAttribute("sum", "Discount Price :" + sum);
        request.setAttribute("productDescription", "Product : " + productDescription);
        request.setAttribute("discountPercent", "Discount Percent :" + discountPercent);
        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }
}
