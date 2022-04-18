<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h4{
position:absolute;
top:0px;
left:0px;
font-weight:700;
z-index: 3;
}
h5{
position:absolute;
top:80px;
font-weight:700;
font-size: 30px;
color:#afd4ef;
}
.tagposition{
position:absolute;
width:1220px;
height:300px;
left:0%;
top:250px;
}
.tagchip0,.tagchip1,.tagchip2,.tagchip3,.tagchip4,.tagchip5,.tagchip6,.tagchip7,.tagchip8,.tagchip9,
.tagchip10,.tagchip11,.tagchip12,.tagchip13,.tagchip14,.tagchip15{
border-radius: 50px;
background: none;
border:2px solid #568bff;
color:#568bff;
font-weight: 500px;
margin:10px;
}
.writecate{
position:absolute;
top:150px;
width:1200px;
height:50px;
border:none;
font-size: 30px;
font-weight: 700px;
color:#568bff;
}
p{
font-size: 50px;
}

select{
  -moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
	border-radius: 50px;
background: none;
border:2px solid #568bff;
color:#568bff;
font-weight: 500px;
font-size:20px;
 line-height: 3;
 width:200px;
 text-align:center;
margin:10px;
}
.msgdiv{
background-color: #568bff;
width:auto;
height:auto;
font-size: 28px;
font-weight: 1000px;
color:white;
border-radius: 100px;
position:absolute;
top:150px;
left:10px;
}
.Btns{
position:absolute;
top:80px;
right:-10px
}
button{
width:100px;
height:40px;
color:white;
font-size:18px;
font-weight: 700px;
background-color: #3760f2;
border-radius: 10px;
border:none;
margin-left:10px;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="contentbox">
<h4>관심 카테고리</h4>
<div class="divider"></div>
<h5>"회원님은 어떤 동아리에 관심을 갖고 계신가요?"</h5>

<div class="tags">
<span class="msgdiv">
&nbsp;&nbsp;{{msg}}&nbsp;&nbsp;
<!-- <h5>"</h5><input type="text" class="writecate"id="writecate" size=100 v-model="writecate" :value="selectcate"><h5>"</h5> -->
<!-- <p>{{selectcate}}</p> -->
</span>
<div class="tagposition">

<select class="tagchip" v-model="cate1" v-on:change="putcate1()">
<option value="" >관심 카테고리 선택</option>
<option value="요리/제조">요리 / 제조</option>
<option value="아웃도어/여행" >아웃도어 / 여행</option>
<option value="운동/스포츠" >운동 / 스포츠</option>
<option value="인문학/책/글" >인문학 / 책 / 글</option>
<option value="업무/직무">업무 / 직무</option>
<option value="외국/언어" >외국 / 언어</option>
<option value="문화/공연/축제" >문화 / 공연 / 축제</option>
<option value="음악/악기" >음악 / 악기</option>
<option value="공예/만들기" >공예 / 만들기</option>
<option value="댄스/무용" >댄스 / 무용</option>
<option value="봉사활동">봉사활동</option>
<option value="사교/인맥" >사교 / 인맥</option>
<option value="차/오토바이">차 / 오토바이</option>
<option value="사진/영상" >사진 / 영상</option>
<option value="게임/오락">게임 / 오락</option>
<option value="반려동물" >"반려동물</option>
</select>
<select class="tagchip" v-model="cate2" v-on:change="putcate2()">
<option value="" >관심 카테고리 선택</option>
<option value="요리/제조">요리 / 제조</option>
<option value="아웃도어/여행" >아웃도어 / 여행</option>
<option value="운동/스포츠" >운동 / 스포츠</option>
<option value="인문학/책/글" >인문학 / 책 / 글</option>
<option value="업무/직무">업무 / 직무</option>
<option value="외국/언어" >외국 / 언어</option>
<option value="문화/공연/축제" >문화 / 공연 / 축제</option>
<option value="음악/악기" >음악 / 악기</option>
<option value="공예/만들기" >공예 / 만들기</option>
<option value="댄스/무용" >댄스 / 무용</option>
<option value="봉사활동">봉사활동</option>
<option value="사교/인맥" >사교 / 인맥</option>
<option value="차/오토바이">차 / 오토바이</option>
<option value="사진/영상" >사진 / 영상</option>
<option value="게임/오락">게임 / 오락</option>
<option value="반려동물" >"반려동물</option>
</select>
<select class="tagchip" v-model="cate3" v-on:change="putcate3()">
<option value="" >관심 카테고리 선택</option>
<option value="요리/제조">요리 / 제조</option>
<option value="아웃도어/여행" >아웃도어 / 여행</option>
<option value="운동/스포츠" >운동 / 스포츠</option>
<option value="인문학/책/글" >인문학 / 책 / 글</option>
<option value="업무/직무">업무 / 직무</option>
<option value="외국/언어" >외국 / 언어</option>
<option value="문화/공연/축제" >문화 / 공연 / 축제</option>
<option value="음악/악기" >음악 / 악기</option>
<option value="공예/만들기" >공예 / 만들기</option>
<option value="댄스/무용" >댄스 / 무용</option>
<option value="봉사활동">봉사활동</option>
<option value="사교/인맥" >사교 / 인맥</option>
<option value="차/오토바이">차 / 오토바이</option>
<option value="사진/영상" >사진 / 영상</option>
<option value="게임/오락">게임 / 오락</option>
<option value="반려동물" >"반려동물</option>
</select>
<select class="tagchip" v-model="cate4" v-on:change="putcate4()">
<option value="" >관심 카테고리 선택</option>
<option value="요리/제조">요리 / 제조</option>
<option value="아웃도어/여행" >아웃도어 / 여행</option>
<option value="운동/스포츠" >운동 / 스포츠</option>
<option value="인문학/책/글" >인문학 / 책 / 글</option>
<option value="업무/직무">업무 / 직무</option>
<option value="외국/언어" >외국 / 언어</option>
<option value="문화/공연/축제" >문화 / 공연 / 축제</option>
<option value="음악/악기" >음악 / 악기</option>
<option value="공예/만들기" >공예 / 만들기</option>
<option value="댄스/무용" >댄스 / 무용</option>
<option value="봉사활동">봉사활동</option>
<option value="사교/인맥" >사교 / 인맥</option>
<option value="차/오토바이">차 / 오토바이</option>
<option value="사진/영상" >사진 / 영상</option>
<option value="게임/오락">게임 / 오락</option>
<option value="반려동물" >"반려동물</option>
</select>
<select class="tagchip" v-model="cate5" v-on:change="putcate5()">
<option value="" >관심 카테고리 선택</option>
<option value="요리/제조">요리 / 제조</option>
<option value="아웃도어/여행" >아웃도어 / 여행</option>
<option value="운동/스포츠" >운동 / 스포츠</option>
<option value="인문학/책/글" >인문학 / 책 / 글</option>
<option value="업무/직무">업무 / 직무</option>
<option value="외국/언어" >외국 / 언어</option>
<option value="문화/공연/축제" >문화 / 공연 / 축제</option>
<option value="음악/악기" >음악 / 악기</option>
<option value="공예/만들기" >공예 / 만들기</option>
<option value="댄스/무용" >댄스 / 무용</option>
<option value="봉사활동">봉사활동</option>
<option value="사교/인맥" >사교 / 인맥</option>
<option value="차/오토바이">차 / 오토바이</option>
<option value="사진/영상" >사진 / 영상</option>
<option value="게임/오락">게임 / 오락</option>
<option value="반려동물" >"반려동물</option>
</select>

</div>
</div>
<div class="Btns">
<button class="subBtn" v-on:click="submit()">저장하기</button>
<button class="undoBtn" v-on:click="undo()">선택 리셋</button>
</div>
</div>
<script>
new Vue({
	el:'.contentbox',
	data:{
		cate1:'',
		cate2:'',
		cate3:'',
		cate4:'',
		cate5:'',
		msg:'${category}'
	},
	methods:{
		putcate1:function(){
		
			this.msg = this.msg+this.cate1;
		},
		putcate2:function(){
		
			this.msg = this.msg+','+this.cate2;
	
		},
		putcate3:function(){
		
			this.msg = this.msg+','+this.cate3;
			
		},
		putcate4:function(){
		
			this.msg = this.msg+','+this.cate4;
			
		},
		putcate5:function(){
		
			this.msg = this.msg+','+this.cate5;
		
		},
		submit:function(){
			axios.get("http://localhost:8080/mypage/favCategory.do",{
				params:{
					category:this.msg
				}
			}).then(res=>{
				alert('관심 카테고리가 저장되었습니다!')
			})
			
		},
		undo:function(){
			this.msg='';
		}
		
	}
})
</script>
</body>
</html>