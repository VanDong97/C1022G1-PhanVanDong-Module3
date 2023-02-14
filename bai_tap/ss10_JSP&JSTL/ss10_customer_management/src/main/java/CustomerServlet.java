import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private List<Customer> customerList = new ArrayList<>();

    public void init() {
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Quảng Trị", "https://toplist.vn/images/800px/conan-134737.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Huế", "https://genk.mediacdn.vn/2019/6/13/photo-1-15603635408561457777533.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Đà Nẵng", "https://sugoi.vn/wp-content/uploads/2021/03/nhan-1.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Quảng Nam", "https://upload.motgame.vn/photos/motgame-vn/2022/05/sasuke-naruto-anime.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Quảng Trị", "https://image.lag.vn/upload/news/22/09/26/bang-xep-hang-top-50-nhan-vat-anime-noi-tieng-nhat-nhat-ban-2_RNXV.jpg"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}