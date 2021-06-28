package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FirstFilter implements Filter {
    static int count = 0;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("first filter init()");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        String ip = req.getRemoteAddr();
        String url = req.getRequestURL().toString();
        System.out.printf("%s %s %s 访问了 %s %n", "第" + (++count) + "次", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss S").format(new Date()), ip, url);
        filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {

    }
}
