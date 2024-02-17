<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
   <title>로그인</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <link rel=stylesheet href="<c:url value='/css/member.css' />" type="text/css">
   <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css?family=Abhaya+Libre+SemiBold&display=swap" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css?family=Paprika&display=swap" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet" />
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <link rel=stylesheet href="<c:url value='/css/member.css' />" type="text/css">
   
<script>
   function login() {
      if (form.id.value == "") {
         alert("사용자 ID를 입력하십시오.");
         form.memberId.focus();
         return false;
      } 
      if (form.password.value == "") {
         alert("비밀번호를 입력하십시오.");
         form.password.focus();
         return false;
      }      
      form.submit();
   }
   
   function memberCreate(targetUri) {
      form.action = targetUri;
      form.method="GET";      // register form 요청
      form.submit();
   }
   </script>
</head>
<style>
    * {
        box-sizing: border-box;
    }

    body {
        font-size: 14px;
    }

    .v165_390 {
        width: 1000px;
        height: 550px;
        background: url("../images/v165_390.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 271px;
        left: 270px;
        overflow: hidden;
    }

    .loginbox {
        width: 750px;
        height: 550px;
        background: rgba(217, 217, 217, 0);
        opacity: 1;
        position: absolute;
        top: 0px;
        left: 70px;
        border: 1px solid rgba(207, 207, 207, 1);
    }

    .signin {
        position: absolute;
        bottom: 65px;
        left: 405px;
        border: 0;
        background: rgba(217, 217, 217, 0);
        text-align: center;
        font-size: 20px;
    }

    .loginbutton {
        width: 250px;
        height: 65;
        background: rgba(77, 198, 75, 0.8);
        border-radius: 60px;
        border: 0;
        position: absolute;
        top: 350px;
        left: 325px;
        font-family: Inter;
        font-weight: Regular;
        font-size: 25px;
        color: white;
        opacity: 1;
        text-align: center;
    }

    .name {
        color: #fff;
    }

    .pw {
        width: 334px;
        height: 51px;
        background: rgba(217, 217, 217, 0);
        opacity: 1;
        position: absolute;
        top: 231px;
        left: 290;
        border: 1.5px solid rgba(207, 207, 207, 1);
    }

    .pwtext {
        width: 194px;
        color: rgba(0, 0, 0, 1);
        position: absolute;
        top: 244px;
        left: 140px;
        font-family: Inter;
        font-weight: Regular;
        font-size: 27px;
        opacity: 1;
        text-align: left;
    }

    .id {
        width: 334px;
        height: 51px;
        background: rgba(217, 217, 217, 0);
        opacity: 1;
        position: absolute;
        top: 158px;
        left: 290px;
        border: 1.5px solid rgba(207, 207, 207, 1);
        overflow: hidden;
    }

    .idtext {
        width: 182px;
        color: rgba(0, 0, 0, 1);
        position: absolute;
        top: 164px;
        left: 140px;
        font-family: Inter;
        font-weight: Regular;
        font-size: 27px;
        opacity: 1;
        text-align: left;
    }

    .logintext {
        width: 243px;
        color: rgba(0, 0, 0, 1);
        position: absolute;
        top: 35px;
        left: 320px;
        font-family: Inter;
        font-weight: Regular;
        font-size: 40px;
        opacity: 1;
        text-align: center;
    }

    .name {
        color: #fff;
    }

    .logo {
        width: 154px;
        color: rgba(199, 242, 164, 1);
        position: absolute;
        top: 20px;
        left: 60px;
        font-family: Abhaya Libre SemiBold;
        font-weight: Regular;
        font-size: 70px;
        font-weight: 550;
        opacity: 1;
        text-align: left;
    }

    .name {
        color: #fff;
    }

    .search {
        width: 414px;
        height: 50px;
        background: rgba(250, 250, 250, 0.9300000071525574);
        border-radius: 7px;
        position: absolute;
        top: 47px;
        left: 497px;
        border: none;
        outline: 0;
        font-family: Paprika;
        font-size: 17px;
        opacity: 1;
        text-align: left;
    }

    .toploginbutton {
        width: 130px;
        height: 45;
        background: rgba(182, 227, 136, 1);
        border-radius: 7px;
        border: 0;
        position: absolute;
        top: 50px;
        left: 1160px;
        font-family: Inter;
        font-weight: regular;
        font-size: 21px;
        color: white;
        opacity: 1;
        text-align: center;
    }
    .palette{
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

.검색{
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
   flex-grow: 1;}
.search{
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

.button{
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

.로그인{
   font-family: 'Abhaya Libre SemiBold';
   font-style: normal;
}
a{
   font-weight: 900;
   color: black;
   flex: none;
   order: 1;
   flex-grow: 0;
   displqy: inline;
   text-decoration-line : none;
}
.this{
   color: #C7F2A4;
}
.study{

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 30px;
line-height: 42px;
color: #C7F2A4;
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
<body>
<div id='palette' class='palette'>Palette</div>
   <input type ='button' id='search' class='search' value='분야를 검색하세요'>
   <button id = 'button' class='button2' type = 'submit'>검색</button>
   
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
   <div style="float:left;"><h1><a href ="<c:url value='/view/main'/>" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;홈</a></h1></div>
   <div style="float:left;"><h1><a href ="<c:url value='/study/list'/>">&nbsp;&nbsp;스터디</a></h1></div>
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
<!-- login form  -->
<form name="form" method="POST" action="<c:url value='/user/login' />">
        <div class="v165_390">
            <div class="loginbox"></div>
            <input type="button" class="signin" value="회원가입"  onClick="memberCreate(
                                       '<c:url value='/user/register'/>')">
            <input type="button" class="loginbutton" value="Log in" onClick="login()" >
            <div class="name"></div>
            <input type="password" class="pw" name="password">
            <span class="pwtext">비밀번호</span>
            <input type="text" class="id" name="id">
            <span class="idtext">아이디</span>
            <span class="logintext">로그인</span>
        </div>
       
</form>
</body>
</html>