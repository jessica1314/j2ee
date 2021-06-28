package listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class onlineNumber implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        ServletContext ctx = httpSessionEvent.getSession().getServletContext();
        Integer online_number = (Integer) ctx.getAttribute("online_number");
        if (online_number == null) {
            online_number = 0;
        }
        online_number++;
        ctx.setAttribute("online_number", online_number);
        System.out.println("新增一位在线用户");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        ServletContext ctx = httpSessionEvent.getSession().getServletContext();
        Integer online_number = (Integer) ctx.getAttribute("online_number");
        if (online_number == 0) {
            online_number = 0;
        } else {
            online_number--;
        }
        ctx.setAttribute("online_number", online_number);
        System.out.println("一位用户离线");
    }
}
