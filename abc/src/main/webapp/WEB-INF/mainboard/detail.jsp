<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.entire1{
width:100%;
height:2000px;
}
.banner{
background-color: #fdbe51;
width:100%;
height:236px;
top:50px;
text-align: center;
}
.listblock{
border: 2px solid #63bc8d;
border-radius: 10px;
width:1000px;
height:500px;
position:absolute;
top:370px;
left:400px;
padding:20px;
font-size: 20px;
}
input{
border:none;
}
input:focus{
outline:none;
}
.divider{
background-color: #63bc8d;
margin-top:10px;
margin-bottom:20px;
width:960px;
height:1px;
}
.divider2{
background-color: #f57243;
margin-top:10px;
margin-bottom:20px;
width:960px;
height:1px;
}
.divider3{
background-color: #f57243;
margin-top:10px;
margin-bottom:20px;
width:960px;
height:1px;
}

.bcontent {
	width:960px;
	height:300px;
}
textarea {
resize:none;
border:none;
	outline:none;
	background-color: #f9e9e8;
}
textarea:focus {
	outline:none;
}
.noBtn{
position:absolute;
bottom:20px;
left:20px;
border: none;
background-color: #63bc8d;
border-radius:10px;
width:200px;
height:40px;
color:white;
font-weight: 500;
}
.deleteBtn{
position:absolute;
bottom:20px;
right:20px;
border: none;
background-color: #f57243;
border-radius:10px;
width:100px;
height:40px;
color:white;
font-weight: 500;
}
.updateBtn{
position:absolute;
bottom:20px;
left:240px;
border: 2px solid #63bc8d;
background-color: white;
border-radius:10px;
width:200px;
height:40px;
color:#63bc8d;
font-weight: 500;
}

.updateBtn a{
color:#63bc8d;
font-weight: 500;
}
.updateBtn a:hover{
color:#63bc8d;
font-weight: 700;
}
.noBtn a{
color:white;
font-weight: 500;
}
.noBtn a:hover{
color:white;
font-weight: 700;
}
.idbox{
position:relative;
float:right;
right:0px;
}
.commentinput{
border: 2px solid #f57243;
background-color :#f9e9e8;
border-radius: 10px;
width:1000px;
height:330px;
position:absolute;
top:900px;
left:400px;
padding:20px;
font-size: 20px;
}
.submitBtn{
position:absolute;
bottom:20px;
left:20px;
border: none;
background-color: #f57243;
border-radius:10px;
width:200px;
height:40px;
color:white;
font-weight: 500;
}
.commentview{
border: 2px solid #f57243;
border-radius: 10px;
width:1000px;
height:330px;
position:absolute;
top:1250px;
left:400px;
padding:20px;
font-size: 20px;
}
.commentview2{
border: 2px solid #f57243;
border-radius: 10px;
width:1000px;
height:330px;
position:relative;
margin:20px;
top:600px;
left:380px;
padding:20px;
font-size: 20px;
}
.commentview3{
border: 2px solid #f57243;
border-radius: 10px;
width:1000px;
height:330px;
position:relative;
top:1000px;
left:380px;
padding:20px;
font-size: 20px;
margin:20px;
}

.comments{
position:absolute;
top:70px;
width:960px;
height:200px;
}
</style>
</head>
<body>
<div class="entire1">
<div class="banner">
	<img class="bannerimg" alt="" src="../resources/img/banner.png">
</div>
<div class="listblock">

	<span class="titlebox">제목 : ${vo.b_title }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	<span  class="idbox" >작성자 : ${vo.id} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수 : ${vo.b_hit }</span>
	<div class="divider"></div>
	<div class="bcontent">${vo.b_content }</div>
	<button class="noBtn"><a href="../mainboard/main_go.do">목록</a></button>
	<c:if test="${sessionScope.id==vo.id}">
	<button class="updateBtn"><a href="../mainboard/update_go.do?b_no=${vo.b_no }">수정</a></button>
	</c:if>
	<c:if test="${sessionScope.id=='admin' || sessionScope.id==vo.id }">
	<button class="deleteBtn"><a href="../mainboard/delete.do?b_no=${vo.b_no }">삭제</a></button>
	</c:if>
</div>
<c:if test="${sessionScope.id=='admin' }">
<div class="commentinput">
	<span>관리자입니다.</span>
	<div class="divider2"></div>
	<form method="post" action="mbCommentInsert.do">
	<input type="hidden" name="b_no" value="${vo.b_no}">
	<input type="hidden" name="id" value="${vo.id}">
	<textarea rows="5" cols="97" name="r_msg" placeholder="내용을 입력해주세요"></textarea>
	<input type="submit" class="submitBtn" value="답변 등록하기">
	</form>
</div>
<c:forEach var="vo2" items="${list }">
<div class="commentview3">
	<span>관리자입니다.</span><span class="idbox"><fmt:formatDate value="${vo2.r_regdate }" pattern="yyyy-MM-dd"/></span>
	<div class="divider3"></div>
	<div class="comments">${vo2.r_msg }</div>
</div>
</c:forEach>
</c:if>
<c:if test="${sessionScope.id!='admin' }">
<div class="formmake">
<c:forEach var="vo2" items="${list }">
<div class="commentview2">
	<span>관리자입니다.</span><span class="idbox"><fmt:formatDate value="${vo2.r_regdate }" pattern="yyyy-MM-dd"/></span>
	<div class="divider3"></div>
	<div class="comments">${vo2.r_msg }</div>
</div>
</c:forEach>
</div>
</c:if>
</div>

</body>
</html>