<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="service.dto.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
   @SuppressWarnings("unchecked") 
   List<User> userList = (List<User>)request.getAttribute("userList");
   String curUserId = (String)request.getAttribute("curUserId");
--%>
<%
    Member member = (Member)request.getAttribute("member");
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>UserList</title>
</head>
<style>
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

    .button2 {
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

    ul {
        position: absolute;
        top: 0px;
        left: 0px;
        list-style-type: none;
        margin: 0;
        padding: 0;
        width: 200px;
        background-color: #f1f1f1;
    }

    li a {
        display: block;
        color: #000;
        padding: 8px 16px;
        text-decoration: none;
        font-size: 15px;
    }

    li a.active {
        background-color: #4CAF50;
        color: white;
    }

    li a:hover:not(.active) {
        background-color: #555;
        color: white;
    }

    .modifyarea {
        width: 100%;
        height: 1237px;
        background-repeat: no-repeat;
        background-position: center-center;
        background-size: cover;
        margin: 40px;
        opacity: 1;
        position: absolute;
        top: 630px;
        left: 80px;
        overflow: hidden;
    }
    
    .menu {
    width: 100%;
  position: absolute;
  top: 145px;
  left: 10px;
    }
</style>

<body>


    <img src="<c:url value='/upload/${member.image}'/>" width="300px" height="300px" class='img2' />
    <div class='imgg'>
        <form method="post" action="<c:url value='/user/img' />" enctype="multipart/form-data">
            <table>
                <tr>
                    <th width="100">사진: </th>
                    <td align="left"><input type="file" name="picture" size="11" multiple="multiple" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" value="수정" />&nbsp;&nbsp;&nbsp;</td>
                </tr>
            </table>
        </form>
    </div>

         <div id='palette' class='palette'>Palette</div>
   <form name="form" method="POST" action="<c:url value='/view/search'/>" >
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
   <div class="menu">
   <div style="float:left;"><h1><a href ="<c:url value='/view/main'/>" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;홈</a></h1></div>
   <div style="float:left;"><h1><a href ="<c:url value='/study/list'/>">&nbsp;&nbsp;스터디</a></h1></div>
   <div style="float:left;"><h1><a href ="<c:url value='/mentoring/list'/>">&nbsp;&nbsp;멘토링</a></h1></div>
   <div style="float:left;"><h1><a href ="<c:url value='/user/list'/>" class = "this">&nbsp;&nbsp;마이페이지</a></h1></div>
   <br><br><br><br>
   
   <hr style="border: solid 2px #C7F2A4;"> 
   <br><br>
   </div>
   
    <div class="category">
        <ul>
            <li><a href="<c:url value='/user/list'>
                 <c:param name='userId' value='<%=member.getId()%>'/>
                </c:url>" class="active"> 프로필 </a></li>
            <li><a href="<c:url value='/user/update/form'>
                 <c:param name='userId' value='<%=member.getId()%>'/>
                </c:url>">프로필 수정</a></li>
            <li><a href="<c:url value='/user/apply'>
                 <c:param name='userId' value='<%=member.getId()%>'/>
                </c:url>"> 신청 현황 </a></li>
            <li><a href="<%=member.getPortfolio()%>">포트폴리오</a></li>
        </ul>
    </div>
    
    <div class="modifyarea">

        <span class="profileText"><%=member.getName()%>님의 프로필</span>

        <div class="namearea">
            <div class="namebox"></div>
            <span class="nametext">이름</span>
            <span class="names"><%=member.getName()%></span>
        </div>

        <div class="idarea">
            <div class="idbox"></div>
            <span class="idtext">아이디</span>
            <span class="id"><%=member.getId()%></span>
        </div>

        <div class="emailarea">
            <div class="emailbox"></div>
            <span class="emailtext">이메일</span>
            <span class="email"><%=member.getEmail()%></span>
            <div class="v55_347">
                <div class="v55_348"></div>
                <div class="v55_349">
                    <div class="v55_350"></div>
                    <div class="v55_351"></div>
                </div>
            </div>
        </div>

        <div class="partarea">
            <div class="partbox"></div>
            <span class="parttext">분야</span>
            <span class="part"><%=member.getPosition()%></span>
            <div class="v55_334"></div>
        </div>

        <div class="careerarea">
            <div class="partbox"></div>
            <span class="careertext">전화번호</span><span class="career"><%=member.getPhoneNum()%></span>
        </div>

        <div class="portfolio_area">
            <div class="portfolio_box"></div>
            <span class="portfolio_text">포트폴리오 링크</span>
            <span class="portfolio">https://github.com/dbp_pallete</span>
        </div>

        <div class="v55_365">
            <div class="introbox"></div>
            <span class="intro">내일이 기대되는 개발자 <%=member.getName()%> 입니다.</span>
        </div>

        <div class="v56_1237"></div>
    </div>
    <div class="name"></div>
</body>

</html> <br /><br />
<style>
    * {
        box-sizing: border-box;
    }

    body {
        font-size: 14px;
    }

    .v86_494 {
        width: 100%;
        height: 2604px;
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: relative;
        top: 130px;
        left: 0px;
        overflow: hidden;
    }

    .profileText {
        width: 1000px;
        color: rgba(0, 0, 0, 1);
        position: absolute;
        top: 0px;
        left: 500px;
        font-family: Roboto;
        font-weight: SemiBold;
        font-size: 30px;
        opacity: 1;
        text-align: left;
    }

    .namearea {
        width: 405px;
        height: 150px;
        background: url("../images/namearea.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 230px;
        left: 370px;
        overflow: hidden;
    }


    .namebox {
        width: 350px;
        height: 60px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: absolute;
        top: 50px;
        left: 0px;
        border: 2px solid rgba(132, 132, 132, 1);
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        overflow: hidden;
    }

    .nametext {
        width: 48px;
        color: rgba(27, 27, 27, 1);
        position: relative;
        top: 0px;
        left: 0px;
        font-family: Roboto;
        font-weight: SemiBold;
        font-size: 20px;
        opacity: 1;
        text-align: left;
    }

    .names {
        width: 150px;
        color: rgba(132, 132, 132, 1);
        position: absolute;
        top: 62px;
        left: 10px;
        font-family: Roboto;
        font-weight: Medium;
        font-size: 24px;
        opacity: 1;
        text-align: left;
    }

    .partarea {
        width: 405px;
        height: 120px;
        background: url("../images/partarea.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 680px;
        left: 370px;
        overflow: hidden;
    }

    .partbox {
        width: 350px;
        height: 60px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: absolute;
        top: 50px;
        left: 0px;
        border: 2px solid rgba(132, 132, 132, 1);
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        overflow: hidden;
    }

    .parttext {
        width: 195px;
        color: rgba(27, 27, 27, 1);
        position: relative;
        top: 0px;
        left: 0px;
        font-family: Roboto;
        font-weight: SemiBold;
        font-size: 20px;
        opacity: 1;
        text-align: left;
    }

    .part {
        width: 82px;
        color: rgba(132, 132, 132, 1);
        position: absolute;
        top: 60px;
        left: 10px;
        font-family: Roboto;
        font-weight: Medium;
        font-size: 24px;
        opacity: 1;
        text-align: left;
    }

    .v55_334 {
        width: 48px;
        height: 48px;
        background: url("../images/v55_334.png");
        opacity: 1;
        position: relative;
        top: 0px;
        left: 0px;
    }


    .emailarea {
        width: 873px;
        height: 120px;
        background: url("../images/v55_343.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 530px;
        left: 370px;
        overflow: hidden;
    }

    .emailbox {
        width: 500px;
        height: 60px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: absolute;
        top: 50px;
        left: 0px;
        border: 2px solid rgba(132, 132, 132, 1);
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        overflow: hidden;
    }

    .emailtext {
        width: 275px;
        color: rgba(27, 27, 27, 1);
        position: absolute;
        top: 0px;
        left: 0px;
        font-family: Roboto;
        font-weight: SemiBold;
        font-size: 20px;
        opacity: 1;
        text-align: left;
    }

    .imgg {
        width: 400px;
        height: 150px;
        position: relative;
        top: 610px;
        left: 900px;
    }

    .img2 {
        top: 350px;
        position: absolute;
        left: 600px;
    }

    .email {
        width: 407px;
        color: rgba(132, 132, 132, 1);
        position: absolute;
        top: 60px;
        left: 10px;
        font-family: Roboto;
        font-weight: Medium;
        font-size: 25px;
        opacity: 1;
        text-align: left;
    }


    .category {
        position: absolute;
        top: 350px;
        left: 60px;
    }

    .idarea {
        width: 405px;
        height: 150px;
        background: url("../images/idarea.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 380px;
        left: 370px;
        overflow: hidden;
    }

    .idbox {
        width: 350px;
        height: 60px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: absolute;
        top: 50px;
        left: 0px;
        border: 2px solid rgba(132, 132, 132, 1);
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        overflow: hidden;
    }

    .idtext {
        width: 48px;
        color: rgba(27, 27, 27, 1);
        position: relative;
        top: 0px;
        left: 0px;
        font-family: Roboto;
        font-weight: SemiBold;
        font-size: 20px;
        opacity: 1;
        text-align: left;
    }

    .id {
        width: 67px;
        color: rgba(132, 132, 132, 1);
        position: absolute;
        top: 62px;
        left: 10px;
        font-family: Roboto;
        font-weight: Medium;
        font-size: 24px;
        opacity: 1;
        text-align: left;
    }

    .portfolio_area {
        width: 405px;
        height: 150px;
        background: url("../images/portfolio_area.png");
        ;
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 1250px;
        left: 450px;
        overflow: hidden;
    }


    .portfolio_box {
        width: 405px;
        height: 70px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: absolute;
        top: 50px;
        left: 0px;
        border: 2px solid rgba(132, 132, 132, 1);
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        overflow: hidden;
    }

    .portfolio_text {
        width: 48px;
        color: rgba(27, 27, 27, 1);
        position: relative;
        top: 0px;
        left: 0px;
        font-family: Roboto;
        font-weight: SemiBold;
        font-size: 26px;
        opacity: 1;
        text-align: left;
    }

    .portfolio {
        width: 67px;
        color: rgba(132, 132, 132, 1);
        position: absolute;
        top: 70px;
        left: 20px;
        font-family: Roboto;
        font-weight: Medium;
        font-size: 24px;
        opacity: 1;
        text-align: left;
    }

    .v55_347 {
        width: 35px;
        height: 35px;
        background: url("../images/v55_347.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 55px;
        left: 815px;
        overflow: hidden;
    }

    .v55_348 {
        width: 29px;
        height: 29px;
        background: rgba(35, 176, 0, 1);
        opacity: 1;
        position: absolute;
        top: 5px;
        left: 0px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        overflow: hidden;
    }

    .v55_349 {
        width: 35px;
        height: 35px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: absolute;
        top: 0px;
        left: 0px;
        overflow: hidden;
    }

    .v55_350 {
        width: 35px;
        height: 35px;
        background: url("../images/v55_350.png");
        opacity: 1;
        position: absolute;
        top: 0px;
        left: 0px;
    }

    .v55_351 {
        width: 19px;
        height: 14px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: absolute;
        top: 13px;
        left: 5px;
    }

    .v55_352 {
        width: 876px;
        height: 108px;
        background: url("../images/v55_352.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 1585px;
        left: 500px;
        overflow: hidden;
    }

    .v55_353 {
        width: 876px;
        height: 70px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: absolute;
        top: 38px;
        left: 0px;
        border: 2px solid rgba(132, 132, 132, 1);
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        overflow: hidden;
    }

    .v55_354 {
        width: 275px;
        color: rgba(27, 27, 27, 1);
        position: absolute;
        top: 0px;
        left: 0px;
        font-family: Roboto;
        font-weight: SemiBold;
        font-size: 26px;
        opacity: 1;
        text-align: left;
    }

    .v55_355 {
        width: 407px;
        color: rgba(132, 132, 132, 1);
        position: absolute;
        top: 59px;
        left: 27px;
        font-family: Roboto;
        font-weight: Medium;
        font-size: 24px;
        opacity: 1;
        text-align: left;
    }

    .v55_356 {
        width: 35px;
        height: 35px;
        background: url("../images/v55_356.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 55px;
        left: 815px;
        overflow: hidden;
    }

    .v55_357 {
        width: 29px;
        height: 29px;
        background: rgba(35, 176, 0, 1);
        opacity: 1;
        position: absolute;
        top: 5px;
        left: 0px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        overflow: hidden;
    }

    .v55_358 {
        width: 35px;
        height: 35px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: absolute;
        top: 0px;
        left: 0px;
        overflow: hidden;
    }

    .v55_359 {
        width: 35px;
        height: 35px;
        background: url("../images/v55_359.png");
        opacity: 1;
        position: absolute;
        top: 0px;
        left: 0px;
    }

    .v55_360 {
        width: 19px;
        height: 14px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: absolute;
        top: 13px;
        left: 5px;
    }

    .v55_361 {
        width: 876px;
        height: 108px;
        background: url("../images/v55_361.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 1452px;
        left: 500px;
        overflow: hidden;
    }

    .v55_362 {
        width: 876px;
        height: 70px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: absolute;
        top: 38px;
        left: 0px;
        border: 2px solid rgba(132, 132, 132, 1);
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        overflow: hidden;
    }

    .v55_363 {
        width: 276px;
        color: rgba(27, 27, 27, 1);
        position: absolute;
        top: 0px;
        left: 0px;
        font-family: Roboto;
        font-weight: SemiBold;
        font-size: 26px;
        opacity: 1;
        text-align: left;
    }

    .v55_364 {
        width: 408px;
        color: rgba(132, 132, 132, 1);
        position: absolute;
        top: 59px;
        left: 27px;
        font-family: Roboto;
        font-weight: Medium;
        font-size: 24px;
        opacity: 1;
        text-align: left;
    }

    .careerarea {
        width: 876px;
        height: 200px;
        background: url("../images/careerarea.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 830px;
        left: 370px;
        overflow: hidden;
    }

    .careerbox {
        width: 700px;
        height: 60px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: absolute;
        top: 45px;
        left: 0px;
        border: 2px solid rgba(132, 132, 132, 1);
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        overflow: hidden;
    }

    .careertext {
        width: 276px;
        color: rgba(27, 27, 27, 1);
        position: absolute;
        top: 0px;
        left: 0px;
        font-family: Roboto;
        font-weight: SemiBold;
        font-size: 20px;
        opacity: 1;
        text-align: left;
    }

    .career {
        width: 727px;
        color: rgba(132, 132, 132, 1);
        position: absolute;
        top: 62px;
        left: 27px;
        font-family: Roboto;
        font-weight: Medium;
        font-size: 24px;
        opacity: 1;
        text-align: left;
    }

    .v55_365 {
        width: 1000px;
        height: 116px;
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 70px;
        left: 200px;
        overflow: hidden;
    }

    .introbox {
        width: 600px;
        height: 116px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: relative;
        top: 0px;
        left: 170px;
        border: 2px solid rgba(132, 132, 132, 1);
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        overflow: hidden;
    }

    .intro {
        width: 487px;
        color: rgba(132, 132, 132, 1);
        position: absolute;
        top: 20px;
        left: 200px;
        font-family: Roboto;
        font-weight: Medium;
        font-size: 20px;
        opacity: 1;
        text-align: left;
    }

    .updatearea {
        width: 300px;
        height: 100px;
        background: url("../images/updatearea.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 1450px;
        left: 620px;
        overflow: hidden;
    }

    .update {
        position: absolute;
        top: 10px;
        left: 0px;
    }

    a {
        text-decoration-line: none;
        font-size: 30px;
    }

    a:link {
        color: black;
    }

    a:hover {
        color: rgba(77, 198, 75, 0.8);
    }

    .cancel {
        width: 110px;
        height: 60px;
        background: rgba(77, 198, 75, 0.8);
        border-radius: 60px;
        border: 0;
        position: absolute;
        top: 0px;
        left: 90px;
        font-family: Inter;
        font-weight: Regular;
        font-size: 30px;
        color: white;
        opacity: 1;
        text-align: center;
    }

    .v55_374 {
        width: 180px;
        height: 55px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: absolute;
        top: 0px;
        left: 0px;
        border: 2px solid rgba(77, 198, 75, 0.800000011920929);
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        overflow: hidden;
    }

    .v55_375 {
        background-color: #44c767;
        border: 1px solid #18ab29;
        display: inline-block;
        cursor: pointer;
        color: #ffffff;
        font-family: Roboto;
        font-size: 17px;
        padding: 16px 31px;
        text-decoration: none;
        text-shadow: 0px 1px 0px #2f6627;
    }

    .v55_375:hover {
        background-color: #5cbf2a;
    }

    .v55_375:active {
        position: relative;
        top: 1px;
    }

    .v55_376 {
        width: 180px;
        height: 55px;
        background: url("../images/v55_376.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 1986px;
        left: 500px;
        overflow: hidden;
    }

    .v55_377 {
        width: 180px;
        height: 55px;
        background: rgba(77, 198, 75, 0.800000011920929);
        opacity: 1;
        position: absolute;
        top: 0px;
        left: 0px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        overflow: hidden;
    }

    .v55_378 {
        width: 52px;
        color: rgba(255, 255, 255, 1);
        position: absolute;
        top: 11px;
        left: 60px;
        font-family: Roboto;
        font-weight: SemiBold;
        font-size: 28px;
        opacity: 1;
        text-align: left;
    }

    .name {
        color: #fff;
    }

    .v56_1235 {
        width: 339px;
        height: 356px;
        background: url("../images/v56_1235.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 679px;
        left: 401px;
        overflow: hidden;
    }

    .v56_1236 {
        width: 317px;
        height: 333px;
        background: url("../images/v56_1236.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 11px;
        left: 12px;
        border-top-left-radius: 200px;
        border-top-right-radius: 200px;
        border-bottom-left-radius: 200px;
        border-bottom-right-radius: 200px;
        overflow: hidden;
    }

    .v56_1237 {
        width: 339px;
        height: 356px;
        background: url("../images/v56_1237.png");
        opacity: 1;
        position: relative;
        top: 0px;
        left: 0px;
        border-radius: 50%;
    }

    .v81_670 {
        width: 100%;
        background: url("../images/v81_670.png");
        opacity: 1;
        position: absolute;
        top: 190px;
        left: 61px;
        border: 1px solid rgba(77, 198, 75, 1);
    }

    .name {
        color: #fff;
    }

    .v81_672 {
        width: 100%;
        height: 284px;
        background: rgba(252, 255, 178, 0.800000011920929);
        opacity: 1;
        position: absolute;
        top: 201px;
        left: 0px;
        overflow: hidden;
    }

    .v81_673 {
        width: 957px;
        height: 98px;
        background: url("../images/v81_673.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 93px;
        left: 103px;
        overflow: hidden;
    }

    .v81_674 {
        width: 957px;
        color: rgba(14, 14, 14, 0.699999988079071);
        position: relative;
        top: 0px;
        left: 0px;
        font-family: Montserrat;
        font-weight: Medium;
        font-size: 40px;
        opacity: 1;
        text-align: left;
    }

    .v81_675 {
        width: 137px;
        color: rgba(148, 148, 148, 1);
        position: absolute;
        top: 47px;
        left: 103px;
        font-family: Montserrat;
        font-weight: SemiBold;
        font-size: 16px;
        opacity: 1;
        text-align: center;
    }

</style>