<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!doctype html>

<head>
<meta charset="utf-8">

<title>카테고리</title>

</head>
<body>
	<div class="container-fluid" style="padding: 0px;">
		<!-- nav 위치 -->
		<tiles:insertAttribute name="nav" />
		<!-- aside 위치 -->
		<tiles:insertAttribute name="aside" />
		<!-- Content(변경) 위치 -->
		<tiles:insertAttribute name="category" />
		<!-- Footer 위치 -->
		<tiles:insertAttribute name="footer" />
		
		
	</div>
	
	<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
		<script src="/resources/js/feather.min.js"></script>
</body>
</html>