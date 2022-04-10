<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.fully{
	position:absolute;
	width:100%;
	height:100%;
	margin:0px auto;
}
.formposition{
	position:absolute;
	width:30%;
	height:30%;
	top:25%;
	left:8%;
	font-size:15px;
	line-height: 30px;
	border:#fdbe51 solid 2px;
	border-radius: 15px;
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
	
	width:280px;
	height:200px;
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
	width:130px;
	height:30px;
	border:none;
	border-radius: 5px;
}
.linefix{
line-height: 30%;
}
.linefix2{
line-height:0%;
}
.submitBtn{
position:absolute;
bottom:15%;
left:0%;
background: #fdbe51;
/*  width:420px;
 height:40px;
 	border:none;
	border-radius: 5px;*/
	font-size: 18px;
	font-weight: 400; 
	
}
.backBtn{
position:absolute;
background: white;
bottom:15%;
right:0%;
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
.finding a{
font-size:12px;
color:gray;
text-decoration: none;
}
.finding{
position:absolute;
font-size:12px;
color:gray;
right:2%;
}

</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="fully">
<div class="changearea">
	<img class="illust" alt="" src="../resources/img/sign_up_.png">
	<div class="formposition">
		<h2>로그인</h2>
		<div class="makePosition">
			아이디&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<input type=text id="inputid" size=30 v-model="inputid">
		<br>
		<div class="linefix">
		<br>
			비밀번호&nbsp;:&nbsp;<input type=text id="inputpwd" size=30 v-model="inputpwd">
		</div>
		<br>
		<div class="linefix2">
		<br>
		<div class="finding">
		<a href="../member/movefind_id.do">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="../member/movefind_pwd.do">비밀번호 찾기</a>
		</div>
		<button class="submitBtn" id="loginBtn" value="loginBtn" v-on:click="loginBtn()" >로그인</button>
		<button class="backBtn" id="backBtn" value="backBtn" ><a href="../main/main.do">취소하기</button>
		</div>
	</div>
</div>
</div>
</div>
<script>
	new Vue({
		el:'.changearea',
		data:{
			inputid:'',
			inputpwd:''
		},
		methods:{
			loginBtn:function(){
				axios.get("http://localhost:8080/web/member/log_in.do",{
					params:{
						id:this.inputid,
						pwd:this.inputpwd
					}
				}).then(res=>{
					console.log(res.data)
					if(res.data=='NOID'){	
					alert('아이디가 존재하지 않습니다.');	
				}
				else if(res.data=='NOPWD'){
					alert('잘못된 비밀번호입니다.');	
				}
				else{
					location.href="../member/log_in_ok.do";
				}
				})
			}
			
		
		}
	})
</script>
</body>
</html>