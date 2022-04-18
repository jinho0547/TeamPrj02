<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
<style type="text/css">
.card-body {
	width: 250px;
	height: 230px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}
.puzzleBtnlink{
	float: right;
	
}
ul li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<div class="contentbox">
		<h4>
			<b>내가 가입한 동아리 내역</b>
		</h4>
		<div style="margin-top: 60px;"></div>
		<div style="position: relative; width: 1300px; height: 700px;margin-left:-50px; margin-top: 70px; ">
			<c:forEach var="mvo" items="${list2 }" varStatus="s">
				<ul>
				<c:if test="${s.index%3==0 }">
					<li>
					<div class="card" style="width: 100%;">
						<div class="card-body">
							<h5 class="card-title"><b style="font-size: 20px;">${mvo.p_title }</b></h5>
							<p class="card-text">[${mvo.p_loc }]&nbsp;${mvo.p_dloc }</p>
							<P class="card-text">${mvo.p_cost }원</P>
							<P class="card-text"><fmt:formatDate value="${mvo.p_date}" pattern="yyyy-MM-dd"/>-${mvo.p_time }</P>
							<a href="/puzzle/${mvo.cl_no }/main.do" class="btn btn-primary puzzleBtnlink">퍼즐 이동</a>
						</div>
					</div>
					</li>
				</c:if>
				<c:if test="${s.index%3!=0 }">
					<li>
					<div class="card" style="width: 100%;">
						<div class="card-body">
							<h5 class="card-title"><b style="font-size: 20px;">${mvo.p_title }</b></h5>
							<p class="card-text">[${mvo.p_loc }]&nbsp;${mvo.p_dloc }</p>
							<P class="card-text">${mvo.p_cost }원</P>
							<P class="card-text"><fmt:formatDate value="${mvo.p_date}" pattern="yyyy-MM-dd"/>-${mvo.p_time }</P>
							<a href="/puzzle/${mvo.cl_no }/main.do" class="btn btn-primary puzzleBtnlink">퍼즐 이동</a>
						</div>
					</div>
					</li>
				</c:if>
				</ul>
			</c:forEach>
		</div>
	</div>
</body>
</html>