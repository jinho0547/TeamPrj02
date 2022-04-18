<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.block{
position:absolute;
top:500px;
left:4%;
width:200px;
height:300px;
}
h4{
position:absolute;
top:0px;
left:0px;
font-weight:700;
z-index: 3;
}
.buttons{
position:absolute;
top:50px;
}
.brfix{
line-height: 10px;
}
.selected{
color:#63bc8d; 
font-weight:600; 
text-decoration:none;
}
.menulist{
text-decoration:none;
color:black;
}
.menulist:hover{
text-decoration:none;
color:black;
font-weight: 700;
}
</style>
</head>
<body>
<div class="block">
	<h4>마이페이지</h4>
	<div class="buttons">
	<a href="/mypage/mycategory_go.do" class="menulist" v-model="mycate" v-on:click="catepic()">관심 카테고리</a><div class="brfix"><br></div>
	<a href="/mypage/wishclub_go.do" class="menulist" v-model="mywish" v-on:click="wishpic()">내 가입 모임</a><div class="brfix"><br></div>
	<a href="/mypage/fixMyInfo_go.do" class="menulist" v-model="myinfo" v-on:click="infopic()">내 정보 수정</a><div class="brfix"><br></div>
	</div>
</div>
<script>
	/* new Vue({
		el:'.block',
		data:{
			catepick:'selected',
			wishpick:'disselected',
			infopick:'disselected'
		},
		methods:{
			catepic:function(){
				this.catepick='selected',
				this.wishpick='disselected',
				this.infopick='disselected'
			},
			wishpic:function(){
				this.catepick='disselected',
				this.wishpick='selected',
				this.infopick='disselected'
			},
			infopic:function(){
				this.catepick='disselected',
				this.wishpick='disselected',
				this.infopick='selected'
			}
			
		}
	}) */
</script>
</body>
</html>