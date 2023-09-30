<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<script>
    function deleteHistory(id) {
        if (confirm("정말 삭제하시겠습니까?")) {
            document.location.href = "${pageContext.request.contextPath}/locHistory/delete?hno=" + id;
        }
    }
</script>
<body>
    <h1>위치 히스토리 목록</h1>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/wifi/v2" class="a-btn">홈</a></li>
            <li>|</li>
            <li><a href="${pageContext.request.contextPath}/locHistory" class="a-btn">위치 히스토리 목록</a></li>
            <li>|</li>
            <li><a href="${pageContext.request.contextPath}/wifi/load" class="a-btn">Open API 와이파이 정보 가져오기</a></li>
            <li>|</li>
            <li><a href="${pageContext.request.contextPath}/bookmark" class="a-btn">북마크 보기</a></li>
            <li>|</li>
            <li><a href="${pageContext.request.contextPath}/bookmarkGroup" class="a-btn">북마크 그룹 관리</a></li>
        </ul>
    </nav>
    <table>
        <thead>
        <tr>
            <td>ID</td>
            <td>X좌표</td>
            <td>Y좌표</td>
            <td>조회일자</td>
            <td>비고</td>
        </tr>
        </thead>
        <tbody>
            <c:if test="${locHistories.isEmpty()}">
                <tr>
                    <td colspan="5">정보가 존재하지 않습니다.</td>
                </tr>
            </c:if>
            <c:if test="${!locHistories.isEmpty()}">
                <c:forEach var="item" items="${locHistories}">
                    <tr>
                        <td>${item.hno}</td>
                        <td>${item.lnt}</td>
                        <td>${item.lat}</td>
                        <td>${item.searchedDate}</td>
                        <td>
                            <button onclick="deleteHistory(${item.hno})">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
        </tbody>
    </table>
</body>
<style>
    ul, li {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    nav {
        padding-bottom: 1em;
    }

    nav ul {
        display: flex;
    }

    nav ul li {
        padding: 0 .5em;
    }

    .a-btn {
        text-decoration: underline;
    }

    .sub-nav {
        display: flex;
        padding-bottom: 1em;
    }

    .sub-nav li {
        padding: 0 .5em;
    }

    table {
        border: 1px solid #fff;
        border-collapse: collapse;
        width: 100%;
    }

    thead {
        background-color: #04AA6D;
        font-weight: bold;
        color: #fff;
    }

    tbody tr:nth-child(2n) {
        background-color: #E7E9EB;
    }

    thead td {
        border-color: #fff;
    }

    td {
        padding: 1em;
        text-align: center;
        border: 1px solid #ddd;
    }
</style>
</html>
