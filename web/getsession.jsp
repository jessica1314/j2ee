<%@ page import="javax.lang.model.element.NestingKind" %><%--
  Created by IntelliJ IDEA.
  User: JESSICA
  Date: 2021/6/26
  Time: 下午 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>getsession</title>
</head>
<body>
<%
    HttpSession session1 = request.getSession();
    String name = (String) session1.getAttribute("name");
    if (name != null) {
        out.println("用户：" + name + "存在session中");
    }
%>

</body>
</html>
