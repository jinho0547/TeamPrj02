<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">

<style type="text/css">
.fully{
	position:absolute;
	width:100%;
	height:100%;
	margin:0px auto;
}
.formposition{
	position:absolute;
	width:45%;
	height:95%;
	top:0%;
	left:0%;
	font-size:15px;
	line-height: 30px;
}
h2{
	position:relative;
	text-align:center;
	
}
.illust{
	position:absolute;
	width:100%;
	height:100%;
}
.makePosition{
	position:relative;
	margin:0px auto;
	width:420px;
	height:500px;
}
.msgcss{
color: red;
}
.makePosition input{
height:20px;
border-radius: 5px;
border:1.3px solid gray;
}
.makePosition button{
	background: #fdbe51;
	width:115px;
	height:25px;
	border:none;
	border-radius: 5px;
}
.linefix{
line-height: 30%;
}
.submitBtn{
position:absolute;
bottom:5%;
left:20%;
background: #fdbe51;
 width:420px;
 height:40px;
 	border:none;
	border-radius: 5px;
	font-size: 18px;
	font-weight: 400;
}
.backBtn{
position:absolute;
bottom:-1%;
left:20%;
background: white;
 width:420px;
 height:40px;
 	border:#fdbe51 solid 2px;
	border-radius: 5px;

}
.backBtn a{
text-decoration:none;
color:black;
font-size: 18px;
	font-weight: 400;
}

</style>
<script type="text/javascript" src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="fully">
	<img class="illust" alt="" src="../resources/img/sign_up_.png">
	<div class="formposition">
		<h2>회원가입</h2>
		<div class="makePosition">
		<!-- <form method="post" action="member/memberInsert.do"> -->
		아이디 <br> <input type=text id="makingid" size=40 v-model="makingid">
		&nbsp;
		<button id="checkBtn" value="아이디중복체크" class="checkBtn" v-on:click="idcheck()">아이디중복체크</button>
		<br>
		<div class="linefix">
		<br>
		</div>
		이름 <br> <input type=text id="makingname" size=60 v-model="makingname"><br>
		<div class="linefix">
		<br>
		</div>
		닉네임 <br> <input type=text id="makingnic" size=40 v-model="makingnic">
		&nbsp;
		<button id="nicCheck" value="닉네임중복체크" class="nicCheck" v-on:click="nicCheck()">닉네임중복체크</button>
		<br>
		<div class="linefix">
		<br>
		</div>
		비밀번호 <br> <input type=password id="makingpwd" size=60 v-model="makingpwd"><br>
		<div class="linefix">
		<br>
		</div>
		비밀번호 확인&nbsp;&nbsp; <span class="msgcss">{{ msg }}</span> <br> <input type=password id="checkpwd" size=60 v-on:mouseout="pwdCheck()" v-model="checkpwd"><br>
		<div class="linefix">
		<br>
		</div>
		주소 <br> <input type=text id="makingaddr1" size=40 v-model="makingaddr1" :value="makingaddr1">
		&nbsp;
		<button id="findPost" value="주소찾기" class="findPost" v-on:click="findPost()">주소 찾기</button>
		<div class="linefix">
		<br>
		</div>
		상세주소 <br> <input type=text id="makingaddr2" size=60 v-model="makingaddr2"><br>
		<div class="linefix">
		<br>
		</div>
		우편번호 <br> <input type=text id="makingpost" size=60 v-model="makingpost" :value="makingpost"><br>
		<div class="linefix">
		<br>
		</div>
		이메일 <br> <input type=text id="makingemail" size=60 v-model="makingemail"><br>
		<div class="linefix">
		<br>
		</div>
		전화번호 <br> <input type=text id="makingtel" size=60 v-model="makingtel" placeholder="   -   -   의 형식으로 입력해 주세요."><br>
		<div class="linefix">
		<br>
		</div>
		성별&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="sex" value="남" v-model="makingsex">남자 &nbsp;&nbsp;<input type=radio name="sex" value="여" v-model="makingsex">여자
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		생일 &nbsp;&nbsp; <input type=date id="datepicker" size=22 v-model="makingbirth">
		<div class="linefix">
		<br>
		</div>
	
		<!-- </form> -->
		</div>
		<button class="submitBtn" id="submitBtn" value="submitBtn" v-on:click="submitBtn()" >회원가입하기</button>
		<button class="backBtn" id="backBtn" value="backBtn" > <a href="../main/main.do">취소하기</a></button>
	</div>
</div>
<script>
/*$ (function(){
	$('#findPost').click(function(){
		//alert("연결")
		new daum.Postcode({
			oncomplete:function(data)
			{
				$('#makingpost').val(data.zonecode)
				$('#makingaddr1').val(data.address)
			}
		}).open();
	});
}) */

 new Vue({
	 el:'.fully',
	 data:{
		 makingid:'',
		 makingname:'',
		 makingnic:'',
		 makingpwd:'',
		 checkpwd:'',
		 makingaddr1:'',
		 makingaddr2:'',
		 makingpost:'',
		 makingemail:'',
		 makingtel:'',
		 makingsex:'',
		 makingbirth:'',
		 msg:'',
		 admin:0,
		 adminpwd:'',
		 ok:false
	 },
	 methods:{
		 findPost:function(){
			 
			 new window.daum.Postcode({
					oncomplete:(data)=>
					{	
						this.makingpost = data.zonecode;
						this.makingaddr1 = data.roadAddress;
						 
						
						/* 
						this.makingpost=data.zonecode
						this.makingaddr1=data.address */
					}
				}).open();
		 },
		 idcheck:function(){
			 axios.get("http://localhost:8080/web/member/idcheck.do",{
				 params:{
					 id:this.makingid
				 }
			 }).then(res=>{
				 alert(res.data)
			 })
		 },
		 nicCheck:function(){
			 axios.get("http://localhost:8080/web/member/nicCheck.do",{
				 params:{
					 nic:this.makingnic
				 }
			 }).then(res=>{
				 alert(res.data)
			 })
		 },
		pwdCheck:function(){
			 let pwd1 = this.makingpwd
			 let pwd2 = this.checkpwd
			 if(pwd1!==pwd2){
				 this.msg='비밀번호가 일치하지 않습니다'
			 }else{
				 this.msg=''
			 }
			 
		 },
		 
		 submitBtn:function(){
			 axios.get("http://localhost:8080/web/member/memberInsert.do",{
			 params:{
				 id:this.makingid,
				 pwd:this.makingpwd,
				 nic:this.makingnic,
				 name:this.makingname,
				 addr1:this.makingaddr1,
				 addr2:this.makingaddr2,
				 email:this.makingemail,
				 tel:this.makingtel,
				 sex:this.makingsex,
				 post:this.makingpost,
				 admin:this.admin,
				 birth:this.makingbirth
			 } 
			 }).then(res=>{
				 location.href="../member/log_in_move.do"
			 })
		 }
		 
	 }
 })
</script>
</body>
</html>