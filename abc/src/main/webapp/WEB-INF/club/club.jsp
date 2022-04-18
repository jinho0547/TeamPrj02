<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">

.join-container{
   position: absolute;
width: 860px;
height: 800px;
left: 540px;
top: 78px;

background: #FFFFFF;
border-radius: 10px;
border: 8px solid #fdbe51;
}

.pluspuzzle-form{
position: absolute;
width: 696px;
height: 610px;
left: 77px;
top: 150px;
}

.join-id{
position: absolute;
width: 200px;
height: 24px;
left: 40px;
top: 10px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.join-input{
position: absolute;
width: 465px;
height: 40px;
left: 3px;
top: 45px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}



.join-pw{
position: absolute;
width: 100px;
height: 24px;
left: 390px;
top: 7px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.join-input2{
position: absolute;
width: 280px;
height: 40px;
left: 390px;
top: 48px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.club-select{
position: absolute;
width: 280px;
height: 40px;
top: 5px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.cl_name{
position: absolute;
width: 200px;
height: 40px;
left: 40px;
top: 127px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
}

.cl_name-input{
position: absolute;
width: 490px;
height: 40px;
left: 180px;
top: 120px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-pw2{
position: absolute;
width: 200px;
height: 24px;
left: 3px;
top: 179px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;

display: flex;
align-items: flex-end;

color: #27243A;
}

.join-input3{
position: absolute;
width: 490px;
height: 40px;
left: 180px;
top: 190px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-name{
position: absolute;
width: 200px;
height: 24px;
left: 40px;
top: 259px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;

display: flex;
align-items: flex-end;

color: #27243A;
}

.join-input4{
position: absolute;
width: 696px;
height: 40px;
left: 3px;
top: 320px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-birth{
position: absolute;
width: 200px;
height: 24px;
left: 40px;
top: 455px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;

display: flex;
align-items: flex-end;

color: #27243A;
}

.join-birth2{
position: absolute;
width: 40px;
height: 24px;
left: 629px;
top: 455px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;

display: flex;
align-items: flex-end;

color: #27243A;
}

.join-input6-1{
position: absolute;
width: 455px;
height: 40px;
left: 140px;
top: 450px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-input7{
position: absolute;
width: 465px;
height: 40px;
left: 3px;
top: 545px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}


.join-phone{
position: absolute;
width: 465px;
height: 40px;
left: 3px;
top: 590px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;

display: flex;
align-items: flex-end;

color: #27243A;
}



.join{
position: absolute;
width: 300px;
height: 40px;
left: 40px;
top: 545px;

background: #fdbe51;
border-radius: 5px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
display: center;
align-items: flex-end;

color: #FFFFFF;
border: 0.75px solid #EAEAEA;
}

.cancel{
position: absolute;
width: 300px;
height: 40px;
left: 372px;
top: 545px;

background: #fdbe51;
border-radius: 5px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;

display: center;
align-items: flex-end;

color: #FFFFFF;
border: 0.75px solid #EAEAEA;
}

.pp-select{
	position: absolute;
    left: 40px;
    top: 45px;
    
}

.pp-file{
position: absolute;
width: 200px;
height: 40px;
left: 40px;
top: 196px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
}

.pp-textarea{

position: absolute;
width: 630px;
height: 110px;
left: 40px;
top: 310px;
resize:none;
}
.club-image{
position: absolute;
width: 334px;
height: 112px;
left: 270px;
top: 16px;

}

.join-background{
position: absolute;
width: 100%;
height: 100%;
background-color: #fff4e6;

}

.join-background-a{
position: absolute;
width: 100%;
height: 100%;

}



</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#joinBtn').click(function(){
		// 회원 가입 처리 (유효성 검사) => NOT NULL , PRIMARY KEY , UNIQUE
		// id 
		let category=$('#category').val();
		if(category.trim()=="")
		{
			alert("카테고리를 선택하세요!!")
			return;
		}
		// pwd
		let loc=$('#loc').val()
		if(loc.trim()=="")
		{
			$('#loc').focus();
			return;
		}
		let poster=$('#poster').val()
		if(poster.trim()=="") // 확인용
		{
		    $('#poster').focus();
		    alert("테마를 선택하세요!!")
		    return;
		}
		
		// name
		let name=$('#name').val()
		if(name.trim()=="")
		{
			$('#name').focus();
			return;
		}
		// birthday
		let content=$('#content').val()
		if(content.trim()=="")
		{
			alert("동아리에 대한 간단한 소개를 입력하세요!!") //
			return;
		}
		
		
		 $('#join_frm').submit()
		alert("동아리가 생성되었습니다!!") 
		return; 
	})
})
</script>
</head>
<body>
<img class="join-background">
 <img class="join-background-a" ></div>
</div>
<div class="join-container">

<img src="../resources/img/puzzlelogo.png" class="club-image" >
	<div class="pluspuzzle-form" > 
     
	         <p class="join-id" width=50% >동아리 카테고리</p>
	         <div class="pp-select">
	         
	         <select class="club-select" aria-label="Default select example" v-model="cl_category" name=category id=category>
	         	<option value="" checked:true>관심사를 선택해 주세요</option>
  				<option value="요리/제조">요리/제조</option>
  				<option value="아웃도어/여행">아웃도어/여행</option>
  				<option value="운동/스포츠">운동/스포츠</option>
  				<option value="인문학/책/글">인문학/책/글</option>
  				<option value="업무/직무">업무/직무</option>
  				<option value="외국/언어">외국/언어</option>
  				<option value="문화/공연/축제">문화/공연/축제</option>
  				<option value="음악/악기">음악/악기</option>
  				<option value="공예/만들기">공예/만들기</option>
  				<option value="댄스/무용">댄스/무용</option>
  				<option value="봉사활동">봉사활동</option>
  				<option value="사교/인맥">사교/인맥</option>
  				<option value="차/오토바이">차/오토바이</option>
  				<option value="사진/영상">사진/영상</option>
  				<option value="게임/오락">게임/오락</option>
  				<option value="반려동물">반려동물</option>
			</select> 
			</div>
			
	         <p class="join-pw" width=30%>지역</p>
	         <select aria-label="Default select example" class="join-input2"  v-model="cl_loc" name=loc id=loc>
	         <option value="" checked:true>지역을 선택해 주세요</option>
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
	         
	         <p class="pp-file" width=30%>동아리 테마</p>
	         <select aria-label="Default select example" class="join-input3"  v-model="cl_poster" name=poster id=poster>
	         <option value="" checked:true>테마를 선택해 주세요</option>
  				<option value="https://cdn.pixabay.com/photo/2017/08/08/09/44/food-photography-2610863_960_720.jpg">한식</option>
  				<option value="https://cdn.pixabay.com/photo/2020/02/15/20/38/noodles-4851996_960_720.jpg">양식</option>
  				<option value="https://cdn.pixabay.com/photo/2018/12/04/15/18/chinese-3855823_960_720.jpg">중식</option>
  				<option value="https://cdn.pixabay.com/photo/2016/04/26/03/55/salmon-1353598_960_720.jpg">일식</option>
  				<option value="https://cdn.pixabay.com/photo/2015/09/16/20/10/dough-943245_960_720.jpg">베이킹/제과</option>
  				<option value="https://cdn.pixabay.com/photo/2015/05/27/17/18/wine-786920_960_720.jpg">소믈리에/와인</option>
  				<option value="https://cdn.pixabay.com/photo/2016/11/19/13/53/margarita-1839361_960_720.jpg">주류제조/칵테일</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2019/01/27/22/32/mountains-3959204_960_720.jpg">등산</option>
  				<option value="https://cdn.pixabay.com/photo/2017/04/18/04/35/damyang-2237701_960_720.jpg">산책/트래킹</option>
  				<option value="https://cdn.pixabay.com/photo/2017/08/16/10/44/teepee-2647263_960_720.jpg">캠핑/백패킹</option>
  				<option value="https://cdn.pixabay.com/photo/2017/06/20/12/07/castle-2422860_960_720.jpg">국내여행</option>
  				<option value="https://cdn.pixabay.com/photo/2016/01/09/18/27/journey-1130732_960_720.jpg">해외여행</option>
  				<option value="https://cdn.pixabay.com/photo/2016/11/08/05/11/children-1807511_960_720.jpg">낚시</option>
  				<option value="https://cdn.pixabay.com/photo/2017/08/31/14/51/parachutes-2700972_960_720.jpg">패러글라이딩</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2022/01/19/19/41/san-francisco-6950837_960_720.jpg">자전거</option>
  				<option value="https://cdn.pixabay.com/photo/2016/05/31/23/21/badminton-1428047_960_720.jpg">배드민턴</option>
  				<option value="https://cdn.pixabay.com/photo/2015/01/11/21/25/bowling-596766_960_720.jpg">볼링</option>
  				<option value="https://cdn.pixabay.com/photo/2020/11/27/18/59/tennis-5782695_960_720.jpg">테니스</option>
  				<option value="https://cdn.pixabay.com/photo/2014/10/22/18/04/man-498473_640.jpg">스키</option>
  				<option value="https://cdn.pixabay.com/photo/2020/02/25/11/46/snowboarding-4878696_640.jpg">보드</option>
  				<option value="https://cdn.pixabay.com/photo/2015/05/28/10/12/golf-787826_960_720.jpg">골프</option>
  				<option value="https://cdn.pixabay.com/photo/2019/05/11/20/44/free-climbing-4196577_960_720.jpg">클라이밍</option>
  				<option value="https://cdn.pixabay.com/photo/2017/01/10/11/44/lose-weight-1968908_960_720.jpg">다이어트</option>
  				<option value="https://cdn.pixabay.com/photo/2017/08/07/14/02/man-2604149_960_720.jpg">헬스</option>
  				<option value="https://cdn.pixabay.com/photo/2017/03/13/20/41/tyre-flipping-2141109_960_720.jpg">크로스핏</option>
  				<option value="https://cdn.pixabay.com/photo/2017/11/18/05/02/yoga-2959226_960_720.jpg">요가/필라테스</option>
  				<option value="https://cdn.pixabay.com/photo/2019/03/07/16/40/table-tennis-4040584_960_720.jpg">탁구</option>
  				<option value="https://cdn.pixabay.com/photo/2017/09/28/13/35/billiards-2795546_960_720.jpg">당구/포켓볼</option>
  				<option value="https://cdn.pixabay.com/photo/2017/08/06/12/52/woman-2592247_960_720.jpg">러닝</option>
  				<option value="https://cdn.pixabay.com/photo/2015/10/03/21/58/sport-970443_960_720.jpg">마라톤</option>
  				<option value="https://cdn.pixabay.com/photo/2013/02/09/04/23/swimmers-79592_960_720.jpg">수영</option>
  				<option value="https://cdn.pixabay.com/photo/2013/02/09/04/33/scuba-diving-79606_960_720.jpg">스쿠버다이빙</option>
  				<option value="https://cdn.pixabay.com/photo/2017/04/08/10/23/surfing-2212948_960_720.jpg">서핑</option>
  				<option value="https://cdn.pixabay.com/photo/2019/06/06/18/52/sport-4256624_960_720.jpg">웨이크보드</option>
  				<option value="https://cdn.pixabay.com/photo/2015/01/26/22/40/child-613199_960_720.jpg">축구</option>
  				<option value="https://cdn.pixabay.com/photo/2016/11/18/22/10/man-1837119_960_720.jpg">농구</option>
  				<option value="https://cdn.pixabay.com/photo/2016/08/02/15/47/baseball-field-1563858_960_720.jpg">야구</option>
  				<option value="https://cdn.pixabay.com/photo/2016/08/24/19/54/volleyball-1617874_960_720.jpg">배구</option>
  				<option value="https://cdn.pixabay.com/photo/2021/03/25/14/00/horse-6123173_960_720.jpg">승마</option>
  				<option value="https://cdn.pixabay.com/photo/2016/11/19/13/49/fencing-1839325_960_720.jpg">펜싱</option>
  				<option value="https://cdn.pixabay.com/photo/2019/07/15/12/27/boxing-4339271_960_720.jpg">복싱</option>
  				<option value="https://cdn.pixabay.com/photo/2016/11/28/22/56/taekwondo-1866283_960_720.jpg">태권도</option>
  				<option value="https://cdn.pixabay.com/photo/2017/02/09/16/48/brazilian-jiu-jitsu-2052829_960_720.jpg">유도/주짓수</option>
  				<option value="https://cdn.pixabay.com/photo/2017/12/22/17/19/enlogar-3033957_960_720.jpg">무술</option>
  				<option value="https://cdn.pixabay.com/photo/2020/05/26/07/43/skateboard-5221914_960_720.jpg">스케이트</option>
  				<option value="https://cdn.pixabay.com/photo/2022/04/04/12/37/skating-7111146_960_720.jpg">인라인</option>
  				<option value="https://cdn.pixabay.com/photo/2015/05/24/22/35/archery-782503_960_720.jpg">양궁</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2016/02/16/21/07/books-1204029_960_720.jpg">책/독서</option>
  				<option value="https://cdn.pixabay.com/photo/2017/11/26/15/16/smiley-2979107_960_720.jpg">심리학</option>
  				<option value="https://cdn.pixabay.com/photo/2015/05/07/15/48/bustos-756620_960_720.jpg">철학</option>
  				<option value="https://cdn.pixabay.com/photo/2017/08/30/07/56/money-2696228_960_720.jpg">시사/경제</option>
  				<option value="https://cdn.pixabay.com/photo/2015/02/03/23/41/paper-623167_960_720.jpg">작문/글쓰기</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2016/04/20/08/21/entrepreneur-1340649_960_720.jpg">금융업</option>
  				<option value="https://cdn.pixabay.com/photo/2014/07/06/13/55/calculator-385506_960_720.jpg">세무/회계</option>
  				<option value="https://cdn.pixabay.com/photo/2015/04/12/16/33/hammer-719066_960_720.jpg">법률/법무/법조계</option>
  				<option value="https://cdn.pixabay.com/photo/2021/08/10/10/06/pinwheels-6535595_960_720.jpg">에너지/화학</option>
  				<option value="https://cdn.pixabay.com/photo/2018/05/25/23/48/luxury-yacht-3430348_960_720.jpg">조선/중공업</option>
  				<option value="https://cdn.pixabay.com/photo/2016/11/19/20/17/catwalk-1840941_960_720.jpg">패견/의료/뷰티</option>
  				<option value="https://cdn.pixabay.com/photo/2016/06/24/10/47/house-1477041_960_720.jpg">건축/건설/인테리어</option>
  				<option value="https://cdn.pixabay.com/photo/2021/02/03/00/10/receptionists-5975962_960_720.jpg">여행/호텔/레저</option>
  				<option value="https://cdn.pixabay.com/photo/2021/10/07/15/23/real-estate-6688945_960_720.jpg">부동산/중개업</option>
  				<option value="https://cdn.pixabay.com/photo/2016/11/30/20/58/programming-1873854_960_720.png">프로그래머/개발직</option>
  				<option value="https://cdn.pixabay.com/photo/2019/02/06/16/32/architect-3979490_960_720.jpg">설계/건축가</option>
  				<option value="https://cdn.pixabay.com/photo/2020/10/23/14/55/woman-5679001_960_720.jpg">인턴</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2018/07/08/08/45/abc-3523453_960_720.jpg">영어</option>
  				<option value="https://cdn.pixabay.com/photo/2015/09/24/17/16/words-955946_960_720.jpg">일본어</option>
  				<option value="https://cdn.pixabay.com/photo/2016/03/04/22/54/panda-1236875_960_720.jpg">중국어</option>
  				<option value="https://cdn.pixabay.com/photo/2017/01/12/19/09/eiffel-tower-1975412_960_720.jpg">프랑스어</option>
  				<option value="https://cdn.pixabay.com/photo/2020/05/12/18/29/city-5164368_960_720.jpg">스페인어</option>
  				<option value="https://cdn.pixabay.com/photo/2015/11/16/18/56/building-1046188_960_720.jpg">러시아어</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2018/02/12/22/37/mask-3149305_960_720.jpg">뮤지컬/오페라</option>
  				<option value="https://cdn.pixabay.com/photo/2019/07/02/11/18/crowd-4312230_960_720.jpg">공연/연극</option>
  				<option value="https://cdn.pixabay.com/photo/2015/12/09/17/12/popcorn-1085072_960_720.jpg">영화</option>
  				<option value="https://cdn.pixabay.com/photo/2016/03/27/16/23/woman-1283009_960_720.jpg">전시회</option>
  				<option value="https://cdn.pixabay.com/photo/2014/11/27/08/13/roof-tile-547266_960_720.jpg">고궁/문화재탐방</option>
  				<option value="https://cdn.pixabay.com/photo/2014/09/07/17/41/color-run-festivals-438124_960_720.jpg">파티/페스티벌</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2016/01/10/21/05/mic-1132528_960_720.jpg">노래/보컬</option>
  				<option value="https://cdn.pixabay.com/photo/2015/05/07/11/02/guitar-756326_960_720.jpg">기타/베이스</option>
  				<option value="https://cdn.pixabay.com/photo/2015/10/15/18/44/music-989909_960_720.jpg">우쿨렐레</option>
  				<option value="https://cdn.pixabay.com/photo/2017/08/07/03/53/drums-2599508_960_720.jpg">드럼</option>
  				<option value="https://cdn.pixabay.com/photo/2020/06/29/19/26/piano-5353974_960_720.jpg">피아노</option>
  				<option value="https://cdn.pixabay.com/photo/2016/11/19/10/01/woman-1838412_960_720.jpg">바이올린</option>
  				<option value="https://cdn.pixabay.com/photo/2019/04/21/08/51/ocarina-4143664_960_720.jpg">오카리나</option>
  				<option value="https://cdn.pixabay.com/photo/2015/01/13/13/20/music-598176_960_720.jpg">밴드/합주</option>
  				<option value="https://cdn.pixabay.com/photo/2020/10/26/18/04/girl-5688103_960_720.jpg">랩/힙합/DJ</option>
  				<option value="https://cdn.pixabay.com/photo/2014/11/26/15/20/saxophone-546303_960_720.jpg">클래식/재즈</option>
  				<option value="https://cdn.pixabay.com/photo/2017/09/24/16/13/jing-2782287_960_720.jpg">국악/사물놀이</option>
  				<option value="https://cdn.pixabay.com/photo/2020/11/27/07/32/conductor-5781097_960_720.jpg">찬양/CCM</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2016/11/23/00/37/art-1851483_960_720.jpg">미술/그림</option>
  				<option value="https://cdn.pixabay.com/photo/2018/06/05/09/01/letter-3455018_960_720.jpg">캘리그라피</option>
  				<option value="https://cdn.pixabay.com/photo/2018/03/21/21/35/food-3248318_960_720.jpg">천연비누/화장품</option>
  				<option value="https://cdn.pixabay.com/photo/2018/11/01/06/33/leather-craft-3787282_960_720.jpg">가죽공예</option>
  				<option value="https://cdn.pixabay.com/photo/2016/11/22/18/56/arts-and-crafts-1850025_960_720.jpg">가구/목공예</option>
  				<option value="https://cdn.pixabay.com/photo/2020/06/09/03/08/craft-5276736_960_720.jpg">도자/점토공예</option>
  				<option value="https://cdn.pixabay.com/photo/2016/06/02/03/47/knitting-1430153_960_720.jpg">자수/뜨개질</option>
  				<option value="https://cdn.pixabay.com/photo/2018/04/17/02/28/lego-3326391_960_720.jpg">프라모델</option>
  				<option value="https://cdn.pixabay.com/photo/2016/10/22/20/55/makeup-brushes-1761648_960_720.jpg">메이크업/네일</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2014/08/08/21/30/b-boying-413726_960_720.jpg">방송/힙합</option>
  				<option value="https://cdn.pixabay.com/photo/2018/01/01/23/38/ballerina-3055155_960_720.jpg">발레</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2015/10/22/17/45/leaf-1001679_960_720.jpg">환경봉사</option>
  				<option value="https://cdn.pixabay.com/photo/2021/11/06/00/32/volunteer-6772196_960_720.jpg">사회봉사</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2014/02/26/09/03/fusion-korean-274925_960_720.jpg">맛집/미식회</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2021/12/13/09/46/moto-bikes-6867911_960_720.jpg">바이크</option>
  				<option value="https://cdn.pixabay.com/photo/2015/07/11/23/13/mercedes-benz-841465_960_720.jpg">외제차</option>
  				<option value="https://cdn.pixabay.com/photo/2015/03/25/05/50/traffic-jam-688566_960_720.jpg">국내차</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2016/03/05/22/53/camera-1239384_960_720.jpg">DSLR</option>
  				<option value="https://cdn.pixabay.com/photo/2017/07/27/12/47/camera-2545232_960_720.jpg">필름카메라</option>
  				<option value="https://cdn.pixabay.com/photo/2016/11/18/17/47/iphone-1836071_960_720.jpg">영상제작</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2013/04/12/06/03/darts-102919_960_720.jpg">다트</option>
  				<option value="https://cdn.pixabay.com/photo/2014/04/05/11/40/chess-316658_960_720.jpg">보드게임</option>
  				<option value="https://cdn.pixabay.com/photo/2019/05/16/11/01/gaming-4206919_960_720.jpg">온라인게임</option>
  				<option value="https://cdn.pixabay.com/photo/2014/09/07/10/30/oracle-cards-437688_960_720.jpg">타로카드</option>
  				<option value="https://cdn.pixabay.com/photo/2017/02/08/17/24/fantasy-2049567_960_720.jpg">마술</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2019/07/30/05/53/dog-4372036_960_720.jpg">강아지</option>
  				<option value="https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_960_720.jpg">고양이</option>
  				<option value="https://cdn.pixabay.com/photo/2014/06/30/08/02/zitronenfalter-fish-380037_960_720.jpg">물고기</option>
  				<option value="https://cdn.pixabay.com/photo/2020/01/13/19/43/lizard-4763351_960_720.jpg">파충류</option>
  				<option value="https://cdn.pixabay.com/photo/2021/12/12/22/17/red-squirrel-6867105_960_720.jpg">설치류/중치류</option>
  				
  				<option value="https://cdn.pixabay.com/photo/2020/12/25/11/19/candle-5859094_960_720.jpg">따뜻한 테마</option>
  				<option value="https://cdn.pixabay.com/photo/2021/12/02/18/46/soda-water-6841140_960_720.jpg">차가운 테마</option>
  				<option value="https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547_960_720.jpg">평온한 테마</option>
  				<option value="https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg">어두운/우주 테마</option>
  				<option value="https://cdn.pixabay.com/photo/2016/03/27/07/32/clouds-1282314_960_720.jpg">밝은 테마</option>
  				
	         </select>
	         
	         
	         <p class="cl_name" width=30%>동아리 이름</p>
	         <input type=text size=15 class="cl_name-input" width=70% v-model="cl_name" name=name id=name>
	         
	         <p class="join-name" width=30%>모임 설명</p>
	         <textarea rows="10" cols="55" class="pp-textarea" v-model="cl_content" name=content id=content></textarea>
	         
	         <p class="join-birth" width=30%>정원　총</p>
	         <p class="join-birth2" >명</p> 
	         <input type=text name=u_birth1 id=u_birth1 size=15 class="join-input6-1" width=70% v-model="cl_head">
	         
	         
	         <input type=button value=동아리만들기 class="join" id="joinBtn" v-on:click="makeclub()">
	         <button class="cancel" id="joinBtn" v-on:click="cancel()">취소</button>
	         
      </div> 
</div>

<script>
new Vue({
	el:'.pluspuzzle-form',
	data:{
		cl_category:'',
		cl_loc:'',
		cl_name:'',
		cl_content:'',
		cl_head:30,
		cl_poster:''
	},
	methods:{
		makeclub:function(){
			if(this.cl_category==''){
				alert('카테고리를 입력해주세요!')
				this.focus();
			}
			if(this.cl_loc==''){
				alert('지역을 입력해 주세요!')
				this.focus();
			}
			if(this.cl_name==''){
				alert('동아리 이름을 입력해주세요!')
				this.focus();
			}
			if(this.cl_content==''){
				alert('간단한 소개 부탁드려요~!')
				this.focus();
			}
			if(this.cl_poster==''){
				alert('동아리에 맞는 테마를 설정해주세요!')
				this.focus();
			}
			axios.get('/club/club_Insert.do',{
				params:{
					cl_category:this.cl_category,
					cl_loc:this.cl_loc,
					cl_name:this.cl_name,
					cl_content:this.cl_content,
					cl_head:this.cl_head,
					cl_poster:this.cl_poster
					
				}
			}).then(res=>{
				location.href="../main/main.do"
			})
		},
		cancel:function(){
			history.back();
		}
	}
})
</script>
</body>
</html>