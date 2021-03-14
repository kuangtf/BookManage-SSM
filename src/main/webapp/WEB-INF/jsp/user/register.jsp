<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生注册</title>
    <!-- 引入 Bootstrap -->
    <link href="../../../bootstrap/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>学生 注册</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/user/addUser" method="post" class="form-horizontal">
        <div class="form-group">
            <label for="inputName">学生名称：</label>
            <input type="text" name="username" class="form-control" id="inputName" required>
        </div>
        <div class="form-group">
            <label for="inputPassword">学生密码：</label>
            <input type="password" name="password" class="form-control" id="inputPassword" required>
        </div>
        <div class="form-group">
            <label for="inputGender">学生性别：</label>
            <input type="text" name="gender" class="form-control" id="inputGender" required>
        </div>
        <div class="form-group">
            <label for="inputAge">学生年龄：</label>
            <input type="text" name="age" class="form-control" id="inputAge" required>
        </div>
        <div class="form-group">
            <label for="inputStudentNum">学号：</label>
            <input type="text" name="studentNum" class="form-control" id="inputStudentNum" required>
        </div>
        <div class="form-group">
            <label for="inputPhoneNum">手机号：</label>
            <input name="phoneNum" class="form-control" id="inputPhoneNum" required>
        </div>
        <div class="form-group">
            <label for="inputMoney">费用：</label>
            <input type="text" name="money" class="form-control" id="inputMoney" required>
        </div>
        <div class="form-group">
            <label for="inputCollege">学院：</label>
            <input type="text" name="college" class="form-control" id="inputCollege" required>
        </div>
        <div class="form-group">
            <label for="inputGrade">年级：</label>
            <input type="text" name="grade" class="form-control" id="inputGrade" required>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">注册</button>
            </div>
        </div>
    </form>

</div>
</body>
</html>
