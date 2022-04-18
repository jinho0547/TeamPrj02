<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>



</head>
<body>
	
		<div>
			<tiles:insertAttribute name="nav" />
			<tiles:insertAttribute name="aside"/>
			<tiles:insertAttribute name="search_find" />
			<tiles:insertAttribute name="footer" />
		</div>
		
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
		<script src="/resources/js/feather.min.js"></script>
	
</body>
</html>