<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>学生信息展示</title>

    <!-- 引入 Bootstrap -->
    <link href="../../../bootstrap/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>信息列表 —— 显示学生借阅信息</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/allBook">进入书籍首页</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/User">当前用户信息</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/borrowBooks">已借阅图书信息</a>
        </div>
        <div class="col-md-4 column"></div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>学生编号</th>
                    <th>学生名字</th>
                    <th>学生性别</th>
                    <th>学生年龄</th>
                    <th>学生学号</th>
                    <th>学生手机号</th>
                    <th>学生费用</th>
                    <th>学生学院</th>
                    <th>学生年级</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                    <c:forEach var="user"  items="${list}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.gender}</td>
                        <td>${user.age}</td>
                        <td>${user.studentNum}</td>
                        <td>${user.phoneNum}</td>
                        <td>${user.money}</td>
                        <td>${user.college}</td>
                        <td>${user.grade}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/user/toUpdateUser?id=${user.id}" class="btn btn-success">修改</a>
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
