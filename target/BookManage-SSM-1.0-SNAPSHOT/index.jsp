<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <style type="text/css">
        a {
            text-decoration: none;
            color: #000000;
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
    </style>
</head>
<body>


<a href="${pageContext.request.contextPath}/admin/toLogin"><h3>管理员登录</h3></a>
<%--<jsp:include page="/admin/toLogin"></jsp:include>--%>
<br>
<a href="${pageContext.request.contextPath}/user/toLogin"><h3>学生登录</h3></a>

</body>
</html>
