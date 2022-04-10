<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<table class="table">
					<tr>
						<td class="text-left">
							<h2>갤러리 게시판</h2>
						</td>
						<td class="text-right">
							<button class="btn btn-danger" style="margin-right: -100px;">새글쓰기</button>
						</td>
					</tr>
				</table>
				<div class="table-responsive"
					style="height: 650px;">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th scope="col" width="5%">번호</th>
								<th scope="col" width="65%">제목</th>
								<th scope="col" width="10%">작성자</th>
								<th scope="col" width="15%">작성일</th>
								<th scope="col" width="5%">조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1,001</td>
								<td>random</td>
								<td>data</td>
								<td>placeholder</td>
								<td>text</td>
							</tr>
							<tr>
								<td>1,002</td>
								<td>placeholder</td>
								<td>irrelevant</td>
								<td>visual</td>
								<td>layout</td>
							</tr>
							<tr>
								<td>1,003</td>
								<td>data</td>
								<td>rich</td>
								<td>dashboard</td>
								<td>tabular</td>
							</tr>
							<tr>
								<td>1,003</td>
								<td>information</td>
								<td>placeholder</td>
								<td>illustrative</td>
								<td>data</td>
							</tr>
							<tr>
								<td>1,004</td>
								<td>text</td>
								<td>random</td>
								<td>layout</td>
								<td>dashboard</td>
							</tr>
							<tr>
								<td>1,005</td>
								<td>dashboard</td>
								<td>irrelevant</td>
								<td>text</td>
								<td>placeholder</td>
							</tr>
						</tbody>
					</table>
				</div>
				<hr>
				<div class="row">
					<table class="table">
						<tr>
							<td class="text-left">
								<form method="post" action="#">
									Search: <input type="checkbox" name="fs" value="N">이름 <input
										type="checkbox" name="fs" value="S">제목 <input
										type="checkbox" name="fs" value="C">내용 <input
										type="text" size="15" class="input-sm" name="ss"> <input
										type="submit" value="검색" class="btn btn-sm btn-success">
								</form>
							</td>
							<td class="text-right">
								<h3>페이징 기법</h3>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</main>
	</div>
</body>
</html>