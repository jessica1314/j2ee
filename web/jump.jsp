<%@ page import="bean.Hero" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.reflect.Parameter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: JESSICA
  Date: 2021/6/26
  Time: 下午 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" errorPage="error.jsp"
         isELIgnored="false" %>
<html>
<head>
    <title>跳转</title>
</head>
<body>
<%--也分客户端和服务器端跳转--%>
<%--<%--%>
<%--    //    response.sendRedirect("/hello1.jsp");--%>
<%--    request.getRequestDispatcher("/hello1.jsp").forward(request, response);--%>
<%--%>--%>
<%
    List<String> heros = new ArrayList<String>();
    heros.add("塔姆");
    heros.add("艾克");
    heros.add("巴德");
    heros.add("雷克赛");
    heros.add("卡莉丝塔");
    String n1 = request.getParameter("name");
    request.setAttribute("heros", heros);
    request.setAttribute("n1", n1);
%>
<c:set var="name" value="${'gareen'}" scope="request"/>
通过标签获取name: <c:out value="${name}"/> <br>
通过el表达式获取name： ${name}
<c:set var="name" value="${'gareen-pageContext'}" scope="page"/>
<c:set var="name" value="${'gareen-request'}" scope="request"/>
<c:set var="name" value="${'gareen-session'}" scope="session"/>
<c:set var="name" value="${'gareen-application'}" scope="application"/>
<br>
优先读取级别高的变量 name: ${name}
<br>
获取javabean的值：${h.name}<%--取代了<c:out value="${name}}">标签--%>
<table width="200px" align="center" border="1" cellspacing="0">
    <tr>
        <td>编号</td>
        <td>英雄</td>
    </tr>
    <c:forEach items="${heros}" var="hero" varStatus="st">
        <tr>
            <td>${st.count}</td>
            <td>${hero}</td>
        </tr>
    </c:forEach>
</table>
<%--获取请求参数--%>
获取浏览器url中请求参数的值：${param.name}
<br>
使用eq表达式判断：${n1 mod 2==0  ? '是偶数 ' : '奇数'}
<%--常见比较符： ge  gt  le lt   eq  neq not mod  is [not] div by is [not] even  --%>

<%--服务器跳转--%>
<%--<jsp:forward page="hello1.jsp"/>--%> <%--服务器跳转？ request携带属性--%>
</body>
</html>
