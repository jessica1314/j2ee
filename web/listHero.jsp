<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: JESSICA
  Date: 2021/6/27
  Time: 下午 4:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>英雄列表</title>
    <script src="bootstrap/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
    <link href="bootstrap/css/bootstrap/3.3.6/bootstrap.min.css"
          rel="stylesheet">
    <script src="bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
</head>
<body>
<script>
    $(function () {
        $("a").addClass("btn btn-default btn-xs");
        $("td").attr("align", "center");//在自启动函数里，初始化表格状态？
    });

</script>
<table style="width: 500px;margin:44px auto" class="table table-striped table-bordered table-hover table-condensed"
       align="center" border="1px" cellspacing="0">
    <tr>
        <td>id</td>
        <td>name</td>
        <td>hp</td>
        <td>damage</td>
        <td>edit</td>
        <td>delete</td>
    </tr>
    <c:forEach items="${heros}" var="hero" varStatus="st">
        <tr>
            <td>${hero.id}</td>
            <td>${hero.name}</td>
            <td>${hero.hp}</td>
            <td>${hero.damage}</td>
            <td><a href="editHero?id=${hero.id}">编辑</a></td>
            <td><a href="deleteHero?id=${hero.id}">删除</a></td>
        </tr>
    </c:forEach>

</table>
<nav>
    <ul class="pager">
        <li><a href="?start=0">[首页]</a></li>
        <li><a href="?start=${pre}">[上一页]</a></li>
        <li><a href="?start=${next}">[下一页]</a></li>
        <li><a href="?start=${last}">[末页]</a></li>
    </ul>
</nav>
</body>
</html>
