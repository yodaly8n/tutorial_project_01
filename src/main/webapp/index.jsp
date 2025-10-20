<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2025-10-17
  Time: 오전 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>가제</title>
    <style>
        body {
            margin: 0px;
        }

        .header {
            height: 64px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f4f4f4;
            border-bottom: 1px solid #efefef;
        }
    </style>
</head>
<body>
<div class="header">
    <div>
        로고
    </div>
    <c:choose>
        <c:when test="${auth}">
            <div>
                <button>스크랩</button>
                <button>알림</button>
                <button>설정</button>
                <a href="/logout"><button>로그아웃</button></a>
            </div>
        </c:when>
        <c:otherwise>
            <div>
                <button onclick="location.href='/login'">로그인</button>
                <a href="/signup"><button>회원가입</button></a>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<div>
    메인영역 - (진행중)
</div>
</body>
</html>
