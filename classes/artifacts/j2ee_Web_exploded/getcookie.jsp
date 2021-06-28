<%--
  Created by IntelliJ IDEA.
  User: JESSICA
  Date: 2021/6/26
  Time: 下午 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>getcookie</title>
</head>
<body>

<% Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
%>
<%="name:" + cookie.getName() + ",value:" + cookie.getValue()%>
<br>
<%
        }
    }
%>

</body>
</html>
