<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	padding: 0px;
}
</style>
</head>
<body>

	<!-- nav 위치 -->
	<tiles:insertAttribute name="nav" />
	<!-- Header 위치 -->
	<tiles:insertAttribute name="header" />
	<!-- Content(변경) 위친 -->
	<tiles:insertAttribute name="content" />
	<!-- Footer 위치 -->
	<tiles:insertAttribute name="footer" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>