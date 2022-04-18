<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
<!-- <script>
$(function(){
	$('#btnOk').click(function)(){
		
	}
})

</script> -->
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
	<div class="container-fluid" style="padding: 0px;">
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
			style="margin-top: 20px;">
			<div class="row">
				<table class="table">
					<tr>
						<td class="text-left">
							<h2><strong>가입 승인  / 거절</strong></h2>
						</td>
					</tr>
				</table>
				<div class="table-responsive infom"
					style="height: 560px;">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th scope="col" width="10%">ID</th>
								<th scope="col" width="60%">소개글</th>
								<th scope="col" width="15%">승인</th>
								<th scope="col" width="15%">거절</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="vo" items="${plist }">
						<tr>
				 		<td style="font-size: 20px;">${vo.id}</td>
							<td style="font-size: 20px;">${vo.g_msg}</td>
							<td><a href="/puzzle/${cl}/puzzlemember/update_ok.do?id=${vo.id}" class="btn btn-primary" onclick="ok()">승인</a></td>
							<td><a href="/puzzle/${cl}/puzzlemember/delete_ok.do?id=${vo.id}" class="btn btn-danger" onclick="no()">거절</a></td>
						</tr> 
						</c:forEach> 
						</tbody>
						</table>
						</div>
					
	<a href="/puzzle/${cl}/puzzlemember/pmember.do"><input type="button" value="가입처리" style="width:150px; height:50px; background:#573EF2; color:white; border-radius:8px; border:none;" class="infom1"></a>
	<a href="/puzzle/${cl}/puzzlemember/pmember1.do"><input type="button" value="회원관리" style="width:150px; height:50px; border-radius:8px; border:none;" class="infom2"></a>
	</div>
	</main>
	</div>
	<script type="text/javascript">

	function ok(){

	if (confirm("정말 승인하시겠습니까??") == true){    //확인

	    document.form.submit();

	}else{   //취소

	    return false;
	}
	}
	function no(){

	if (confirm("정말 거절하시겠습니까??") == true){    //확인

	    document.form.submit();

	}else{   //취소

		return false;
		}
	}
	</script>
</body>
</html>