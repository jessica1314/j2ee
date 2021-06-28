package servlet;

import bean.Hero;
import dao.HeroDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class HeroListServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        String name = (String) request.getSession().getAttribute("name");
        if (null == name) {
            response.sendRedirect("login.html");
            return;
        }
        int start = 0;
        int count = 5;
        try {
            start = Integer.parseInt(request.getParameter("start"));
        } catch (NumberFormatException e) {
            //没有传输start参数时
        }
        List<Hero> heros = new HeroDAO().list(start, count);
        int total = new HeroDAO().getTotal();
        int next = start + count;//下一页的值？10?
        int pre = start - count;//上一页的值？负数就取0的意思可以和0比较大小？

        int last = 0;
        /*例如 共10条数 size=5  最后一页就是 5=10-5  size=11 最后一页是 10=11-1=11-（11%5）    */
        if (total % count == 0) {
            last = total - count;
        } else {
            last = total - total % count;
        }
        last = Math.min(last, total);
        request.setAttribute("heros", heros);
        request.setAttribute("next", Math.min(last, next));
        request.setAttribute("pre", Math.max(0, pre));
        request.setAttribute("last", last);
        request.getRequestDispatcher("/listHero.jsp").forward(request, response);
//        StringBuffer sb = new StringBuffer();
//        sb.append("<table align='center' border='1' cellspacing='0'>\r\n");
//        sb.append("<tr><td>id</td><td>name</td><td>hp</td><td>damage</td><td>edit</td><td>delete</td></tr>\r\n");
//
//        String trFormat = "<tr><td>%d</td><td>%s</td><td>%f</td><td>%d</td><td><a href='/editHero?id=%d' >edit</a></td><td><a href='/deleteHero?id=%d'>delete</a></td></tr>\r\n";
//
//        for (Hero hero : heros) {
//            String tr = String.format(trFormat, hero.getId(), hero.getName(), hero.getHp(), hero.getDamage(), hero.getId(), hero.getId());
//            sb.append(tr);
//        }
//
//        sb.append("</table>");
//        response.getWriter().write(sb.toString());

    }
}