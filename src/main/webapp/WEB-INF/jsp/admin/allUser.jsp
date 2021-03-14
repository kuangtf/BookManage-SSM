<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户信息展示</title>

    <!-- 引入 Bootstrap -->
    <link href="../../../bootstrap/bootstrap.min.css" rel="stylesheet">


</head>
<body>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>用户信息列表 —— 显示所有用户信息</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/allBooks">进入书籍首页</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/allUsers">显示全部学生</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/admin">管理员首页</a>
        </div>
        <div class="col-md-4 column"></div>
        <div class="col-md-4 column">
            <form action="${pageContext.request.contextPath}/admin/queryUser" method="post" class="form-inline">
                <span style="color: red;font-weight: bold">${error}</span>
                <input type="text" name="queryUserName" class="form-control" placeholder="请输入要查询的用户名">
                <input type="submit" value="查询" class="btn btn-info">
            </form>
        </div>
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
                <c:forEach var="user" items="${pageInfo.list}">
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
                            <a href="${pageContext.request.contextPath}/admin/toUpdateUser?id=${user.id}" class="btn btn-success">修改</a>
                            <a href="${pageContext.request.contextPath}/admin/deleteUser/${user.id}" class="btn btn-danger">删除</a>
                            <a href="${pageContext.request.contextPath}/admin/userBook?studentNum=${user.studentNum}" class="btn btn-info">查询学生已借图书</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 显示分页信息 -->
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6">当前 【${pageInfo.pageNum }】 页,总 【${pageInfo.pages }】
            页,总 【${pageInfo.total }】 条记录</div>
        <!-- 分页条信息 -->
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <%--首页--%>
                    <li><a href="${pageContext.request.contextPath}/admin/allUser?pn=1">首页</a></li>

                    <%--前一页--%>
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li><a href="${pageContext.request.contextPath}/admin/allUsers?pn=${pageInfo.pageNum-1}"
                               aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        </a></li>
                    </c:if>

                    <%--中间显示的页码--%>
                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${page_Num }</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li><a href="${pageContext.request.contextPath}/admin/allUsers?pn=${page_Num }">${page_Num }</a></li>
                        </c:if>
                    </c:forEach>

                    <%--后一页--%>
                    <c:if test="${pageInfo.hasNextPage }">
                        <li><a href="${pageContext.request.contextPath}/admin/allUsers?pn=${pageInfo.pageNum+1 }"
                               aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                        </a></li>
                    </c:if>

                    <%--末页--%>
                    <li><a href="${pageContext.request.contextPath}/admin/allUsers?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>


</div>
</body>
</html>
