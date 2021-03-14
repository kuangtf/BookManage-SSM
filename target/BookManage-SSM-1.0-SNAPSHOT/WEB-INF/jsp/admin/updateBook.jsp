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
                    <small>修改图书信息</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/admin/updateBook" method="post" class="form-horizontal">

        <%--出现的问题：我们提交了修改的sql请求，但是修改失败，初次考虑是事务问题，配置完毕之后仍然错误。--%>
        <%--看一下SQL语句，能否执行成功：SQL执行失败，修改未完成。--%>
        <%--前段传递隐藏域--%>
        <%--细节，数据库中的id是不对外开放的--%>
        <input type="hidden" name="bookID" value="${QBook.bookID}">

        <div class="form-group">
            <label for="inputName">书籍名称：</label>
            <input type="text" name="bookName" class="form-control" id="inputName" value="${QBook.bookName}">
        </div>
        <div class="form-group">
            <label for="inputCounts">书籍数量：</label>
            <input type="text" name="bookCounts" class="form-control" id="inputCounts" value="${QBook.bookCounts}">
        </div>
        <div class="form-group">
            <label for="inputDetail">书籍详情：</label>
            <input type="text" name="detail" class="form-control" id="inputDetail" value="${QBook.detail}">
        </div>
        <div class="form-group">
            <label for="inputDate">出版日期：</label>
            <input type="date" name="date" class="form-control" id="inputDate" value="${QBook.date}">
        </div>
        <div class="form-group">
            <label for="inputAuthor">书籍作者：</label>
            <input type="text" name="author" class="form-control" id="inputAuthor" value="${QBook.author}">
        </div>
        <div class="form-group">
            <label for="inputType">书籍类型：</label>
            <input type="text" name="type" class="form-control" id="inputType" value="${QBook.type}">
        </div>
        <div class="form-group">
            <label for="inputMoney">图书费用：</label>
            <input type="text" name="money" class="form-control" id="inputMoney" value="${QBook.money}">
        </div>
        <div class="form-group">
            <label for="inputCount">剩余数量：</label>
            <input type="text" name="count" class="form-control" id="inputCount" value="${QBook.count}">
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
