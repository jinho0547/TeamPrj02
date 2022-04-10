<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
		style="margin-top: 20px;">
    <br>
    <table class="table">
        <thead>
        <tr style="text-align:center;">
            <th class="col-1">번호</th>
            <th class="col-5">제목</th>
            <th class="col-2">글쓴이</th>
            <th class="col-1">날짜</th>
            <th class="col-1">조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="b" items="${list}">
        <tr style="text-align:center;">
            <th scope="row">${b.b_no }</th>
            <td><a href="../board/detail.do?id=${b.b_no}" style="text-decoration: none;color:black;">${b.b_title}</a>&nbsp;<span style="color:#dddddd;">[1]</span></td>
            <td>${b.id}</td>
            <td><fmt:formatDate value="${b.b_regdate}" pattern="yyyy-MM-dd"/></td>
            <td>${b.b_hit}</td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:set var="page" value="${empty param.p?1:param.p}"/>
    <c:set var="startNum" value="${page-(page-1)%5}"/>
    <c:set var="totalpage" value="${fn:substringBefore(Math.ceil(total/10),'.')}"/>
    <c:set var="endNum" value="${startNum+4<=totalpage?startNum+4:totalpage}"/>
    <a href="../board/write.do"><button type="button" class="btn btn-secondary" style="float: right;">글쓰기</button></a>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
        <c:if test="${startNum==1}">
            <li class="page-item disabled">
             <a class="page-link">Previous</a>
            </li>
        </c:if>
        <c:if test="${startNum!=1}">
            <li class="page-item">
            <a class="page-link" href="../board/list.do?p=${startNum-1}">Previous</a>
            </li>
        </c:if>
            <c:forEach var="i" begin="0" end="4">
            <c:if test="${(startNum+i)<=totalpage}">
            <c:if test="${startNum+i==page}">
            <li class="page-item active"><a class="page-link" href="../board/list.do?p=${startNum+i}">${startNum+i}</a></li>
            </c:if>
            <c:if test="${startNum+i!=page}">
            <li class="page-item"><a class="page-link" href="../board/list.do?p=${startNum+i}">${startNum+i}</a></li>
            </c:if>
            </c:if>
            </c:forEach>
            <c:if test="${endNum!=totalpage}">
            <li class="page-item">
                <a class="page-link" href="../board/list.do?p=${endNum+1}">Next</a>
            </li>
            </c:if>
            <c:if test="${endNum==totalpage}">
            <li class="page-item disabled">
                <a class="page-link" href="#">Next</a>
            </li>
            </c:if>
        </ul>
        
    </nav>
</main>