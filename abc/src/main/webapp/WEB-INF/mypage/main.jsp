<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.contentbox{
width:1200px;
height:1500px;
position:absolute;
right:5%;
top:500px;
}
.divider{
position:absolute;
width:1220px;
height:1.8px;
left:0%;
top:50px;
background-color: gray;
}
</style>

</head>
<body>

	<!-- nav 위치 -->
	<tiles:insertAttribute name="nav" />
	<!-- Header 위치 -->
	<tiles:insertAttribute name="header" />
	<!-- aside메뉴 위치 -->
	<tiles:insertAttribute name="aside" />
	<!-- Content(변경) 위치 -->
	<tiles:insertAttribute name="mycategory" />
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>