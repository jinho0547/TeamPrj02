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
	height:70%;
	top:15%;
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
.next1{
	background: #fdbe51;
	width:100px;
	height:30px;
	border:none;
	border-radius: 5px;
}
.next2{
	background: #fdbe51;
	width:135px;
	height:30px;
	border:none;
	border-radius: 5px;
}
.next3{
	background: #fdbe51;
	width:280px;
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
.result{
position:absolute;
bottom:7%;
left:15%;
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
		<h2>아이디 찾기</h2>
		<div class="makePosition">
		<br>
			<div> 이름을 입력해주세요.</div>
			<!-- <div class="msgCss">{{msg1}}</div> -->
			<input type=text id="putname" size=20 v-model="putname">
			&nbsp;&nbsp;
			<button type="button" class="next1" v-on:click="next1Btn()">다음</button>
			<div class="step1"v-model="step1"  v-show="step1">
			<br>
			<div>어떤 방법으로 찾으시겠습니까?</div>
			<input type=radio name="sortBy" id="byEmail" value="byEmail" v-model="sortBy" >이메일로 찾기
			<br>
			<div>이메일 정보를 입력해주세요.</div>
			<input type=text id="putemail" size=40 v-model="putemail">
			<br>
		
			<input type=radio name="sortBy" id="byTel" value="byTel" v-model="sortBy" >전화번호로 찾기
			<br>
			<div>전화번호 정보를 입력해주세요.</div>
			<input type=text id="puttel" size=40 v-model="puttel">
			<br>
			<br>
			<button class="next2" v-on:click="submitBtn()">아이디 찾기</button>&nbsp;
			<button class="next2" v-on:click="backBtn()">취소하기</button>
			</div>
			<br>
			<button class="next3" v-on:click="loginBtn()" v-show="step2">로그인</button>&nbsp;
			</div>
			<br>
			<div class="result" v-show="step2">고객님의 정보와 일치하는 아이디는 "{{ db_id }}" 입니다.</div>
			
			
		</div>
	</div>
</div>
<script>
	new Vue({
		el:'.fully',
		data:{
			putname:'',
			putemail:'',
			puttel:'',
			sortBy:'',
			step1:false,
			step2:false,
			db_id:''
		},
		methods:{
			next1Btn:function(){
				if(this.putname==''){
					alert('이름을 입력해주세요!');
				}else{
					this.step1=true;
				}
			},
			
			submitBtn:function(){
				this.step2=true;
				if(this.sortBy=='byEmail'){
					axios.get("http://localhost:8080/web/member/tellIdByEmail.do",{
						params:{
							name:this.putname,
							email:this.putemail
						}
					}).then(res=>{
						if(res.data=="NOID"){
							alert('일치하는 아이디가 없습니다!')
						}else{
							this.db_id=res.data
						}
					
					})
				}else{
					axios.get("http://localhost:8080/web/member/tellIdByTel.do",{
						params:{
							name:this.putname,
							tel:this.puttel
						}
					}).then(res=>{
						if(res.data=="NOID"){
							alert('일치하는 아이디가 없습니다!')
						}else{
							this.db_id=res.data
						}
					})
				}
			},
			loginBtn:function(){
				location.href="../member/log_in_move.do"
			}

		}
	})
</script>
</body>
</html>