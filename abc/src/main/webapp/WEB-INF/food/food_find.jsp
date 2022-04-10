<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../images/demo/food.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
let i=0;
let gulist= [ "전체", "강서구", "양천구", "구로구", "마포구", "영등포구", "금천구",
	    "은평구", "서대문구", "동작구", "관악구", "종로구", "중구", "용산구", "서초구", "강북구",
	    "성북구", "도봉구", "동대문구", "성동구", "강남구", "노원구", "중랑구", "광진구", "송파구",
	    "강동구" ];
$(function(){
	$('.images').hover(function(){
		$(this).css("cursor","pointer");
	},function(){
		$(this).css("cursor","none")
	})
	
	$('.images').click(function(){
		let gu=$(this).attr("data-value");
				console.log(gulist[gu]);
				$('#yy').val(gulist[gu]);
		for(let i=1;i<=25;i++)
		{
			$('#gu'+i).attr("src","../images/demo/map/gu_"+i+"_off.png")
		}
		$(this).attr("src","../images/demo/map/gu_"+gu+"_on.png")
		
		/* $.ajax({
			type:'get',
			url:'../food/food_find_result.do',
			data:{"gu":gu},
			success:function(res) // then(function(res)) axios
			{
				
			}
		}) */
	})
	
})
</script>
<style type="text/css">
.container{
width:1400px;
height:1000px;
}
.box{
position: absolute;
top:45%;
left:18%;
}
.row2{
position: absolute;
top:10%;
left:15%;
}

.row3{
position: absolute;
top:100%;
left:50%;
} 
/* row{
width:500px;
margin:0px auto;
} */
.test1{
width:1400px;
display: inline-block;
}
.test2{
width:250px;
}
.row{
  margin: 0px auto;
  width:960px;
}
.images:hover{
  cursor: pointer;
}
.row4{
position: absolute;
left:50%;
top:10%;
}
.thumbnail{
position: relative;
float:left;
top:485px;
left:10%;
margin:10px;
float:left;
}
.pagee{
position: absolute;
top:90%;
left:45%;
}
</style>
</head>
<body>

<div class="container">
<div class="wrapper row2">
  <div id="a">
    <img id="seoul_1" src="../images/demo/map/1111.png">
    <c:forEach var="i" begin="1" end="25">
     <img id="gu${i }" src="../images/demo/map/gu_${i }_off.png"
      class="images" data-value="${i }"
     >
    </c:forEach>
  </div>
</div>
<div class="row">
<div class="box">
	           <div class="box1">
	       Search:<input type=text size=20 id="yy" class="input-sm"  v-model="ss"
             :value="ss">
             <input type=button class="btn btn-sm btn-primary"
              value="검색" v-on:click="find()">
	           </div>
	           <div class="box2">
	           <input type="checkbox" name="fs" value="N">가게이름
	           <input type="checkbox" name="fs" value="S">음식종류
	           </div>
         </div>
</div>

	<!-- <div class="row">
		<div>
        <div v-for="vo in find_list">
		    <div class="test1">
		        <img :src="vo.poster" alt="Lights" style="width:200px;height:150px;border-radius: 7px; display:inline-block;" 
		        class="images" v-on:click="food_detail(vo.no)">
		        <div class="caption">
		          <p style="font-size: 15px;">{{vo.title }}</p>
		        </div>
		  </div>
		  </div>
</div>
</div> -->
     <div class="inline">
        <div v-for="vo in find_list">
		    <div class="thumbnail">
		        <img :src="vo.poster" alt="Lights" style="width:235px;height:210px;border-radius: 7px;" 
		        class="images" v-on:click="food_detail(vo.no)">
		          <p style="font-size: 15px;text-align: center">{{vo.title }}</p>
		        </div>
		        </div>
		  </div>
		  <div>
		   <div class="pagee">
		     <span class="btn btn-sm btn-info" v-on:click="prev()">이전</span>
		     {{curpage}} page / {{totalpage}} pages
		     <span class="btn btn-sm btn-success" v-on:click="next()">다음</span>
		   </div>
		  </div>
     
  
		<div class="row4" v-show="isShow">
         <table class="table">
         <tr>
         <td colspan="2"><img :src="detail.poster" alt="Lights" style="width:200px;height:140px;border-radius: 7px;"></td>
         </tr>
         <tr>
             <td width=30%>가게이름</td>
             <td width=70% style="font-style: bold;">{{detail.title}}</td>
           </tr>
           <tr>
             <td width=30%>주소</td>
             <td width=70%>{{detail.address}}</td>
           </tr>
           <tr>
             <td width=30%>전화</td>
             <td width=70%>{{detail.tel}}</td>
           </tr>
           <tr>
             <td width=30%>음식종류</td>
             <td width=70%>{{detail.kind}}</td>
           </tr>
           <tr>
             <td width=30%>영업시간</td>
             <td width=70%>{{detail.time}}</td>
           </tr>
           <tr>
             <td width=30%>메뉴</td>
             <td width=70%>{{detail.menu}}</td>
           </tr>
         </table>
      </div>
     
       </div>
	<script>
	new Vue({
	el:'.container',
	data:{
		find_list:[],
		ss:'강남',
		curpage:1,
		totalpage:0,
		detail:{},
		image:'',
		isShow:false
	},
	// 시작과 동시에 처리 => window.onload
	// find_vue.do?page=1&ss=강남
    // data:{"page":1,"ss":'강남'}
	mounted:function(){
		let _this=this;
		axios.get("http://localhost:8080/web/food/find_vue.do",{
			params:{
				page:_this.curpage,
    			ss:_this.ss
			}
			// success:function(res) => JSON 
			// 자바  != 자바스크립트
			// 자바 => List => [{},{},{}...]
			// 자바 => VO   => {} (JSON) 자바스크립트 객체 표현법 
			// Rest / JSONP
		}).then(function(res){
			_this.find_list=res.data;
			_this.curpage=res.data[0].curpage;
			_this.totalpage=res.data[0].totalpage;
		})
	},
	methods:{
		find:function(){
			this.curpage=1;
			axios.get("http://localhost:8080/web/food/find_vue.do",{
    			params:{
    				page:this.curpage,
        			ss:this.ss
    			}
    			// success:function(res) => JSON 
    			// 자바  != 자바스크립트
    			// 자바 => List => [{},{},{}...]
    			// 자바 => VO   => {} (JSON) 자바스크립트 객체 표현법 
    			// Rest / JSONP
    		}).then(res=>{
    			this.find_list=res.data;
    			this.curpage=res.data[0].curpage;
    			this.totalpage=res.data[0].totalpage;
    		})
		},
		prev:function(){
			this.curpage=this.curpage>1?this.curpage-1:this.curpage;
			axios.get("http://localhost:8080/web/food/find_vue.do",{
    			params:{
    				page:this.curpage,
        			ss:this.ss
    			}
    			// success:function(res) => JSON 
    			// 자바  != 자바스크립트
    			// 자바 => List => [{},{},{}...]
    			// 자바 => VO   => {} (JSON) 자바스크립트 객체 표현법 
    			// Rest / JSONP
    		}).then(res=>{
    			this.find_list=res.data;
    			this.curpage=res.data[0].curpage;
    			this.totalpage=res.data[0].totalpage;
    		})
		},
		next:function(){
			this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
			axios.get("http://localhost:8080/web/food/find_vue.do",{
    			params:{
    				page:this.curpage,
        			ss:this.ss
    			}
    			// success:function(res) => JSON 
    			// 자바  != 자바스크립트
    			// 자바 => List => [{},{},{}...]
    			// 자바 => VO   => {} (JSON) 자바스크립트 객체 표현법 
    			// Rest / JSONP
			}).then(res=>{
    			this.find_list=res.data;
    			this.curpage=res.data[0].curpage;
    			this.totalpage=res.data[0].totalpage;
			})
		},
		// ?no=1
		food_detail:function(no){
			//alert("no="+no)
			axios.get("http://localhost:8080/web/food/detail_vue.do",{
    			params:{
    				no:no
    			}
    		}).then(res=>{
    			this.detail=res.data;
    			this.isShow=true;
    		})
		}
	}
})
</script>
</body>
</html>