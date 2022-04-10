<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
button a{
color:white;
text-decoration: none;
}

button a:hover{
color:white;
text-decoration: none;
font-weight: 500px;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid" style="padding: 0px;">
		<header class="sticky-top bg-dark flex-md-nowrap p-0"
			style="border: 0.5px solid rgb(183, 181, 181)">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<a class="navbar-brand" href="../main/main.do"> <img src="../img/화살표2.png"
						alt="" width="30" height="24"
						class="d-inline-block align-text-top"> Puzzle
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									카테고리 </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<li><a class="dropdown-item" href="#">요리 / 제조</a></li>
									<li><a class="dropdown-item" href="#">아웃도어 / 여행</a></li>
									<li><a class="dropdown-item" href="#">운동 / 스포츠</a></li>
									<li><a class="dropdown-item" href="#">인문학 / 책 / 글</a></li>
									<li><a class="dropdown-item" href="#">업무 / 직무</a></li>
									<li><a class="dropdown-item" href="#">외국 / 언어</a></li>
									<li><a class="dropdown-item" href="#">문화 / 공연 / 축제</a></li>
									<li><a class="dropdown-item" href="#">음악 / 악기</a></li>
									<li><a class="dropdown-item" href="#">공예 / 만들기</a></li>
									<li><a class="dropdown-item" href="#">댄스 / 무용</a></li>
									<li><a class="dropdown-item" href="#">봉사활동</a></li>
									<li><a class="dropdown-item" href="#">사교 / 인맥</a></li>
									<li><a class="dropdown-item" href="#">차 / 오토바이</a></li>
									<li><a class="dropdown-item" href="#">사진 / 영상</a></li>
									<li><a class="dropdown-item" href="#">게임 / 오락</a></li>
									<li><a class="dropdown-item" href="#">반려동물</a></li>
								</ul></li>
							<li class="nav-item"><a class="nav-link" href="#">동아리</a></li>
							<li class="nav-item"><a class="nav-link" href="#">모임</a></li>
						</ul>
						<form class="d-flex">
							<input class="form-control me-2" type="search" size="30"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-primary" type="submit">Search</button>
							<c:if test="${sessionScope.id==null }">
                  <button class="btn btn-primary"
                     style="width: 50%; margin-left: 20px; margin-right: 10px;" ><a href="../member/log_in_move.do">로그인</a></button>
                  <button class="btn btn-primary" style="width: 60%;"><a href="../member/sign_up.do">회원가입</a></button>
               	  </c:if>
                  <c:if test="${sessionScope.id!=null }">
                  <button class="btn btn-primary"
                     style="width: 50%; margin-left: 20px; margin-right: 10px;" ><a href="../member/log_out.do">로그아웃</a></button>
                  <button class="btn btn-primary" style="width: 60%;"><a href="../member/sign_up.do">마이페이지</a></button>
                  </c:if>
						</form>
					</div>
				</div>
			</nav>
		</header>
	</div>
</body>
</html>