<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员信息展示</title>

    <!-- 引入 Bootstrap -->
    <link href="../../../bootstrap/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>信息列表 —— 显示管理员信息</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/allUsers">显示全部用户信息</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/allBooks">显示全部书籍信息</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/admin">查询当前管理员信息</a>
        </div>
        <div class="col-md-1 column">


        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>管理员姓名</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="admin" items="${pageInfo.list}">
                    <tr>
                        <td>${admin.name}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/toUpdateAdmin?id=${admin.name}" class="btn btn-success">修改</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
</html>
