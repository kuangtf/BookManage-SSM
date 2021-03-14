<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>书籍展示</title>

    <!-- 引入 Bootstrap -->
    <link href="../../../bootstrap/bootstrap.min.css" rel="stylesheet">


</head>
<body>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表 —— 显示所有书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/allBook">显示全部书籍</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/User">返回个人中心</a>
        </div>
        <div class="col-md-4 column"></div>
        <div class="col-md-4 column">
            <form action="${pageContext.request.contextPath}/user/queryBook" method="post" class="form-inline">
                <span style="color: red;font-weight: bold">${error}</span>
                <input type="text" name="queryBookName" class="form-control" placeholder="请输入要查询的书名">
                <input type="submit" value="查询" class="btn btn-info">
            </form>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名字</th>
                    <th>书籍数量</th>
                    <th>书籍详情</th>
                    <th>出版日期</th>
                    <th>书籍作者</th>
                    <th>书籍类型</th>
                    <th>书籍费用</th>
                    <th>书籍状态</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="book"  items="${pageInfo.list}">
                    <tr>
                        <td>${book.bookID}</td>
                        <td>${book.bookName}</td>
                        <td>${book.bookCounts}</td>
                        <td>${book.detail}</td>
                        <td><fmt:formatDate value="${book.date}" pattern='yyyy/MM/dd'/></td>
                        <td>${book.author}</td>
                        <td>${book.type}</td>
                        <td>${book.money}</td>
                        <td>${book.count}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/borrowBook/borrow?bookName=${book.bookName}" class="btn btn-success">借阅</a>
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
                    <li><a href="${pageContext.request.contextPath}/user/allBook?pn=1">首页</a></li>

                    <%--前一页--%>
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li><a href="${pageContext.request.contextPath}/user/allBook?pn=${pageInfo.pageNum-1}"
                               aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        </a></li>
                    </c:if>

                    <%--中间显示的页码--%>
                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${page_Num }</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li><a href="${pageContext.request.contextPath}/user/allBook?pn=${page_Num }">${page_Num }</a></li>
                        </c:if>
                    </c:forEach>

                    <%--后一页--%>
                    <c:if test="${pageInfo.hasNextPage }">
                        <li><a href="${pageContext.request.contextPath}/user/allBook?pn=${pageInfo.pageNum+1 }"
                               aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                        </a></li>
                    </c:if>

                    <%--末页--%>
                    <li><a href="${pageContext.request.contextPath}/user/allBook?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>


</div>
</body>
</html>
