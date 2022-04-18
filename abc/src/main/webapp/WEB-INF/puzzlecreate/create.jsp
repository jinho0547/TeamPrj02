<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
.container{
  margin-top: 50px;
}
.row{
  margin: 0px auto;
  width:850px;
}
h1{
   text-align: center;
}

table {
	border-collapse: separate;
	border-spacing: 0 8px;
}

</style>
<script type="text/javascript">
$(function(){
	$('#joinpuzzle').click(function(){
		
	 	let join_name=$('#join_name').val()
		if(join_name.trim()=="")
		{
			$('#join_name').focus();
			return;
		}  
	 	
		let join_content=$('#join_content').val() 
		if(join_content.trim()=="")
		{
			$('#join_content').focus()
			return;
		}
		
		let join_cost=$('#join_cost').val()
		if(join_cost.trim()=="")
		{
			$('#join_cost').focus();
			return;
		}
		
		let join_loc=$('#join_loc').val()
		if(join_loc.trim()=="")
		{
			$('#join_loc').focus();
			return;
		}
		
		$('#join_frm').submit()
		
	})
})	

</script>
</head>
<body>
   <div class="container">
    <h1><strong>PUZZLE 생성</strong></h1>
    <hr>
    <br>
    <br>
    <div class="row">
    <form method="post" action="insert_ok.do" id="join_frm">
     <table class="table">
      <tr>
       <th width=20% class="warning text-right">퍼즐이름</th>
       <td width=80%>
         <input type=text size=20 class="input-sm" name=p_title id="join_name">
       </td>
      </tr>
      <tr>
       <th width=20% class="warning text-right">내용</th>
       <td width=80%>
         <input type=text size=60 name=p_content id="join_content">    
      </tr>
      <tr>
       <th width=20% class="warning text-right">참가비</th>
       <td width=80%>
         <input type=text size=60 name=p_cost id="join_cost">    
      </tr>
      <tr>
       <th width=20% class="warning text-right">모임장소</th>
       <td width=80%>
         <span> <select aria-label="Default select example" name=p_loc>
	         <option value="" checked:true >지역을 선택해 주세요</option>
  				<option value="강남구">강남구</option>
  				<option value="강동구">강동구</option>
  				<option value="강북구">강북구</option>
  				<option value="강서구">강서구</option>
  				<option value="관악구">관악구</option>
  				<option value="광진구">광진구</option>
  				<option value="구로구">구로구</option>
  				<option value="금천구">금천구</option>
  				<option value="노원구">노원구</option>
  				<option value="도봉구">도봉구</option>
  				<option value="동대문구">동대문구</option>
  				<option value="동작구">동작구</option>
  				<option value="마포구">마포구</option>
  				<option value="서대문구">서대문구</option>
  				<option value="서초구">서초구</option>
  				<option value="성동구">성동구</option>
  				<option value="성북구">성북구</option>
  				<option value="송파구">송파구</option>
  				<option value="양천구">양천구</option>
  				<option value="영등포구">영등포구</option>
  				<option value="용산구">용산구</option>
  				<option value="은평구">은평구</option>
  				<option value="종로구">종로구</option>
  				<option value="중구">중구</option>
  				<option value="중랑구">중랑구</option>
	         </select>
	         
         <input type=text size=40 name="p_dloc" id="join_loc">    </span>
         </td>
         </tr>
         <tr>
           <th width=20% class="warning text-right">모임날짜</th>
     	  <td width=80%>
         <input type=date name=db_day>    
         <tr>
      <tr>
      <th width=10% class="warning text-rihgt">모임시간</th>
      	  <td width=80%>
 	  <input type=time name=p_time>
 	  </td>
      </tr>
      <tr>
      <th width=20% class="warning text-ringt">모임정원</th>
      <td width=80%>
      <input type=range value="0" min="1" max="50"
      oninput="this.nextElementSibling.value = this.value" name=p_head>
		<output>0</output>
      </td>
      
      
      
      <tr>
        <td colspan="2" class="text-center">
          <input type=button class="btn btn-sm btn-primary" 
          value="퍼즐생성" id="joinpuzzle">&nbsp;&nbsp;&nbsp;&nbsp;
          <input type=button class="btn btn-sm btn-warning" 
          value="취소" onclick="javascript:history.back()">
        </td>
      </tr>
     </table>
     </form>
    </div>
   </div>
</body>
</html>


