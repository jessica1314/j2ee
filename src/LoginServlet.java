import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String name = request.getParameter("name");
        String password = request.getParameter("password");
        if ("admin".equals(name) && "123".equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("name", name);
            response.sendRedirect("listHero");//只要不需要传递参数，就客户端跳转；如果请求转发？
        } else {
            response.sendRedirect("login.html");
        }
    }

}