<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
body{
	padding: 0px;
}

.go-top {
  position:fixed;
  bottom: 0px;
  right:0px;
  padding:50px;
  display:none;
  cursor: pointer;
}
.go-top:after {
  content: '▲';
  color: #000;
  /* position: absolute; 
  bottom:80px;
  left: 4500%;
  font-size: 32px; */
  display: inline-block;
    
    background-position: -150px -212px;
    background-repeat: no-repeat;
    vertical-align: top;
    font-size: 32px;
    
}

div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
a {text-decoration:none;}

.quickmenu {position:absolute;width:110px;top:74.5%;margin-top:-50px;right:10px;background:#fff;}
.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
.quickmenu ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
.quickmenu ul li a {position:relative;float:left;width:100%;height:30px;line-height:30px;text-align:center;color:#999;font-size:14.5pt;}
.quickmenu ul li a:hover {color:#000;}
.quickmenu ul li:last-child {border-bottom:0;}

.content {position:relative;min-height:1000px;}


.row1 {
	height: 500px;
	width: 100%;
	margin: 0px auto;
	margin-top: 10px;
}
.box1,.box2,.box3,.box4 {
	position: relative;
	width: 1500px;
	height: 550px;
	margin: 0px auto;
	left: -50px;
	text-align: center;
}
.overflow1,.overflow2,.overflow3,.overflow4 {
	position: relative;
	float: left;
	margin: 0px auto;
	padding-top: 30px;
	width: 1355px;
	height: 550px;
	overflow: hidden;
	text-align: center;
}
.oneRank1,.oneRank2,.oneRank3,.oneRank4 {
	top: 100px;
	display: inline-block;
	margin-top: 60px;
	margin: 40px auto;
	width: 250px;
	height: 450px;
	text-align: center;
	border: none;
	outline: none;
}
.lefter1 {
	position: absolute;
	float:left;
    top: 36%;
    left: -40px;
}
.lefter2 {
	position: absolute;
	float:left;
    top: 42%;
    left: -40px;
}
.lefter3 {
	position: absolute;
	float:left;
    top: 50%;
    left: -40px;
}
.lefter4 {
	position: absolute;
	float:left;
    top: 57%;
    left: -40px;
}
.righter1,.righter2,.righter3,.righter4 {
	position: relative;
	float: right;
	top: 35%;
	left: -100px;
}
.title1 {
	height: 40px;
	padding-top: 100px;
	font-family: 'Noto Sans KR', sans-serif;
}
.card-img-top {
	border-radius: 5px;
	width: 220px;
}
.card-title {
	font-family: 'Noto Sans KR', sans-serif;
}
strong{
	left: -50px;
	position: relative;
}
.card-text {
	font-family: 'Noto Sans KR', sans-serif;
}

.cat-banner{
	
	margin: 0px auto;
	margin-top: 20px;
	margin-left: 100px;
}

.cat-line{

width: 1350.01px;
height: 0px;
margin-top:20px;

border: 1px solid rgba(0, 0, 0, 0.31);
transform: matrix(1, 0, 0, 1, 0, 0);
}



}

</style>
</head>
<body>

<!-- <div class="w3-sidebar w3-bar-block">
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">요리 / 제조</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">아웃도어 / 여행</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">운동 / 스포츠</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">인문학 / 책 / 글</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">업무 / 직무</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">외국 / 언어</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">문화 / 공연 / 축제</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">음악 / 악기</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">공예 / 만들기</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">댄스 / 무용</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">봉사활동</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">사교 / 인맥</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">차 / 오토바이</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">사진 / 영상</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">게임 / 오락</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-none w3-hover-text-blue">반려동물</a>
</div> -->


<section class="container">
	<img class="cat-banner" src="../resources/img/카테고리배너.png">
	<div class="cat-line"></div>
	
	<div class="row1">
			
			<div class="box1">
				
				<div class="overflow1">
					<c:forEach begin="1" end="12" step="1">
						<div class="oneRank1">
							<img src="../resources/img/poster2.png" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">동아리 이름</h5>
								<br>
								<p class="card-text">동아리 간단 설명</p>
								<a href="#" class="btn btn-primary"
									style="background-color: #3a65ef">퍼즐 참가하기</a>
							</div>
						</div>
					</c:forEach>
				</div>
				
			</div>
		</div>
		
		<div class="row1">
			
			<div class="box2">
				
				<div class="overflow2">
					<c:forEach begin="1" end="12" step="1">
						<div class="oneRank2">
							<img src="../resources/img/poster2.png" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">동아리 이름</h5>
								<br>
								<p class="card-text">동아리 간단 설명</p>
								<a href="#" class="btn btn-primary"
									style="background-color: #3a65ef">퍼즐 참가하기</a>
							</div>
						</div>
					</c:forEach>
				</div>
				
			</div>
		</div>

		<div class="row1">
			
			<div class="box3">
				
				<div class="overflow3">
					<c:forEach begin="1" end="12" step="1">
						<div class="oneRank3">
							<img src="../resources/img/poster2.png" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">동아리 이름</h5>
								<br>
								<p class="card-text">동아리 간단 설명</p>
								<a href="#" class="btn btn-primary"
									style="background-color: #3a65ef">퍼즐 참가하기</a>
							</div>
						</div>
					</c:forEach>
				</div>
				
			</div>
		</div>

		<div class="row1">
			
			<div class="box4">
				
				<div class="overflow4">
					<c:forEach begin="1" end="12" step="1">
						<div class="oneRank4">
							<img src="../resources/img/poster2.png" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">동아리 이름</h5>
								<br>
								<p class="card-text">동아리 간단 설명</p>
								<a href="#" class="btn btn-primary"
									style="background-color: #3a65ef">퍼즐 참가하기</a>
							</div>
						</div>
					</c:forEach>
				</div>
				
			</div>
		</div>



		<div class="go-top"></div>
		<div class="quickmenu">
  			<ul>
    			<li><a href="#">공지사항</a></li>
    			<li><a href="#">1:1문의</a></li>
    			<li><a href="#">Q&A</a></li>
  			</ul>
		</div>
		
		<script type="text/javascript"
			src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script>
			$(function(){

				  //Scroll event
				  $(window).scroll(function(){
				    var scrolled = $(window).scrollTop();
				    if (scrolled > 200) $('.go-top').fadeIn('slow');
				    if (scrolled < 200) $('.go-top').fadeOut('slow');
				  });
				  
				  //Click event
				  $('.go-top').click(function () {
				    $("html, body").animate({ scrollTop: "0" },  500);
				  });

				});
			
			$(document).ready(function(){
				  var currentPosition = parseInt($(".quickmenu").css("top"));
				  $(window).scroll(function() {
				    var position = $(window).scrollTop(); 
				    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
				  });
				});
			
			
			
			
			
		</script>

</section>

</body>
</html>