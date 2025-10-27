<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2025-10-27
  Time: 오전 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<div class="signup-wrap">
    <div class="signup">
        <a href="/">로고</a>
        <h2 class="text-center">변경하실 비밀번호를 입력해주세요.</h2>
        <form class="signup-form" action="/setting/password-change" method="post">
            <div>
                <label for="password"><small>현재 비밀번호</small></label>
                <div class="mt-1">
                    <input type="password" class="input" name="password"
                           id="password" />
                </div>
            </div>
            <div>
                <label for="newPassword"><small>신규 비밀번호</small></label>
                <div class="mt-1">
                    <input type="password" class="input" name="newPassword"
                           id="newPassword" />
                </div>
            </div>
            <div>
                <label for="newPasswordConfirm"><small>신규 비밀번호 확인</small></label>
                <div class="mt-1">
                    <input type="password" class="input" name="newPasswordConfirm"
                           id="newPasswordConfirm" />
                </div>
            </div>
            <div>
                <button id="loginBt" class="bt-submit">비밀번호 변경</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
