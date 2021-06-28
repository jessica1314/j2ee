<%@ page import="com.sun.xml.internal.ws.api.pipe.ClientPipeAssemblerContext" %><%--
  Created by IntelliJ IDEA.
  User: JESSICA
  Date: 2021/6/26
  Time: 下午 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>cookie</title>
</head>
<body>
<%--cookie 是服务器端生成的  返回给浏览器 ，然后下次浏览器会带着cookie发送请求--%>
<% Cookie cookie = new Cookie("name", "tom");
    cookie.setMaxAge(24 * 60 * 60);
    cookie.setPath("/"); //访问任何的路径都会传输cookie
    response.addCookie(cookie);
%>
<a href="/getcookie.jsp">getcookie</a>
</body>
</html>
