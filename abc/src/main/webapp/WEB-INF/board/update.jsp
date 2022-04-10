<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
		style="margin-top: 20px;">
    <br>
    <form id="updateform" method="post" action="doupdate.do">
    <input type="hidden" name="b_no" value="${detail.b_no}"/>
        <div class="mb-3">
            <label for="nTitle" class="form-label">제목</label>
            <input type="text" class="form-control" id="nTitle" name="b_title" placeholder="제목" value="${detail.b_title}">
        </div>
        <div class="mb-3">
            <label for="nContent" class="form-label">내용</label>
            <textarea class="form-control" id="nContent" name="b_content" rows="15">${detail.b_content}</textarea>
        </div>
        <input type="button" onclick="aaa();" value="수정">
        <br>
    </form>
    <br>
</main>
<script>
function aaa(){
	var form = document.getElementById("updateform");
	if(confirm('수정하시겠습니까?')){
		form.submit();
	}
}
</script>