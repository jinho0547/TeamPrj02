<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid" style="padding: 0px;">
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
			style="margin-top: 20px;">
			<div class="row">
				<h2>모임일정 (달력)</h2>
				<h3 class="text-center">${year }년${month }월</h3>
				<br>
				<table class="table">
					<%-- String[] strWeek={"일","월","화","수","목","금","토"}; --%>
					<tr style="height: 50px">
						<c:forEach var="strWeek" items="${strWeek }">
							<th class="text-center">${strWeek }</th>
						</c:forEach>
					</tr>
				</table>
				<%-- 달력 출력 request.setAttribute("week", week);--%>
				<c:set var="week" value="${week }" />
				<table class="table">
					<c:forEach var="i" begin="1" end="${lastday }">
						<c:if test="${i==1 }">
							<tr style="height: 45px">
								<c:forEach var="j" begin="1" end="${week }">
									<td class="text-center">&nbsp;</td>
								</c:forEach>
							
						</c:if>
						<%-- 모임일정이 있을때 --%>
						<%-- 모임일정이 없을때 --%>
						<td class="text-center">${i }</td>

						<c:set var="week" value="${week+1 }" />
						<%--요일 변경 --%>
						<c:if test="${week>6 }">
							<c:set var="week" value="0" />
							</tr>
							<tr style="height: 45px"></tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<div class="row">
				<h1>선택한 날짜의 모임일정을 VueJS로 표현</h1>
			</div>
		</main>
	</div>
</body>
</html>