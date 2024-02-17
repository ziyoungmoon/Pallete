<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@page import="service.dto.*" %>
<%@page import="controller.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script>
function studyApply() {
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
  
<div class="v86_491">
<div class="v23_188">
<!-- <div class="v27_220"></div> -->
<%
	Study study = (Study) request.getAttribute("study");
	int quota = study.getQuota();
	String region = study.getRegion();
	String part = study.getPart();
	int studyId = study.getStudyId();
	String LeaderId = study.getLeaderId();
%>

<form name="form" method="POST" action="<c:url value='/study/studyApply' />">
<span class="v25_201">모집 인원</span>
<span class="v25_202">현재<%=quota %>명 모집중이에요!</span>
<span class="v37_186">스터디 소개</span>
<span class="v37_187">안녕하세요. 같이 열공해요~</span>
<span class="v37_189">분야</span>
<span class="v37_193"><%=part %></span>
<span class="v37_194">지역</span>
<span class="v37_195"><%=region %><br><input type="hidden" name="studyId" value=<%=studyId %> /></span>
<!-- <span class="v228_386">아이디</span>
<span class="v228_387"><input type="text" name="id"></span> -->
<input type="button" value="신청" class="v27_221" onClick="studyApply()">
</form>

<div class="f2">
<form name = "form2" method="GET" action="<c:url value='/study/Unregister' />">
<input type="hidden" name="studyId" value=<%=studyId %> />
<input type="hidden" name="leaderId" value=<%=LeaderId %> />
<input type="button" class="unregister" value="삭제" onClick="form.submit()">
</form>
</div>

<div class="f3">
<form name = "form3" method="GET" action="<c:url value='/study/Cancel/studyApply' />">
<input type="hidden" name="studyId" value=<%=studyId %> />
<input type="button" class="cancel" value="신청취소" onClick="form.submit()">
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
.v86_491 {
  width: 100%;
  height: 1200px;
  background: url("../images/v86_491.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: relative;
  top: 0px;
  left: 0px;
  overflow: hidden;
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
.v23_188 {
  width: 100%;
  height: 1200px;
  background: rgba(255,255,255,1);
  opacity: 1;
  position: relative;
  top: 0px;
  left: 0px;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  overflow: hidden;
}
.v25_201 {
  width: 195px;
  color: rgba(182,227,136,1);
  position: absolute;
  top: 577px;
  left: 700px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v25_202 {
  width: 735px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 662px;
  left: 700px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v27_220 {
  width: 228px;
  height: 73px;
  background: rgba(199,242,164,1);
  opacity: 1;
  position: absolute;
  top: 1012px;
  left: 445px;
}
.v27_221 {
  width: 158px;
  color: rgba(255,255,255,1);
  position: absolute;
  top: 1025px;
  left: 1010px;
  font-family: Inter;
  font-weight: Medium;
  font-size: 40px;
  opacity: 1;
  text-align: center;
}
.v37_186 {
  width: 220px;
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
.v37_187 {
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
.v37_188 {
  width: 89px;
  height: 48px;
  background: rgba(217,217,217,0);
  opacity: 1;
  position: absolute;
  top: 661px;
  left: 595px;
  border: 1px solid rgba(0,0,0,1);
  overflow: hidden;
}
.v37_189 {
  width: 194px;
  color: rgba(182,227,136,1);
  position: absolute;
  top: 777px;
  left: 700px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v37_193 {
  width: 136px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 777px;
  left: 885px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v37_194 {
  width: 194px;
  color: rgba(182,227,136,1);
  position: absolute;
  top: 875px;
  left: 700px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v37_195 {
  width: 136px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 875px;
  left: 900px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v37_197 {
  width: 227px;
  height: 73px;
  background: rgba(199,242,164,1);
  opacity: 1;
  position: absolute;
  top: 1012px;
  left: 691px;
  overflow: hidden;
}
.v37_198 {
  width: 74px;
  color: rgba(255,255,255,1);
  position: absolute;
  top: 1025px;
  left: 614px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: center;
}
.v228_386 {
  width: 194px;
  color: rgba(182,227,136,1);
  position: absolute;
  top: 920px;
  left: 105px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v228_387 {
  width: 359px;
  color: rgba(0,0,0,1);
  position: absolute;
  top: 920px;
  left: 265px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v81_550 {
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
.v81_587 {
  width: 100%;
  background: url("../images/v81_587.png");
  opacity: 1;
  position: absolute;
  top: 199px;
  left: 61px;
  border: 1px solid rgba(77,198,75,1);
}
.name {
  color: #fff;
}
.v81_589 {
  width: 100%;
  height: 284px;
  background: rgba(252,255,178,0.800000011920929);
  opacity: 1;
  position: absolute;
  top: 210px;
  left: 0px;
  overflow: hidden;
}
.v81_590 {
  width: 957px;
  height: 98px;
  background: url("../images/v81_590.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: absolute;
  top: 93px;
  left: 103px;
  overflow: hidden;
}
.v81_591 {
  width: 957px;
  color: rgba(14,14,14,0.699999988079071);
  position: relative;
  top: 0px;
  left: 0px;
  font-family: Montserrat;
  font-weight: Medium;
  font-size: 40px;
  opacity: 1;
  text-align: left;
}
.v81_592 {
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
.v81_593 {
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
.v81_594 {
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
.v81_595 {
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
.v81_597 {
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
.v81_598 {
  width: 109px;
  height: 44px;
  background: rgba(182,227,136,1);
  padding: 12px 24px;
  margin: 8px;
  opacity: 1;
  position: absolute;
  top: 30px;
  left: 157px;
  overflow: hidden;
}
.v81_599 {
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

.unregister {
    	width: 158px;
  		color: rgba(255,255,255,1);
  		position: absolute;
  		top: 1024px;
  		left: 835px;
  		font-family: Inter;
  		font-weight: Medium;
  		font-size: 40px;
  		opacity: 1;
  		text-align: center;
    }

	.cancel {
		width: 158px;
  		color: rgba(255,255,255,1);
  		position: absolute;
  		top: 1020px;
  		left: 656px;
  		height : 70px;
  		font-family: Inter;
  		font-weight: Medium;
  		font-size: 32px;
  		opacity: 1;
  		text-align: center;
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