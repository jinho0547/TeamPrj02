<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.header{
/* background-color: blue; */
width:100%;
height:500px;
position:absolute;
top:0px;
}
.clublist{
/* background-color: yellow; */
width:1600px;
height:350px;
position:absolute;
top:150px;
left:3%;
overflow: hidden;
}
.makeoverflow{
width:3300px;
height:350px;
}
.oneclub{
display:inline-block;
/* background-color: red; */
width:270px;
height:280px;
position:relative;
top:0px;
margin:15px;
}
.CLposter{
border-radius: 10px;
	width: 264px;
	height: 200px;
}
/* .cover{
background:linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, #FFFFFF 100%);
width:50px;
height:350px;
position:absolute;
z-index:3;
right:0px;
} */
h2{
position:absolute;
left:4%;
top:100px;
font-weight:700;
}
.righter{
position:absolute;
right:4%;
top:50%;
z-index: 4;
}
.namechip a{
position:absolute;
top:203px;
text-decoration: none;
color:white;
font-weight: 700;
margin:10px;
}
.namechip{
width:264px;
height:35px;
margin-top:8px;
background-color: #359164;
border-radius: 5px;
}
.info2{
position:absolute;
top:213px;
right:50px;
color:white;
}
.oneclub slick-slide slick-active{
width:0px;
}










.fully{
	position:absolute;
	width:100%;
	height:100%;
	margin:0px auto;
}
.formposition{
	position:absolute;
	width:50%;
	height:95%;
	top:5%;
	left:-4%;
	font-size:15px;
	line-height: 30px;
}

.makePosition{
	position:relative;
	left:50px;
	margin:0px 0px;
	width:500px;
	height:500px;
}
.msgcss{
color: red;
}
.makePosition .in{
height:20px;
border-radius: 5px;
border:1.3px solid gray;
}
.makePosition button{
	background: #fdbe51;
	float:right;
	width:115px;
	height:25px;
	border:none;
	position:relative;
	top:3px;
	border-radius: 5px;
	text-align:center;
	
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
.myinfopic{
position:relative;
float:right;
}

.fixsubmitBtn{
position:relative;
background-color: #fdbe51;
top:20px;
left:0px;
 width:500px;
 height:40px;
 	border:none;
	border-radius: 5px;
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
<div class="contentbox">
<h4>내 정보 수정</h4>
<img class="myinfopic" alt="" src="../resources/img/myinfo.png">
<div class="fixinfo">
	<div class="formposition">
		<div class="makePosition">
		<form method="post" action="myInfoUpdate.do">
		아이디 : ${vo.id }<input type=hidden name="id" value="${vo.id }">
		<br>
		<div class="linefix">
		<br>
		</div>
		이름 <br> <input class="in" type=text id="makingname" size=60  value="${vo.name}" name="name" ><br>
		<div class="linefix">
		<br>
		</div>
		닉네임 <br> <input class="in"  type=text id="makingnic" size=40 v-model="makingnic" value="${vo.nic}" name="nic">
		&nbsp;
		<button type="button" id="nicCheck" value="닉네임중복체크" class="nicCheck" v-on:click="nicCheck()">중복체크</button>
		<br>
		<div class="linefix">
		<br>
		</div>
		비밀번호 <br> <input class="in" type=password id="makingpwd" size=60 v-model="makingpwd" name="pwd" value="${vo.pwd}"><br>
		<div class="linefix">
		<br>
		</div>
		비밀번호 확인&nbsp;&nbsp; <span class="msgcss">{{ msg }}</span> <br> <input class="in" type=password id="checkpwd" size=60 v-on:mouseout="pwdCheck()" v-model="checkpwd"><br>
		<div class="linefix">
		<br>
		</div>
		주소 <br> <input type=text class="in" id="makingaddr1" size=40  v-model="makingaddr1" :value="makingaddr1" value="${vo.addr1}" name="addr1">
		&nbsp;
		<button type="button" id="findPost" value="주소찾기" class="findPost" v-on:click="findPost()">주소 찾기</button>
		<div class="linefix">
		<br>
		</div>
		상세주소 <br> <input type=text class="in" id="makingaddr2" size=60 value="${vo.addr2}" name="addr2"><br>
		<div class="linefix">
		<br>
		</div>
		우편번호 <br> <input type=text class="in" id="makingpost" size=60 v-model="makingpost" :value="makingpost" value="${vo.post}" name="post"><br>
		<div class="linefix">
		<br>
		</div>
		이메일 <br> <input type=text class="in" id="makingemail" size=60 value="${vo.email}" name="email"><br>
		<div class="linefix">
		<br>
		</div>
		전화번호 <br> <input type=text class="in" id="makingtel" size=60 value="${vo.tel}" placeholder="   -   -   의 형식으로 입력해 주세요." name="tel"><br>
		<div class="linefix">
		<br>
		</div>
		<input type=hidden name="sex" value="${vo.sex }">
		<input class="in" type=hidden name="admin" value="${vo.admin }">
	
		생일 &nbsp;&nbsp; <input type=date id="datepicker" size=22 value="${vo.birth}" name="birth">
		<div class="linefix">
		<br>
		</div>
	
		<input type=submit class="fixsubmitBtn" id="fixsubmitBtn" value="정보 수정하기" v-on:click="success()"/>
		</form>
		</div>
		
	</div>
</div>
</div>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript"
		src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 

	<script>
		$(document).ready(function() {
			$('.makeoverflow').slick({
				prevArrow : $(".lefter"),
				nextArrow : $(".righter"),
				infinite : true,
				speed : 300,
				slidesToShow : 10,
				slidesToScroll : 1
			});
		});
	</script>



<script>
new Vue({
	el:'.fixinfo',
	data:{
		makingnic:'${vo.nic}',
		makingpwd:'${vo.pwd}',
		checkpwd:'${vo.pwd}',
		makingaddr1:'${vo.addr1}',
		makingpost:'${vo.post}',
		makingadmin:0,
		msg:''
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
		nicCheck:function(){
			 axios.get("http://localhost:8080/member/nicCheck.do",{
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
		 success:function(){
			 alert('수정되었습니다!')
		 }
	}
})
</script>
</body>
</html>