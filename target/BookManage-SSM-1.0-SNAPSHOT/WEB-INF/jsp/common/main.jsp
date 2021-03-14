<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <style type="text/css">
        a {
            text-decoration: none;
            color: black;
            font-size: 18px;
        }
        h3 {
            width: 180px;
            height: 38px;
            margin: 100px auto;
            text-align: center;
            line-height: 38px;
            background: deepskyblue;
            border-radius: 4px;
        }
        body{
            text-align: center;
        }
    </style>
</head>
<body>

<h2>简易图书管理系统</h2>
欢迎 ${user.username} 登录后台
<h3>
    <a href="${pageContext.request.contextPath}/book/allBooks">进入书籍首页</a>
    <br>
    <a href="${pageContext.request.contextPath}/user/allUser">进入学生首页</a>
</h3>

</body>
</html>
