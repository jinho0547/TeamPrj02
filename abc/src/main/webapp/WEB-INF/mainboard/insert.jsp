<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.entire1{
width:100%;
height:1000px;
}
.banner{
background-color: #fdbe51;
width:100%;
height:236px;
top:50px;
text-align: center;
}
.listblock{
border: 2px solid #f57243;
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
background-color: #f57243;
margin-top:10px;
margin-bottom:20px;
width:960px;
height:1px;
}
textarea {
	resize: none;
	border:none;
}
textarea:focus {
	outline:none;
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
.noBtn{
position:absolute;
bottom:20px;
left:240px;
border: 2px solid #f57243;
background-color: white;
border-radius:10px;
width:100px;
height:40px;

}
.noBtn a{
color:#f57243;
font-weight: 500;
}
.noBtn a:hover{
color:#f57243;
font-weight: 700;
}
</style>
</head>
<body>
<div class="entire1">
<div class="banner">
	<img class="bannerimg" alt="" src="../resources/img/banner.png">
</div>
<div class="listblock">
	<form method="post" action="mainboardInsert.do">
	<span>제목 : <input type="text" size=50 name="b_title" placeholder="제목을 입력해주세요"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span>작성자 : <input type="text" size=20 name="id" value="${id }" readonly> </span>
	<div class="divider"></div>
	<textarea rows="10" cols="88" placeholder="내용을 입력해주세요" name="b_content"></textarea>
	<input type="submit" class="submitBtn" value="글 올리기">
	<button class="noBtn"><a href="../mainboard/main_go.do">취소</a></button>
	</form>
</div>
</div>
</body>
</html>