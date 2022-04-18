<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.header{
/* background-color: blue; */
width:100%;
height:500px;
position:absolute;
top:0px;
}
.clublist{
/* background-color: yellow; */
width:1600px;
height:350px;
position:absolute;
top:150px;
left:3%;
overflow: hidden;
}
.makeoverflow{
width:3300px;
height:350px;
}
.oneclub{
display:inline-block;
/* background-color: red; */
width:270px;
height:280px;
position:relative;
top:0px;
margin:15px;
}
.CLposter{
border-radius: 10px;
	width: 264px;
	height: 200px;
}
/* .cover{
background:linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, #FFFFFF 100%);
width:50px;
height:350px;
position:absolute;
z-index:3;
right:0px;
} */
h2{
position:absolute;
left:4%;
top:100px;
font-weight:700;
}
.righter{
position:absolute;
right:4%;
top:50%;
z-index: 4;
}
.namechip a{
position:absolute;
top:203px;
text-decoration: none;
color:white;
font-weight: 700;
margin:10px;
}
.namechip{
width:264px;
height:35px;
margin-top:8px;
background-color: #359164;
border-radius: 5px;
}
.info2{
position:absolute;
top:213px;
right:50px;
color:white;
}
.oneclub slick-slide slick-active{
width:0px;
}
</style>
</head>
<body> 
	<div class="header">
	<h2>즐거운 동아리시간 보내고 계신가요?</h2>
		<div class="clublist">
		<div class="cover"></div>
		<div class="makeoverflow">
		<c:forEach var="vo" items="${list }">
			<div class="oneclub">
				<img class="CLposter" src="${vo.cl_poster}"><br>
				<div class="namechip">
				<a href="#">${vo.cl_name}</a><span class="info2">${vo.cl_head }명&nbsp;&nbsp;|&nbsp;&nbsp;${vo.cl_loc }</span>
				</div>
				
			</div>
		</c:forEach>
			
		</div>
		</div>
		<img class="righter" src="../resources/img/화살표2.png">

	</div>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript"
		src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 

	<script>
		$(document).ready(function() {
			$('.makeoverflow').slick({
				prevArrow : $(".lefter"),
				nextArrow : $(".righter"),
				infinite : true,
				speed : 300,
				slidesToShow : 10,
				slidesToScroll : 1
			});
		});
	</script>
</body>
</html>