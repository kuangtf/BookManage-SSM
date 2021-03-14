<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>更新图书</title>
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

    <form action="${pageContext.request.contextPath}/user/updateUser" method="post" class="form-horizontal">

        <input type="hidden" name="id" value="${QUser.id}">

        <div class="form-group">
            <label for="inputName">学生名称：</label>
            <input type="text" name="username" class="form-control" id="inputName" value="${QUser.username}">
        </div>
        <div class="form-group">
            <label for="inputPassword">学生密码：</label>
            <input type="password" name="password" class="form-control" id="inputPassword" value="${QUser.password}">
        </div>
        <div class="form-group">
            <label for="inputGender">学生性别：</label>
            <input type="text" name="gender" class="form-control" id="inputGender" value="${QUser.gender}">
        </div>
        <div class="form-group">
            <label for="inputAge">学生年龄：</label>
            <input type="text" name="age" class="form-control" id="inputAge" value="${QUser.age}">
        </div>
        <div class="form-group">
            <label for="inputStudentNum">学号：</label>
            <input type="text" name="studentNum" class="form-control" id="inputStudentNum" value="${QUser.studentNum}">
        </div>
        <div class="form-group">
            <label for="inputPhoneNum">手机号：</label>
            <input type="text" name="phoneNum" class="form-control" id="inputPhoneNum" value="${QUser.phoneNum}">
        </div>
        <div class="form-group">
            <label for="inputMoney">费用：</label>
            <input type="text" name="money" class="form-control" id="inputMoney" value="${QUser.money}">
        </div>
        <div class="form-group">
            <label for="inputCollege">学院：</label>
            <input type="text" name="college" class="form-control" id="inputCollege" value="${QUser.college}">
        </div>
        <div class="form-group">
            <label for="inputGrade">年级：</label>
            <input type="text" name="grade" class="form-control" id="inputGrade" value="${QUser.grade}">
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">修改</button>
            </div>
        </div>
    </form>

</div>
</body>
</html>
