<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<script>
function mtrCreate() {
	form.submit(); 
}


</script>
<head>
<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Abhaya+Libre+SemiBold&display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Paprika&display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
</head>

<body>
<div class="v118_457">
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
   <div style="float:left;"><h1><a href ="<c:url value='/study/list'/>">&nbsp;&nbsp;스터디</a></h1></div>
   <div style="float:left;"><h1><a href ="<c:url value='/mentoring/list'/>"  class = "this">&nbsp;&nbsp;멘토링</a></h1></div>
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
   
<form name="form" method="POST" action="<c:url value='/mentoring/Register' />">
<span class="v118_483">모집 인원</span>
<span class="v118_484"><input type="number" name="quota" value="${quota}"/></span>
<span class="v118_486">분야</span>

<!-- <div class="v118_487"> -->
<!-- <label class="v118_487">
<div class="back"><input type="checkbox" name="part" value="backend(web)"> Backend(web) </div>
<div class="front"><input type="checkbox" name="part" value="frontend(web)"> Frontend(web) </div>
<div class="ios"><input type="checkbox" name="part" value="ios"> ios </div>
<div class="and"><input type="checkbox" name="part" value="Android"> Android </div>
<div class="game"><input type="checkbox" name="part" value="Game"> Game </div>
<div class="emb"><input type="checkbox" name="part" value="Embedded system"> Embedded system </div>
</label> -->
<!-- </div> -->

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

<%-- <span class="v127_534">멘토 ID</span>
<span class="v127_535"><input type="text" name="leaderId" value="${leaderId}"/></span> --%>
<span class="v118_488">지역</span>
<span class="v118_489"><input type="text" name="region" value="${region}"/></span>
<span class="v150_386">기한</span>
<span class="v150_387"><input type="date" name="deadline" value="${deadline}"/></span>
<input type="button" class="v118_480" value="신청" onClick="mtrCreate()">
</form>

</div>
</body>
</html> 

<br/><br/> 

<style>* {
  box-sizing: border-box;
}
body {
  font-size: 14px;
}
.v150_386 {
  width: 194px;
  color: rgba(182,227,136,1);
  position: absolute;
  top: 720px;
  left: 183px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 40px;
  opacity: 1;
  text-align: left;
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
        top: 740px;
  		left: 888px;
        overflow: hidden;
    }
/*  .partq {
        width: 500px;
        color: rgba(17, 17, 17, 1);
        position: absolute;
        top: 0px;
        left: 275px;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 17px;
        opacity: 1;
        text-align: left;
    } */

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
    
.v150_387 {
  width: 359px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 720px;
  left: 361px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}

/* .back input{
	 horizontal-align:-3px; font-size: 5px;
}

.front input{
	 horizontal-align:3px; font-size: 5px;
}

.and input{
	 vertical-align:3px; font-size: 5px;
}

.ios input{
	 vertical-align:3px; font-size: 5px;
} */

.v118_487 {
  display: inline-block;
  width: 600px;
  height: 100px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 759px;
  left: 888px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 10px;
  opacity: 1;
  text-align: left;
}

.v127_534 {
  width: 200px;
  color: rgba(182,227,136,1);
  position: absolute;
  top: 759px;
  left: 173px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 35px;
  opacity: 1;
  text-align: left;
}

.v127_535 {
  width: 359px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 759px;
  left: 361px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v118_457 {
  width: 100%;
  height: 1200px;
  background: rgba(255,255,255,1);
  opacity: 1;
  position: absolute;
  top: 0px;
  left: 0px;
  overflow: hidden;
}
.name {
  color: #fff;
}
.v118_466 {
  width: 100%;
  height: 284px;
  background: rgba(252,255,178,0.800000011920929);
  opacity: 1;
  position: absolute;
  top: 210px;
  left: 0px;
  overflow: hidden;
}
.v118_467 {
  width: 957px;
  height: 98px;
  background: url("../images/v118_467.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: absolute;
  top: 93px;
  left: 103px;
  overflow: hidden;
}
.v118_468 {
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
.v118_469 {
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
.v118_470 {
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
.v118_471 {
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
.v118_472 {
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
.v118_474 {
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
.v118_475 {
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
.v118_476 {
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
.v118_477 {
  width: 20px;
  height: 20px;
  background: rgba(255,255,255,1);
  opacity: 1;
  position: absolute;
  top: 12px;
  left: 95px;
  overflow: hidden;
}
.v118_478 {
  width: 9px;
  height: 10px;
  background: rgba(245,245,245,1);
  opacity: 1;
  position: absolute;
  top: 4px;
  left: 6px;
}
.v118_479 {
  width: 228px;
  height: 73px;
  background: rgba(199,242,164,1);
  opacity: 1;
  position: absolute;
  top: 1037px;
  left: 975px;
}
.v118_480 {
  width: 158px;
  color: rgba(255,255,255,1);
  position: absolute;
  top: 1050px;
  left: 1010px;
  font-family: Inter;
  font-weight: Medium;
  font-size: 40px;
  opacity: 1;
  text-align: center;
}
/* .v118_482 {
  width: 74px;
  color: rgba(255,255,255,1);
  position: absolute;
  top: 1050px;
  left: 806px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: center;
} */
.v118_483 {
  width: 195px;
  color: rgba(182,227,136,1);
  position: absolute;
  top: 642px;
  left: 703px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v118_484 {
  width: 735px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 644px;
  left: 920px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v118_485 {
  width: 89px;
  height: 48px;
  background: rgba(217,217,217,0);
  opacity: 1;
  position: absolute;
  top: 643px;
  left: 898px;
  border: 1px solid rgba(0,0,0,1);
  overflow: hidden;
}
.v118_486 {
  width: 194px;
  color: rgba(182,227,136,1);
  position: absolute;
  top: 759px;
  left: 720px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v118_487 {
  width: 359px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 759px;
  left: 898px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v118_488 {
  width: 194px;
  color: rgba(182,227,136,1);
  position: absolute;
  top: 857px;
  left: 720px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v118_489 {
  width: 136px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 857px;
  left: 898px;
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
</style>