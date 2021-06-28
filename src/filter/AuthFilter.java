package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest res = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        String uri = res.getRequestURI();//资源路径 ==》 去除了主机名和端口号？
        if (uri.endsWith("login.html") || uri.endsWith("login")) {
            filterChain.doFilter(res, resp);
            return;//如果不写这个是不是往下执行啦？
        }
        //其他的需要检验是否session
        String userName = (String) res.getSession().getAttribute("name");
        if (null == userName) {
            resp.sendRedirect("login.html");
            return;
        }
        filterChain.doFilter(res, resp);
    }

    @Override
    public void destroy() {

    }
}
