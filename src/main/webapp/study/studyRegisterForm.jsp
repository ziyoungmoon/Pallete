<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<script>
function studyCreate() {
	form.submit();
}

</script>
<head>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Abhaya+Libre+SemiBold&display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Paprika&display=swap" rel="stylesheet" />
</head>

<body>

<form name="form" method="POST" action="<c:url value='/study/Register' />">
<span class="part">분야</span>
<!-- <label class="v118_505">
<div class="back"><input type="checkbox" name="part" value="backend(web)"> Backend(web) </div>
<div class="front"><input type="checkbox" name="part" value="frontend(web)"> Frontend(web) </div>
<div class="ios"><input type="checkbox" name="part" value="ios"> ios </div>
<div class="and"><input type="checkbox" name="part" value="Android"> Android </div>
<div class="game"><input type="checkbox" name="part" value="Game"> Game </div>
<div class="emb"><input type="checkbox" name="part" value="Embedded system"> Embedded system </div>
</label> -->
<div class="qarea">
            <!-- <span class="partq">&#45;&nbsp;개발 분야 또는 관심 분야는 무엇인가요</span> -->
            <div class="partck1">
                <input type="checkbox" name="part" value="frontend">
                Frontend(web)&nbsp;
                <input type="checkbox" name="part" value="backend">     
                Backend(web)&nbsp;
                <input type="checkbox" name="part" value="ios">ios</div>
            <div class="partck2">
                <input type="checkbox" name="part" value="android">
                Android &nbsp;
                <input type="checkbox" name="part" value="game">
                Game &nbsp;
                <input type="checkbox" name="part" value="embedded">
                Embedded system</div>
</div>
<span class="v118_506">지역</span>
<span class="v118_507"><input type="text" name="region"></span>
<span class="v150_388">기한</span>
<span class="v150_389"><input type="date" name="deadline"></span>
<!-- <span class="v159_386">아이디</span>
<span class="v159_387"><input type="text" name="leaderId"></span> -->
<span class="v118_531">모집 인원</span>
<span class="v118_532"><input type="number" name="quota"></span>
<input type="button" value="신청" class="v118_500" onClick="studyCreate()">
<div class="name"></div>

	<div id='palette' class='palette'>Palette</div>
    <form name="form1" method="POST" action="<c:url value='/view/search'/>" >
      <input type='text' id='search' class='search' value='분야를 검색하세요' name='part'>
      <button id = 'button' class='button2' type = 'submit'>검색</button>
   </form> 
   
   <%
         String id = (String)session.getAttribute("id");
         if (id != null) { %>
            <a href="<c:url value='/user/logout'></c:url>"><input type ='button' id='button' class='button' value='LOGOUT'></a>
      <%   } 
         else { %>
            <a href="<c:url value='/user/login'></c:url>"><input type ='button' id='button' class='button' value='  LOGIN'></a>      
      <% } 
   %>
   <br><br><br><br><br><br>
   
   <div style="float:left;"><h1><a href ="<c:url value='/view/main'/>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;홈</a></h1></div>
   <div style="float:left;"><h1><a href ="<c:url value='/study/list'/>"  class = "this" >&nbsp;&nbsp;스터디</a></h1></div>
   <div style="float:left;"><h1><a href ="<c:url value='/mentoring/list'/>">&nbsp;&nbsp;멘토링</a></h1></div>
   <div style="float:left;"><h1>
    <% if (id != null) {%>
            <a href ="<c:url value='/user/list'/>">&nbsp;&nbsp;마이페이지</a>
   <% } else { %>
            <a href ="<c:url value='/user/login'/>">&nbsp;&nbsp;마이페이지</a>
   <% } %>
   </h1></div>
   <br><br><br><br>
   
   <hr style="border: solid 2px #C7F2A4;"> 
   <br><br>
   
</body>
</html> 
<br/><br/> 

<style>* {
  box-sizing: border-box;
}

body {
  font-size: 14px;
}

.qarea {
        width: 880px;
        height: 552px;
        background: url("../images/questionarea.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        margin: 32px;
        opacity: 1;
        position: absolute;       
        top: 750px;
  		left: 888px;
        overflow: hidden;
}
.partck1 {
        width: 400px;
        color: rgba(17, 17, 17, 1);
        position: absolute;
        top: -5px;
        left: 5px;
        font-size: 17px;
}
    
    .partck2 {
        width: 400px;
        color: rgba(17, 17, 17, 1);
        position: absolute;
        top: 15px;
        left: 5px;
        font-size: 17px;
    }
    
.v118_421 {
  width: 100%;
  height: 1200px;
  background: url("../images/v118_421.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: absolute;
  top: 0px;
  left: 0px;
  overflow: hidden;
}
.v118_496 {
  width: 100%;
  height: 1200px;
  background: rgba(255,255,255,1);
  opacity: 1;
  position: absolute;
  top: 0px;
  left: 0px;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  overflow: hidden;
}
.v118_499 {
  width: 228px;
  height: 73px;
  background: rgba(199,242,164,1);
  opacity: 1;
  position: absolute;
  top: 1012px;
  left: 969px;
}
.v118_500 {
  width: 158px;
  color: rgba(255,255,255,1);
  position: absolute;
  top: 1025px;
  left: 1004px;
  font-family: Inter;
  font-weight: Medium;
  font-size: 40px;
  opacity: 1;
  text-align: center;
}
.v118_501 {
  width: 195px;
  color: rgba(182,227,136,1);
  position: absolute;
  top: 577px;
  left: 104px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v118_502 {
  width: 735px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 653px;
  left: 104px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.part {
  width: 194px;
  color: rgba(182,227,136,1);
  position: absolute;
  top: 777px;
  left: 714px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v118_505 {
  width: 136px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 777px;
  left: 892px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v118_506 {
  width: 194px;
  color: rgba(182,227,136,1);
  position: absolute;
  top: 875px;
  left: 714px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v150_388 {
  width: 194px;
  color: rgba(182,227,136,1);
  position: absolute;
  top: 760px;
  left: 104px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v150_389 {
  width: 359px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 760px;
  left: 282px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v118_507 {
  width: 136px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 875px;
  left: 892px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v118_509 {
  width: 74px;
  color: rgba(255,255,255,1);
  position: absolute;
  top: 1025px;
  left: 800px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: center;
}
.v118_510 {
  width: 458px;
  height: 65px;
  background: rgba(250,250,250,0.9300000071525574);
  padding: 8px 8px;
  opacity: 1;
  position: absolute;
  top: 81px;
  left: 490px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
  overflow: hidden;
}
.v118_511 {
  width: 100%;
  background: url("../images/v118_511.png");
  opacity: 1;
  position: absolute;
  top: 199px;
  left: 61px;
  border: 1px solid rgba(77,198,75,1);
}
.name {
  color: #fff;
}
.v118_513 {
  width: 100%;
  height: 284px;
  background: rgba(252,255,178,0.800000011920929);
  opacity: 1;
  position: absolute;
  top: 210px;
  left: 0px;
  overflow: hidden;
}
.v118_514 {
  width: 957px;
  height: 98px;
  background: url("../images/v118_514.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: absolute;
  top: 93px;
  left: 103px;
  overflow: hidden;
}
.v118_515 {
  width: 957px;
  color: rgba(14,14,14,0.699999988079071);
  position: absolute;
  top: 0px;
  left: 0px;
  font-family: Montserrat;
  font-weight: Medium;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v118_516 {
  width: 137px;
  color: rgba(148,148,148,1);
  position: absolute;
  top: 47px;
  left: 103px;
  font-family: Montserrat;
  font-weight: SemiBold;
  font-size: 16px;
  opacity: 1;
  text-align: center;
}
.v118_517 {
  width: 100%;
  height: 113px;
  background: rgba(255,255,255,0.8199999928474426);
  padding: 24px 70px;
  margin: 330px;
  opacity: 1;
  position: absolute;
  top: 9px;
  left: 0px;
  overflow: hidden;
}
.v118_518 {
  width: 154px;
  color: rgba(199,242,164,1);
  position: absolute;
  top: 24px;
  left: 70px;
  font-family: Abhaya Libre SemiBold;
  font-weight: Regular;
  font-size: 70px;
  opacity: 1;
  text-align: left;
}
.v118_519 {
  width: 458px;
  height: 65px;
  background: rgba(250,250,250,0.9300000071525574);
  padding: 8px 8px;
  opacity: 1;
  position: absolute;
  top: 20px;
  left: 491px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
  overflow: hidden;
}
.name {
  color: #fff;
}
.v118_521 {
  width: 414px;
  color: rgba(60,60,67,0.6000000238418579);
  position: absolute;
  top: 21px;
  left: 36px;
  font-family: Paprika;
  font-weight: Regular;
  font-size: 17px;
  opacity: 1;
  text-align: left;
}
.v118_522 {
  width: 109px;
  height: 44px;
  background: rgba(182,227,136,1);
  padding: 12px 24px;
  margin: 8px;
  opacity: 1;
  position: absolute;
  top: 30px;
  left: 1257px;
  overflow: hidden;
}
.v118_523 {
  width: 43px;
  color: rgba(245,245,245,1);
  position: absolute;
  top: 12px;
  left: 24px;
  font-family: Montserrat;
  font-weight: Medium;
  font-size: 16px;
  opacity: 1;
  text-align: left;
}
.v118_524 {
  width: 20px;
  height: 20px;
  background: rgba(255,255,255,1);
  opacity: 1;
  position: absolute;
  top: 12px;
  left: 95px;
  overflow: hidden;
}
.v118_525 {
  width: 9px;
  height: 10px;
  background: rgba(245,245,245,1);
  opacity: 1;
  position: absolute;
  top: 4px;
  left: 6px;
}
.v118_531 {
  width: 195px;
  color: rgba(182,227,136,1);
  position: absolute;
  top: 663px;
  left: 707px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v118_532 {
  width: 735px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 665px;
  left: 920px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v118_533 {
  width: 89px;
  height: 48px;
  background: rgba(217,217,217,0);
  opacity: 1;
  position: absolute;
  top: 664px;
  left: 902px;
  border: 1px solid rgba(0,0,0,1);
  overflow: hidden;
}
.v159_386 {
  width: 194px;
  color: rgba(182,227,136,1);
  position: absolute;
  top: 771px;
  left: 104px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v159_387 {
  width: 359px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 771px;
  left: 282px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}

.palette {
        position: absolute;
        width: 154px;
        height: 65px;
        left: 70px;
        top: 24px;

        font-family: 'Abhaya Libre SemiBold';
        font-style: normal;
        font-weight: 600;
        font-size: 70px;
        line-height: 83px;
        display: flex;
        align-items: center;
        letter-spacing: -0.155em;

        color: #C7F2A4;

        mix-blend-mode: normal;
    }

    .검색 {
        width: 414px;
        height: 22px;
        top: 24px;
        font-family: 'Paprika';
        font-style: normal;
        font-weight: 400;
        font-size: 17px;
        line-height: 22px;
        /* identical to box height, or 129% */

        letter-spacing: -0.408px;

        /* Label Colors/LC L Secondary */

        color: rgba(60, 60, 67, 0.6);

        border: 1px solid #000000;
        text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

        /* Inside auto layout */

        flex: none;
        order: 1;
        flex-grow: 1;
    }

    .search {
        box-sizing: border-box;

        /* Auto layout */

        display: flex;
        /*flex-direction: row;*/
        align-items: center;
        padding: 8px;

        position: absolute;
        width: 458px;
        height: 50px;
        left: calc(50% - 458px/2);
        top: 55px;

        /* System Materials/SM L Thick */

        background: rgba(250, 250, 250, 0.93);
        /*border: 1px solid #000000;*/
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        border-radius: 10px;
    }

    .button {
        display: flex;
        flex-direction: row;
        align-items: flex-start;
        padding: 12px 24px;
        gap: 8px;
        position: absolute;
        width: 109px;
        height: 50px;
        left: 1257px;
        top: 55px;
        background: #B6E388;
    }

    .로그인 {
        font-family: 'Abhaya Libre SemiBold';
        font-style: normal;
    }

    a {
        font-weight: 900;
        color: black;
        flex: none;
        order: 1;
        flex-grow: 0;
        displqy: inline;
        text-decoration-line: none;
    }

    .this {
        color: #C7F2A4;
    }

    .study {

        font-family: 'Inter';
        font-style: normal;
        font-weight: 700;
        font-size: 30px;
        line-height: 42px;
        color: #C7F2A4;
    }


    .title {
        font-family: 돋움;
        font-size: 12pt;
        font-weight: bold;
        color: Black;
        background-color: Beige;
        line-height: 22px;
    }

    .mtr_area {
        width: 1230px;
        height: 1000px;
        background: url("../images/mtr_area.png");
        position: absolute;
        top: 435px;
        left: 70px;
    }

    .mtr1 {
    	margin-left: 50px;
        width: 380px;
        height: 200px;
        border-style: solid;
        position: absolute;
        top: 0px;
        left: 0px;
    }

    .mtr2 {
    	margin-left: 50px;
        width: 380px;
        height: 200px;
        border-style: solid;
        position: absolute;
        top: 0px;
        left: 450px;
    }

    .mtr3 {
    	margin-left: 50px;
        width: 380px;
        height: 200px;
        border-style: solid;
        position: absolute;
        top: 0px;
        left: 900px;
    }

    .name_area {
        position: absolute;
        top: 20px;
        left: 170px;
    }

    .name_text {
        color: #333;
        font-family: Inter;
        font-weight: Bold;
        font-size: 15px;
        opacity: 1;
    }

    .name {
        color: #333;
        font-family: Inter;

        font-size: 15px;
        opacity: 1;
    }

    .intro_area {
        background: url("../images/intro_area.png");
        width: 200px;
        height: 95px;
        position: absolute;
        top: 100px;
        left: 170px;
    }

    .intro_text {
        color: #333;
        font-family: Inter;
        font-weight: Bold;
        font-size: 15px;
        opacity: 1;
    }

    .intro {
        color: #333;
        font-family: "Arial Narrow", Arial, sans-serif;
        font-size: 15px;
        opacity: 1;
    }

    .photo1 {
        position: absolute;
        top: 25px;
        left: 25px;
        width: 100px;
        width: 100px;
    }

    .go_profile {
        width: 120px;
        height: 30px;
        background: rgba(77, 198, 75, 0.8);
        border-radius: 60px;
        border: 0;
        position: absolute;
        top: 142px;
        left: 15px;
        text-decoration-line: none;
        font-size: 12px;
        color: white;
    }
    
  .button2{
   display: flex;
   flex-direction: row;
   align-items: center;
   padding: 12px 24px;
   gap: 8px;
   position: absolute;
   width: 80px;
   height: 50px;
   left: 1100px;
   top: 55px;
   background: #B6E388;
  }
  .v81_600 {
  width: 20px;
  height: 20px;
  background: rgba(255,255,255,1);
  opacity: 1;
  position: absolute;
  top: 12px;
  left: 95px;
  overflow: hidden;
}
.v81_601 {
  width: 9px;
  height: 10px;
  background: rgba(245,245,245,1);
  opacity: 1;
  position: absolute;
  top: 4px;
  left: 5px;
}
</style>