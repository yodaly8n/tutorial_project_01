<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2025-10-21
  Time: 오후 4:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>가제 - 커뮤니티</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%@ include file="/template/header.jspf" %>
<div class="main">
    <div style="flex:1">
        <h4>에디터초이스</h4>
        <ul>
            <c:forEach var="one" items="${top5Likes}">
                <li style="font-size: small">
                    <a href="/article?no=${one.no}">${one.title}</a>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div style="flex:4">
        <!-- 베너 -->
        <div>
            이미지 배너
        </div>
        <!-- 네이게이터 -->
        <div>
            전체 글수 : <span>${count}</span>
            <button onclick="location.href='/community/new'">작성하기</button>
        </div>
        <!-- 글 목록 영역 -->
        <div>
            <c:forEach items="${articles}" var="one">
                <div class="article-item">
                    <div style="display: flex; justify-content: space-between">
                        <div>
                            <span class="article-topic ">${one.topic}</span>
                            <span>${one.writerId}</span>
                            <span>&middot;</span>
                            <span>${one.prettyWroteAt}</span>
                        </div>
                        <div>
                            <span style="font-size: small">👁 ${one.viewCnt}</span>
                            &nbsp;
                            <span style="font-size: small; color:black">🤍 ${one.likeCnt}</span>
                        </div>
                    </div>
                    <div>
                        <a href="/article?no=${one.no}" class="article-link">
                            <span style="font-size: 1.1rem; font-weight: 500">
                                    <c:out value="${one.title}"/>
                            </span>
                        </a>
                        <small>💬 ${one.commentCnt}</small>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- 페이지 링크 영역 -->
        <div style="padding: 1.5rem 0rem">
            <c:forEach var="i" begin="1" end="${lastPage}">
                <a href="/community?page=${i}"
                    class="${page == i ? 'active-page-link':'page-link'} "
                >${i}</a>
            </c:forEach>
        </div>
        <!-- 검색 영역 -->
        <div style="padding : 0.5rem 0rem; text-align: center">
            <form action="/community">
                <input type="text" name="keyword" class="input" style="width: 200px"
                       placeholder="커뮤니티 내에서 검색"
                       value="${keyword}"
                />
            </form>

        </div>
    </div>
    <div style="flex:1">
        <h3>Top Writers</h3>
        <ol>
            <c:forEach items="${top5Writer}" var="one" >
                <li>
                    ${one.writerId} ✒ ${one.writeCnt}
                </li>
            </c:forEach>
        </ol>
    </div>
</div>
</body>
</html>
