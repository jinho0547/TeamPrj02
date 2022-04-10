<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
		style="margin-top: 20px;">
    <br>
    <form method="post" action="dowrite.do">
        <div class="mb-3">
            <label for="nTitle" class="form-label">제목</label>
            <input type="text" class="form-control" id="nTitle" name="b_title" placeholder="제목">
        </div>
        <div class="mb-3">
            <label for="nContent" class="form-label">내용</label>
            <textarea class="form-control" id="nContent" name="b_content" rows="15"></textarea>
        </div>
        <input type ="submit" value="작성">
        <br>
    </form>
    <br>
</main>