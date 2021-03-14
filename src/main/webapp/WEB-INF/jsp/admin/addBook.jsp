<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加图书</title>
    <!-- 引入 Bootstrap -->
    <link href="../../../bootstrap/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>增加书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/admin/addBook" method="post" class="form-horizontal">
        <div class="form-group">
            <label for="inputName">书籍名称：</label>
            <input type="text" name="bookName" class="form-control" id="inputName" required>
        </div>
        <div class="form-group">
            <label for="inputCounts">书籍数量：</label>
            <input type="text" name="bookCounts" class="form-control" id="inputCounts" required>
        </div>
        <div class="form-group">
            <label for="inputDetail">书籍详情：</label>
            <input type="text" name="detail" class="form-control" id="inputDetail" required>
        </div>
        <div class="form-group">
            <label for="inputDate">出版日期：</label>
            <input type="date" name="date" class="form-control" id="inputDate" required>
        </div>
        <div class="form-group">
            <label for="inputAuthor">书籍作者：</label>
            <input type="text" name="author" class="form-control" id="inputAuthor" required>
        </div>
        <div class="form-group">
            <label for="inputType">书籍类型：</label>
            <input type="text" name="type" class="form-control" id="inputType" required>
        </div>
        <div class="form-group">
            <label for="inputMoney">图书费用：</label>
            <input type="text" name="money" class="form-control" id="inputMoney" required>
        </div>
        <div class="form-group">
            <label for="inputStatus">图书剩余量：</label>
            <input type="text" name="status" class="form-control" id="inputStatus" required>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">添加</button>
            </div>
        </div>

    </form>

</div>
</body>
</html>
