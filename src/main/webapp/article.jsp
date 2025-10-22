<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2025-10-22
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>${article.title} - 가제</title>
    <link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<%@include file="/template/header.jspf" %>
<div class="main">
    <div style="flex:1"></div>
    <div style="flex:4">
        <!-- 게시글 영역 -->
        <div>
            <div>
                커뮤니티 / ${article.topic}
            </div>
            <div style="display: flex; justify-content: space-between">
                <div>
                    <span>${article.writerId}</span>&middot;
                    <span>${article.prettyWroteAt}</span>&middot;
                    <span>👁${article.viewCnt}</span>
                </div>
                <div>
                    <button>📌</button>
                </div>
            </div>
            <div>
                <h2><c:out value="${article.title}"/></h2>
            </div>
            <div style="white-space: pre-line">
                <c:out value="${article.content}"/>
            </div>
            <div>
                <button onclick="reactionHandle(${auth});">
                    ${alreadyLike ? '🧡' : '🤍'}
                    &nbsp;${article.likeCnt}
                </button>
                <form action="/article/reaction" method="post" style="display: none" id="reactionForm">
                    <input type="hidden" name="no" value="${article.no}"/>
                </form>
            </div>
        </div>
        <!-- 댓글 영역 -->
        <div>

        </div>
    </div>
    <div style="flex:1"></div>
</div>
<script>
    function reactionHandle(flag) {
        if(!flag) {
            if(window.confirm("로그인이 필요한 기능입니다. 로그인 페이지로 이동하시겠습니까?")) {
                location.href="/login";
            }
        }else {
            document.getElementById("reactionForm").submit();
        }
    }
</script>


</body>
</html>
