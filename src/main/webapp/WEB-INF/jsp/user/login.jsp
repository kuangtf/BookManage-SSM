<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>登录页面</title>
    <style>
        #box{
            width: 450px;
            height: 400px;
            border: 1px solid #E2E3E5;
            position: absolute;
            left: 50%;
            top: 50%;
            margin-left: -185px;
            margin-top: -200px;
        }
        #logo{
            width: 370px;
            height: 95px;
            font-size: 30px;
            color: #676A6C;
            line-height: 95px;
            margin-left: 40px;
        }
        #username{
            width: 295px;
            height: 50px;
            margin-left: 40px;
        }
        #password{
            width: 295px;
            height: 50px;
            margin-left: 40px;
        }
        .input-group{
            margin-left: 40px;
        }
        #captchaImage {
            width: 95px;
            height: 30px;
            margin-top: 15px;
            border-radius: 2px;
            cursor: pointer;
            position: absolute;
            z-index: 3;
            left: 10px;
            top: 0;
        }
        #validateCode {
            height: 55px;
            padding-left: 120px;
            width: 295px;
        }
        #verify{
            width: 295px;
            height: 60px;
            margin-left: 40px;
            border: 1px solid #EDEDEE;
        }
        #btn-login{
            width: 295px;
            height: 50px;
            margin-left: 40px;
            margin-top: 20px;
        }
        #remember{
            width: 80px;
            height: 20px;
            margin-left: 150px;
            margin-top: 20px;
            color: #676A6C;
            font-size: 15px;
        }
        #s_username{
            float:right;
            margin-top: 15px;
        }
        #s_password{
            float:right;
            margin-top: 20px;
        }
        #s_validateCode{
            float:right;
            margin-top: 28px;
        }
    </style>

    <!-- 引入 Bootstrap -->
    <link href="../../../bootstrap/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script type="text/javascript">
        $(function () {
            //time表示时间戳，可以防止缓存，确保每次生成不同的验证码
            $("#captchaImage").click(function(){
                //$("#captchaImage").attr("src", "user/captcha?time=" + (new Date()).valueOf());
                this.src = "${pageContext.request.contextPath}/user/captcha?time="+new Date().getTime();
            });
        });

        window.onload = function () {
            //给表单绑定onsubmit事件
            document.getElementById("registerFrom").onsubmit = function () {
                return checkUsername() && checkPassword() && checkCode();
            }

            //给用户名和密码框、Email、姓名、手机号分别绑定离焦事件
            document.getElementById("username").onblur = checkUsername;
            document.getElementById("password").onblur = checkPassword;
            document.getElementById("validateCode").onblur = checkCode;
        }

        //校验用户名
        function checkUsername() {
            //获取用户名的值
            var username = document.getElementById("username").value;
            //定义正则表达式
            var reg_username = /^([a-zA-Z0-9_-])/;
            //判断值是否符合正则表达式的规则
            var flag = reg_username.test(username);
            //提示信息
            var s_username = document.getElementById("s_username");
            if (flag) {
                //提示绿色对勾
                s_username.innerHTML = "<img src='${pageContext.request.contextPath}/img/gou.png' width='35' height='25'>";
            } else {
                //提示红色错误信息
                s_username.innerHTML = "用户名格式有误";
            }
            return flag;
        }

        //校验密码
        function checkPassword() {
            //1.获取密码的值
            var password = document.getElementById("password").value;
            //2.定义正则表达式
            var reg_password = /^\w{6,12}$/;
            //3.判断值是否符合正则的规则
            var flag = reg_password.test(password);
            //4.提示信息
            var s_password = document.getElementById("s_password");
            if (flag) {
                //提示绿色对勾
                s_password.innerHTML = "<img width='35' height='25' src='${pageContext.request.contextPath}/img/gou.png'/>";
            } else {
                //提示红色错误信息
                s_password.innerHTML = "密码格式有误";
            }
            return flag;
        }

        //校验验证码
        function checkCode() {
            //1.获取验证码的值
            var code = document.getElementById("validateCode").value;
            //2.获取随机生成的验证码
            var flag = true;
            //3.提示信息
            var s_code = document.getElementById("s_validateCode");
            //3.判断两次的值是否一致
            if (code !== confirmpwd) {
                //提示红色错误信息
                s_code.innerHTML = "验证码不一致";
            }
            return flag;
        }
    </script>

</head>
<body>
<canvas class="particle"></canvas>
<div id="box">
    <div id="logo">欢迎登录！</div>
    <div id="info">
        <form method="post" action="${pageContext.request.contextPath}/user/loginUser" id="registerFrom">
            <div style="color: red;"><span id="s_username" class="error"></span></div>
            <input type="text" class="form-control" id="username" name="username" placeholder="账号:">

            <div style="color: red;"><span id="s_password" class="error"></span></div>
            <input type="password" class="form-control" id="password" name="password" placeholder="密码:">

            <div style="color: red;"><span id="s_validateCode" class="error"></span></div>
            <div class="input-group">
                <u>
                    <input type="text" class="form-control" id="validateCode" name="validateCode" placeholder="验证码:">
                </u>
                <img src="${pageContext.request.contextPath}/user/captcha?time=<%=new Date().getTime() %>" id="captchaImage" title="获取验证码"/>
            </div>

            <div id="remember">记住登录<input type="checkbox"></div>

            <button class="btn btn-info" id="btn-login" onclick="VerifyLogin()">登录</button>
        </form>
    </div>
</div>
</body>
</html>
