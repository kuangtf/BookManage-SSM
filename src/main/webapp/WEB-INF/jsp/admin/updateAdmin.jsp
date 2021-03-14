<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员信息修改</title>
    <!-- 引入 Bootstrap -->
    <link href="../../../bootstrap/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改信息</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/admin/updateAdmin" method="post" class="form-horizontal">

        <input type="hidden" name="id" value="${QAdmin.id}">

        <div class="form-group">
            <label for="inputName">管理员名称</label>
            <input type="text" name="name" class="form-control" id="inputName" value="${QAdmin.name}">
        </div>
        <div class="form-group">
            <label for="inputPassword">管理员密码</label>
            <input type="password" name="password" class="form-control" id="inputPassword" value="${QAdmin.password}">
        </div>

    </form>

</div>
</body>
</html>
