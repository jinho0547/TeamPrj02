<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.block2{
position:absolute;
top:370px;
left:4%;
width:230px;
height:300px;
}
h4{
position:absolute;
top:0px;
left:0px;
font-weight:700;
z-index: 3;
}
.buttons{
position:absolute;
top:120px;
}
.writeBtn{
position:absolute;
top:70px;
width:180px;
height:40px;
background-color: #f57243;
color:white;
font-size: 20px;
font-weight: 500;
border:none;
border-radius: 10px;
}
.allBtn{
position:absolute;
top:120px;
width:180px;
height:40px;
background-color: #63bc8d;
color:white;
font-size: 20px;
font-weight: 500;
border:none;
border-radius: 10px;
}
.mineBtn{
position:absolute;
top:170px;
width:180px;
height:40px;
background-color: #86b3f5;
color:white;
font-size: 20px;
font-weight: 500;
border:none;
border-radius: 10px;
}
.brfix{
line-height: 10px;
}
.selected{
color:#63bc8d; 
font-weight:600; 
text-decoration:none;
}
.menulist{
text-decoration:none;
color:black;
}
.menulist:hover{
text-decoration:none;
color:black;
font-weight: 700;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="block2">
	<h4>공지 및 질문 게시판</h4><div class="brfix"><br></div>
	
	<button class="writeBtn">
	<c:if test="${sessionScope.id!=null }">
	<a href="../mainboard/insert_go.do">
	</c:if>
	<c:if test="${sessionScope.id==null }">
	<a href="../member/log_in_move.do">
	</c:if>
	글쓰기</a></button><div class="brfix"><br></div>
	<button class="allBtn"><a href="../mainboard/main_go.do">전체 글 보기</a></button><div class="brfix"><br></div>
	<c:if test="${sessionScope.id!=null }">
	<button class="mineBtn">
	<a href="../mainboard/myBoard_go.do">
	내가 쓴 글 보기</a></button><div class="brfix"><br></div>
	</c:if>
	

</div>
</div>
<script>
new Vue({
	el:'.block2',
	methods:{
		insert:function(){
		location.href="mainboard/insert_go.do";
	} 
	}
})
</script>
</body>
</html>