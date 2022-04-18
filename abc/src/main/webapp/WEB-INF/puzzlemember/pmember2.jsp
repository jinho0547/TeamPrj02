<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.infom1
{
position: absolute;
left:1400px;
top:80px;
}
.infom2
{
position: absolute;
left:1600px;
top:80px;
}
.head1
{
position: relative;
top:150px;
left:55px;
}


</style>
</head>
<body>
	<!-- <div class="container">
	<div class=row>
	<input type="button" value="가입신청관리" style="width:150px; height:50px;" class="infom1">
	<table class="table">
	<tr class="head1">
	<th  width="10%">ID</th>
	<th  width="50%">인사글</th>
	<th  width="20%">승인</th>
	<th  width="20%">거절</th>
	</tr>
	<tr>
	<td width="10%">마루</td>
	<td width="50%">안녕하세요 잘부탁드립니다</td>
	<td width="20%"><input type="button" value="승인"></td>
	<td width="20%"><input type="button" value="거절"></td>
	</tr>
				
	
	</table> -->
	<div class="container-fluid" style="padding: 0px;">
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
			style="margin-top: 20px;">
			<div class="row">
				<table class="table">
					<tr>
						<td class="text-left">
							<h2><strong>회원 관리</strong></h2>
						</td>
					</tr>
				</table>
				<div class="table-responsive"
					style="height: 560px;">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th scope="col" width="10%">ID</th>
								<th scope="col" width="30%">직위</th>
								<th scope="col" width="8%">승급</th>
								<th scope="col" width="8%">강등</th>
								<th scope="col" width="8%">퇴출</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="vo" items="${ulist }">
							<tr>
								<td style="font-size: 20px;">${vo.id}</td>
								<td style="font-size: 20px;">
								<c:if test="${vo.cl_rank==2 }">
								운영진
								</c:if>
								<c:if test="${vo.cl_rank==3 }">
								회원
								</c:if>
								
								</td>
								
								<c:if test="${vo.cl_rank!=2 }">
								<td><a href="/puzzle/${cl}/puzzlemember/up_ok.do?id=${vo.id}" class="btn btn-primary" onclick="up()">승급</a></td>
								</c:if>
								<c:if test="${vo.cl_rank==2 }">
								<td></td>
								</c:if>
								<c:if test="${vo.cl_rank!=3 }">
								<td><a href="/puzzle/${cl}/puzzlemember/down_ok.do?id=${vo.id}" class="btn btn-warning" style=color:white; onclick="down()">강등</a></td>
								</c:if>
								<c:if test="${vo.cl_rank==3 }">
								<td></td>
								</c:if>
								<td><a href="/puzzle/${cl}/puzzlemember/delete1_ok.do?id=${vo.id}" class="btn btn-danger" onclick="kick()">강퇴</a></td>
							</tr>
						</c:forEach>
						</tbody>
						</table>
						<div class="row1">
						</div>
						</div>
					
	<a href="/puzzle/${cl}/puzzlemember/pmember.do"><input type="button" value="가입처리" style="width:150px; height:50px; border-radius:8px; border:none;" class="infom1"></a>
	<a href="/puzzle/${cl}/puzzlemember/pmember1.do"><input type="button" value="회원관리" style="width:150px; height:50px; border-radius:8px; border:none; background:#573EF2; color:white" class="infom2"></a>
	</div>
	</main>
	</div>
	<script type="text/javascript">

	function up(){

	if (confirm("정말 승급시키겠습니까??") == true){    //확인

	    document.form.submit();

	}else{   //취소

	    return false;
	}
	}
	function down(){

	if (confirm("정말 강등시키겠습니까??") == true){    //확인

	    document.form.submit();

	}else{   //취소

		return false;
	}
	}
	function kick(){

	if (confirm("정말 강퇴시키겠습니까??") == true){    //확인

	    document.form.submit();

	}else{   //취소

	    return false;
	}
	}
	</script>
	
</body>
</html>