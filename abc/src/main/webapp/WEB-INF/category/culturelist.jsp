<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.list-out{
width: 100%;
height: 236px;
top: 50px;
text-align: center;
background-color: #84b1f3; 
}
.list-first{
display: inline-block;
margin-right: 40px;
margin-bottom: 30px;
text-align: center;

}
.list-second{
display: inline-block;
margin-right: 40px;
margin-bottom: 30px;
text-align: center;

}

.list-img{
width: 300px;
height: 200px;
border-radius: 10px;

}

.list-container2{
width: 1600px;
left: 9%;
top: 33%;
position: absolute;
}

.content{
position: absolute;
top: -114px;
left: 130px;
}


.pagination{

width: 1000px;
height: 32px;

justify-content: center;

font-family: Roboto;
font-style: normal;

font-size: 17px;
line-height: 32px;

color: #000000;
}

.page-button{
width: 50px;
height: 64px;


background: #FFFFFF;
box-shadow: 0px 0px 50px rgba(0, 0, 0, 0.15);
border-radius: 10px;
}
.page-ul{
position: absolute;
left: 46%;
width: 400px;
height:113px;
top: 155%;

}
.page-li{
display: inline-block;
}
.list-name{
font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;

line-height: 39px;

color: #27243A;
margin-bottom: 4px;
}

.list-ul{
margin-top: 10%;

}

.list-content{
margin-bottom: 1px;
}

.list-li-button{
width: 140px;
height: 40px;

background: #63bc8d;
border: 1px solid #63bc8d;
box-sizing: border-box;
border-radius: 10px;
}
.list-li-name{

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 18px;
line-height: 117.69%;
display: center;
align-items: flex-end;
margin: 2%;

color: #FFFFFF;


}



</style>
</head>
<body>
<div class="list-out">
<img  src="../resources/img/cooklist-banner.png" class="list-banner">
</div>

<div class="list-container">
  <main class="list-container2"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="content"> 
      <!-- ################################################################################################ -->
      <div id="gallery">
        <figure>
          <header class="heading">
              <input type=text size=20 class="input-sm"  v-model="fd" :value="fd" style="display:none">
              <input type=button value="검색" class="btn btn-sm btn-danger" v-on:click="find()" style="display:none">
          </header>
          <ul class="list-ul">
            
            <li class="list-first" v-for="(vo,index) in recipe_list" v-if="index%3==0"><img :src="vo.poster" :title="vo.title" class="list-img">
            	<p class="list-name">{{vo.title}}</p>
	            <p>{{vo.content}}</p>
	            <a v-on:click="link(vo.no)">
	           <button class="list-li-button"><p class="list-li-name">퍼즐 참가하기</p></button>
	           </a>
            </li>
            <li class="list-second" v-else><img :src="vo.poster" :title="vo.title" class="list-img">
            	<p class="list-name">{{vo.title}}</p>
	            <p>{{vo.content}}</p>
	            <a v-on:click="link(vo.no)">
	            <button class="list-li-button"><p class="list-li-name">퍼즐 참가하기</p></button>
	            </a>
            </li>

          </ul>
          
        </figure>
      </div>
      
    </div>
    
    <div class="clear"></div>
  </main>
       <nav class="pagination">
        <!-- class="current" -->
        <ul class="page-ul">
          <li class="page-li"><button v-on:click="prev()" class="page-button">이전</button></li>
          <li class="page-li">{{curpage}} page / {{totalpage}} pages</li>
          <li class="page-li"><button v-on:click="next()" class="page-button">다음</button></li>
        </ul>
       </nav>

</div>

		
		
		
  <script>
    new Vue({
    	el:'.list-container',
    	data:{
    		recipe_list:[],
    		curpage:1,
    		totalpage:0,
    		fd:'문화'
    	},
    	mounted:function(){
    		this.recipeData();
    	},
    	methods:{
    		recipeData:function(){
    			let _this=this;
    			axios.get("http://localhost:8080/web/search/search_find_vue.do",{
    				params:{
    					page:_this.curpage,
    					fd:_this.fd
    				}
    			// then(res=>{})
    			}).then(function(res){
    				console.log(res.data)
    				_this.recipe_list=res.data;
    				_this.curpage=res.data[0].curpage;
    				_this.totalpage=res.data[0].totalpage;
    			})
    		},
    		prev:function(){
    			this.curpage=this.curpage>1?this.curpage-1:this.curpage;
    			this.recipeData();
    		},
    		next:function(){
    			this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
    			this.recipeData();
    		},
    		find:function(){
    			this.curpage=1;
    			this.recipeData();
    		},
    		link:function(no){
    			this.no=no;
    			location.href="/puzzle/"+no+"/main.do";
    		}
    	}
    	
    	
    })
    
    
  </script>
</body>
</html>