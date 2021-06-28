<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>编辑页面</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <form class="form-horizontal" action="updateHero" method="post">
            <div class="form-group">
                <label class="col-sm-2 control-label">姓名:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="name" value="${hero.name}"
                           name="name">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">hp</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="hp" value="${hero.hp}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-10">
                    <input type="hidden" class="form-control" name="id" value="${hero.id}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">更新</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
