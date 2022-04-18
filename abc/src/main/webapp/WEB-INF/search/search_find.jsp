 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
body{
/* background-color: #bdd5f2; */
}

.search-out{
width: 100%;
height: 236px;
top: 50px;
text-align: center;
background-color: #84b1f3; 
}
.search-result{
width: 820px;
height: 90px;
background: #ffffff;
left:32%;
position: absolute;
margin-top: 3%;
border-radius:40px;

}
.search-ss{
position: absolute;
width: 500px;
height: 35px;
left: 135px;
top: 27px;

font-family: 'Roboto';
font-style: normal;
font-weight: 500;
font-size: 30px;
line-height: 117.69%;

display: flex;
align-items: flex-end;

color: #27243A;

}
.search-ss2{
position: absolute;
width: 500px;
height: 35px;
left: 56.5%;
top: 27px;

font-family: 'Roboto';
font-style: normal;
font-weight: 500;
font-size: 30px;
line-height: 117.69%;

display: flex;
align-items: flex-end;

color: #27243A;

}
.search-h{


font-family: 'Roboto';
font-style: normal;
font-weight: 600;
font-size: 35px;
line-height: 108.69%;
/* or 42px */

display: flex;
align-items: flex-end;

color: #f57243;
left: 960px;
top: 117px;
position: relative;

}

.search-hh{
position: absolute;
width: 500px;
height: 300px;
}

.search-p{
font-family: 'Roboto';
font-style: normal;
font-weight: 500;
font-size: 32px;
line-height: 108.69%;
/* or 42px */

display: flex;
align-items: flex-end;

color: #000000;
left: 810px;
top: 130px;
position: absolute;
width: 146px;
}

.search-p2{
font-family: 'Roboto';
font-style: normal;
font-weight: 500;
font-size: 32px;
line-height: 108.69%;
/* or 42px */

display: flex;
align-items: flex-end;

color: #000000;
left: 1095px;
top: 130px;
position: absolute;
width: 324px;
}
.search-img{

width: 300px;
height: 200px;


background: #C4C4C4;
border-radius: 10px;
}
.search-img2{

width: 300px;
height: 200px;


background: #C4C4C4;
border-radius: 10px;
}
.location-container{
position: absolute;
width: 1382px;
height: 1765px;
left: 19.5%;
margin-top:0%;

background: #FFFFFF;
box-shadow: 0px 0px 50px rgba(0, 0, 0, 0);
border-radius: 10px;
}
.location-container2{
position: absolute;
width: 1167px;
height: 1650px;
left: 100px;
top: 25px;

background: #ffffff;
}
.search-input{

width: 502px;
height: 46px;


border: 1.45px solid #fdbe51;
box-sizing: border-box;
border-radius: 10px;
}
.search-button{

width: 163px;
height: 46px;


background: #fdbe51;
border: 1px solid #fdbe51;
box-sizing: border-box;
border-radius: 10px;
}
.heading{
position: absolute;
width: 700px;
height: 50px;
left: 22%;
top: 0px;

}
.location-box{
position: absolute;
width: 385px;
height: 400px;
left: 5%;
top: 100px;

display: inline-block;

}

.search-ul{

margin-top: 1%;
/* text-align: center; */
}
.search-li{
display: inline-block;
margin-right: 40px;
margin-left: 45px;
}
.search-lis{
display: inline-block;
margin-right: 40px;
margin-bottom: 25px;

}

.search-li-name{
width: 300px;
height: 23px;


font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;

line-height: 39px;

color: #27243A;
text-align: center;
}

.search-li-p{
width: 300px;
height: 23px;


font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 18px;
line-height: 23px;

color: #27243A;
text-align: center;
}

.search-li-button{

width: 140px;
height: 40px;

background: #fdbe51;
border: 1px solid #fdbe51;
box-sizing: border-box;
border-radius: 10px;
margin-top: -8px;
margin-bottom: 25px;
margin-left: 80px;
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
left: 524px;
width: 400px;
top: 1666px;
}
.page-li{
display: inline-block;
}
.page-a{
color: #359164;
text-decoration: none;
font-size: 27px;
font-weight: 600;

left: 48.5%;
position: absolute;
}
</style>

</head>
<body>
<div class="search-hh"><p class="search-p">다음은  "</p><h1 class="search-h">${ss}</h1><p class="search-p2">"  검색 결과 입니다.</p></div>
<div class="search-out">
<img  src="../resources/img/검색 배너.png" class="search-banner">
</div>
<div class="location-container">
  <main class="location-container2"> 
    
           
           <ul class="search-ul">
           	
           	<c:forEach var="vo" items="${list }" varStatus="s">
           	<c:choose>
              <c:when test="${s.index%3==0}">
              
		         
		           <li class="search-li">
		           
			           <img src="${vo.cl_poster }" class="search-img">
			           <p class="search-li-name">${vo.cl_name}</p>
			            <p class="search-li-p">${vo.cl_content}</p>
			            
			            <a href="/puzzle/${vo.cl_no }/main.do">
			            <button class="search-li-button" >동아리 가입하기</button>
			            </a>
		            
		           </li>
		         </c:when>
		         <c:otherwise>
		         
			   	<li class="search-lis" >
			   	
			   		<img src="${vo.cl_poster }" class="search-img2">
		             <p class="search-li-name">${vo.cl_name}</p>
		             <p class="search-li-p">${vo.cl_content}</p>
		             
			            <a href="/puzzle/${vo.cl_no }/main.do">
			            <button class="search-li-button" >동아리 가입하기</button>
			            </a>
			            
		             
		             
	            </li>
		         </c:otherwise>
		         </c:choose>
		         
		       </c:forEach>
           
</ul>
          
        
  <ul class="pagination">
         <c:if test="${startPage>1 }">
          <li><a class="page-a" href="search_find.do?page=${startPage-1 }&ss=${ss}">&lt;</a></li>
         </c:if>
         <c:forEach var="i" begin="${startPage }" end="${endPage }">
           <c:if test="${i==curpage }">
             <c:set var="style" value="class=active"/>
           </c:if>
           <c:if test="${i!=curpage }">
             <c:set var="style" value=""/>
           </c:if>
           <li ${style }><a class="page-a" href="search_find.do?page=${i }&ss=${ss}">${i }</a></li>
         </c:forEach>
         <c:if test="${endPage<totalpage }">
          <li><a class="page-a" href="search_find.do?page=${endPage+1 }&ss=${ss}">&gt;</a></li>
         </c:if>
		</ul>
        
      
      
       
      
      
    
    
    <div class="clear"></div>
  </main>
       
</div>


  
</body>
</html> 

