<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
$(document).ready(function(){
	getReplyList();
});

</script>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
		style="margin-top: 20px;">
    <br>
    <c:set var="b_no" value="${detail.b_no}"/>
    <table class="table">
        <thead>
        <tr style="text-align:center;">
            <th class="col-1">번호</th>
            <th class="col-4">제목</th>
            <th class="col-2">글쓴이</th>
            <th class="col-1">날짜</th>
            <th class="col-1">조회수</th>
        </tr>
        </thead>
        <tbody>
        <tr style="text-align:center;">
            <th scope="row">${b_no}</th>
            <td>${detail.b_title}</td>
            <td>${detail.id}</td>
            <td><fmt:formatDate value="${detail.b_regdate}" pattern="yyyy-MM-dd"/></td>
            <td>${detail.b_hit}</td>
        </tr>
        </tbody>
    </table>
    <table class="table">
        <thead>
        <tr>
            <hr>
            <th colspan="6" style="text-align: center;">내용</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td rowspan=10>
                <div style="margin:30px;padding:30px;">
                    ${detail.b_content}
                </div>
            </td>
        </tr>
        </tbody>
    </table>
    <table class="table">
        <thead>
        <th>댓글</th>
        <!-- 댓글 작성 form -->
        <form id="writeform">
        <textarea id="msg" name="r_msg" rows="4" cols="180" style="margin-left:10px"></textarea>
        <button id="writebtn" type="button" class="btn btn-secondary" style="width:100px; height:100px;float: right; top:50px">댓글 작성</button>
       </form>
        <!-- 댓글 작성 form end -->
        </thead>
        <!-- 댓글 list -->
        <tbody id="replyList">
       <!--  
        <tr>
            <td class="col-9" style="padding-left:60px;">asdasdasdadsas</td>
            <td class="col-1">re.id</td>
            <td class="col-1">2022-02-22</td>
            <td style="text-align: right; color:gray;padding-right:20px;">수정</td>
            <td style="text-align: right; color:gray;padding-right:20px;">삭제</td>
        </tr>
        <tr>
            <td class="col-9" style="padding-left:60px;">asdasdasdadsas</td>
            <td class="col-1">re.id</td>
            <td class="col-1">2022-02-22</td>
            <td style="text-align: right; color:gray;padding-right:20px;">수정</td>
            <td style="text-align: right; color:gray;padding-right:20px;">삭제</td>
        </tr>
        <tr>
            <td class="col-9" style="padding-left:60px;">asdasdasdadsas</td>
            <td class="col-1">re.id</td>
            <td class="col-1">2022-02-22</td>
            <td style="text-align: right; color:gray;padding-right:20px;">수정</td>
            <td style="text-align: right; color:gray;padding-right:20px;">삭제</td>
        </tr> -->
        </tbody>
        
        <!-- 댓글 list end -->
        
    </table>
   
    <button type="button" class="btn btn-secondary" onclick="history.back()">목록</button>
    <!-- if문 줘야함  -->
    <a href="delete.do?id=${b_no}"><button type="button" class="btn btn-secondary" style="float: right;">삭제</button></a>
    <a href="update.do?id=${b_no}"><button type="button" class="btn btn-secondary" style="margin-right: 10px; float: right;">수정</button></a>
</main>
<script>
function getReplyList(){
	var bno = {"bno":"${b_no}"};
	$.ajax({
		type:'post',
		url:'replyList.do',
		data:bno,
		dataType:'json',
		success:function(data){
			$("#replyList").html(toHtml(data));
		},
		error:function(){
			alert('실패');
		}
	});
}
function write(){
	var msg = $("#msg").val();
	var bno = ${b_no};
	var id = 'jinho';
	var data = {"b_no":bno,"r_msg":msg,"id":id};
	$.ajax({
		type:'post',
		url:'writeReply.do',
		data:JSON.stringify(data),
		contentType:'application/json',
		success:function(data){
			alert('댓글을 달았습니다.');
			getReplyList();
			$("#msg").val('');
		},
		error:function(){
			alert('실패');
		}
	});
}
function toHtml(replys){
	var tmp = "";
	replys.forEach(function(reply){
		tmp+='<tr>';
		tmp+='<td class="col-9" style="padding-left:60px;">'+reply.r_msg+'</td>';
		tmp+='<td class="col-1">'+reply.id+'</td>';
		tmp+='<td class="col-1">'+reply.r_regDate+'</td>';
		tmp+='<td style="text-align: right; color:gray;padding-right:20px;">수정</td>';
		tmp+='<td style="text-align: right; padding-right:20px;"><a id="deletereply" onclick="delreply('+reply.r_no+');" href="javascript:void(0);" style="text-decoration:none; color:gray;">삭제</a></td>';
		tmp+='</tr>';
	})
	return tmp;
}
function delreply(rno){
	var rno = rno;
	console.log(rno);
	if(confirm('삭제하시겠습니까?')){
		$.get("deleteReply.do?r_no="+rno);
		alert('삭제되었습니다.');
		getReplyList();
	}
}
$('button#writebtn').click(function(){write();});
</script>