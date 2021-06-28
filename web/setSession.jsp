<%--
  Created by IntelliJ IDEA.
  User: JESSICA
  Date: 2021/6/26
  Time: 下午 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>setsession</title>
</head>
<body>
<%--9个内置对象 out request response pagecontext session  application  page:代表当前jsp转义的java类对象；this  config  exception --%>
<%
    session.setAttribute("name", "teemo");
%>
<a href="getsession.jsp">跳转到获取session的页面</a>
</body>
</html>
