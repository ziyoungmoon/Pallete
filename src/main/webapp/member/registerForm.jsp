<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="service.dto.*" %> 
<%@page import ="java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/member.css' />" type="text/css">
<script>
function memberCreate() {
   if (form.id.value == "") {
      alert("사용자 ID를 입력하십시오.");
      form.id.focus();
      return false;
   } 
   if (form.password.value == "") {
      alert("비밀번호를 입력하십시오.");
      form.password.focus();
      return false;
   }
   if (form.password.value != form.password2.value) {
      alert("비밀번호가 일치하지 않습니다.");
      form.name.focus();
      return false;
   }
   if (form.name.value == "") {
      alert("이름을 입력하십시오.");
      form.name.focus();
      return false;
   }
   var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
   if(emailExp.test(form.email.value)==false) {
      alert("이메일 형식이 올바르지 않습니다.");
      form.email.focus();
      return false;
   }
   var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
   if(phoneExp.test(form.phoneNum.value)==false) {
      alert("전화번호 형식이 올바르지 않습니다.");
      form.phoneNum.focus();
      return false;
   }
   form.submit();
}

</script>
</head>
</head>
<style>
    * {
        box-sizing: border-box;
    }

    body {
        font-size: 14px;
    }


    .signuparea {
        width: 986px;
        height: 1300px;
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        margin: 40px;
        opacity: 1;
        position: absolute;
        top: 205px;
        left: 180px;
        overflow: hidden;
    }

    .signuptext {
        width: 120px;
        color: rgba(51, 51, 51, 1);
        position: absolute;
        top: 50px;
        left: 460px;
        font-family: Poppins;
        font-weight: Medium;
        font-size: 25px;
        opacity: 1;
        text-align: center;
    }


    .inputarea {
        width: 832px;
        height: 600px;
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        margin: 24px;
        opacity: 1;
        position: absolute;
        top: 112px;
        left: 340px;
        overflow: hidden;
    }

    .idtext {
        color: #676767;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 17px;
        opacity: 1;
    }

    .id {
        width: 300px;
        height: 43px;
        color: rgba(102, 102, 102, 0.6000000238418579);
        border-radius: 25px;
        position: absolute;
        top: 30px;
        left: 0px;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 17px;
        opacity: 1;
        text-align: left;
    }


    .pwtext {
        color: #676767;
        position: absolute;
        top: 100px;
        left: 0px;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 17px;
        opacity: 1;
    }

    .pw {
        width: 300px;
        height: 43px;
        color: rgba(102, 102, 102, 0.6000000238418579);
        border-radius: 25px;
        color: rgba(102, 102, 102, 0.6000000238418579);
        position: absolute;
        top: 130px;
        left: 0px;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 16px;
        opacity: 1;
        text-align: left;
    }

    .pwcheck {
        color: #676767;
        position: absolute;
        top: 200px;
        left: 0px;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 17px;
        opacity: 1;
    }

    .pwck {
        width: 300px;
        height: 43px;
        color: rgba(102, 102, 102, 0.6000000238418579);
        border-radius: 25px;
        color: rgba(102, 102, 102, 0.6000000238418579);
        position: absolute;
        top: 230px;
        left: 0px;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 16px;
        opacity: 1;
        text-align: left;
    }

    .nametext {
        color: #676767;
        position: absolute;
        top: 300px;
        left: 0px;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 17px;
        opacity: 1;
    }

    .names {
        width: 300px;
        height: 43px;
        color: rgba(102, 102, 102, 0.6000000238418579);
        border-radius: 25px;
       /*  color: rgba(102, 102, 102, 0.6000000238418579); */
        position: absolute;
        top: 330px;
        left: 0px;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 16px;
        opacity: 1;
        text-align: left;
    }

    .phonetext {
        color: #676767;
        position: absolute;
        top: 400px;
        left: 0px;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 17px;
        opacity: 1;
    }

    .phone {
        width: 300px;
        height: 43px;
        color: rgba(102, 102, 102, 0.6000000238418579);
        border-radius: 25px;
        color: rgba(102, 102, 102, 0.6000000238418579);
        position: absolute;
        top: 430px;
        left: 0px;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 16px;
        opacity: 1;
        text-align: left;
    }

    .emailtext {
        color: #676767;
        position: absolute;
        top: 500px;
        left: 0px;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 17px;
        opacity: 1;
    }

    .emails {
        width: 300px;
        height: 43px;
        color: rgba(102, 102, 102, 0.6000000238418579);
        border-radius: 25px;
        color: rgba(102, 102, 102, 0.6000000238418579);
        position: absolute;
        top: 530px;
        left: 0px;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 16px;
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
        top: 730px;
        left: 50px;
        overflow: hidden;
    }


    .partq {
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
    }

    .partck1 {
        width: 400px;
        color: rgba(17, 17, 17, 1);
        position: absolute;
        top: 50px;
        left: 275px;
        font-size: 17px;
    }

    .partck2 {
        width: 400px;
        color: rgba(17, 17, 17, 1);
        position: absolute;
        top: 90px;
        left: 275px;
        font-size: 17px;
    }

    .positionq {
        width: 500px;
        color: rgba(17, 17, 17, 1);
        position: absolute;
        top: 170px;
        left: 275px;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 17px;
        opacity: 1;
        text-align: left;
    }
  .positionck {
        width: 400px;
        color: rgba(17, 17, 17, 1);
        position: absolute;
        top: 220px;
        left: 275px;
        font-size: 17px;
    }
  
  .pfolioq {
     width: 500px;
        color: rgba(17, 17, 17, 1);
        position: absolute;
        top: 300px;
        left: 275px;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 17px;
        opacity: 1;
        text-align: left;
  }
  
  .portfolio {
  width: 300px;
        height: 43px;
        color: rgba(102, 102, 102, 0.6000000238418579);
        border-radius: 25px;
        color: rgba(102, 102, 102, 0.6000000238418579);
        position: absolute;
        top: 340px;
        left: 280px;
        font-family: Poppins;
        font-weight: Regular;
        font-size: 16px;
        opacity: 1;
        text-align: left;
  }
  
  .register {
     width: 350px;
        height: 65px;
        background: rgba(77, 198, 75, 0.8);
        border-radius: 60px;
        border: 0;
        position: absolute;
        top: 300px;
        left: 260px;
        font-family: Inter;
        font-weight: Regular;
        font-size: 25px;
        color: white;
        opacity: 1;
        text-align: center;
  }

    .logo {
        width: 154px;
        color: rgba(199, 242, 164, 1);
        position: absolute;
        top: 40px;
        left: 60px;
        font-family: Abhaya Libre SemiBold;
        font-weight: Regular;
        font-size: 70px;
        font-weight: 550;
        opacity: 1;
        text-align: left;
    }

    /* .name {
        color: #fff;
    } */

    .search {
        width: 414px;
        height: 50px;
        background: rgba(250, 250, 250, 0.9300000071525574);
        border-radius: 7px;
        position: absolute;
        top: 70px;
        left: 497px;
        border: none;
        outline: 0;
        font-family: Paprika;
        font-size: 17px;
        opacity: 1;
        text-align: left;
    }

    .toploginbutton {
        width: 140px;
        height: 50px;
        background: rgba(182, 227, 136, 1);
        border-radius: 7px;
        border: 0;
        position: absolute;
        top: 70px;
        left: 1250px;
        font-family: Inter;
        font-weight: regular;
        font-size: 25px;
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
td {
   font-family: 돋움;
   font-size: 12px; 
   color: #333333; 
   line-height: 18px;
}

.title {
   font-family: 돋움;
   font-size: 12pt; 
   font-weight: bold;
   color: Black; 
   background-color: Beige;
   line-height: 22px;
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
   <form name="f" method="POST" action="<c:url value='/view/search'/>" >
      <input type='text' id='search' class='search' value='분야를 검색하세요' name='part'>
      <button id = 'button' class='button2' type = 'submit'>검색</button>
   </form>
   
   <%
         String id = (String)session.getAttribute("id");
         if (id != null) { %>
            <a href="<c:url value='/view/main?logout=1'></c:url>"><input type ='button' id='button' class='button' value='LOGOUT'></a>
      <%   } 
         else { %>
            <a href="<c:url value='/user/login'></c:url>"><input type ='button' id='button' class='button' value='  LOGIN'></a>      
      <% } 
    %>
   <br><br><br><br><br><br>
   
   <div style="float:left;"><h1><a href ="<c:url value='/view/main'/>" class = "this">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;홈</a></h1></div>
   <div style="float:left;"><h1><a href ="<c:url value='/study/list'/>">&nbsp;&nbsp;스터디</a></h1></div>
   <div style="float:left;"><h1><a href ="<c:url value='/mentoring/list'/>">&nbsp;&nbsp;멘토링</a></h1></div>
   <div style="float:left;"><h1><a href ="<c:url value='/user/list'/>">&nbsp;&nbsp;마이페이지</a></h1></div>
   <br><br><br><br>
   
   <hr style="border: solid 2px #C7F2A4;"> 
   <br><br>
    <!-- registration form  -->
   <form name="form" method="POST" action="<c:url value='/user/register' />">
    
    <!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
    <c:if test="${registerFailed}">
         <font color="red"><c:out value="${exception.getMessage()}" /></font>
   </c:if>
       
    <div class="signuparea">
        <span class="signuptext">회원가입</span>
        <div class="inputarea">
            <span class="idtext">아이디</span>
            <div><input type="text" name="id" class="id" placeholder="영문, 숫자 포함 ~12글자"></div>
            <div class="name"></div>

            <span class="pwtext">비밀번호</span>
            <input type="password" name="password" class="pw">
            <div class="name"></div>

            <span class="pwcheck">비밀번호 확인</span>
            <input type="password" name="password2" class="pwck">
            <div class="name"></div>

            <span class="nametext">이름</span>
            <input type="text" name="name" class="names"
            <c:if test="${registerFailed}">value="${member.name}"</c:if>>
            <div class="name"></div>

            <span class="phonetext">전화번호</span>
            <input type="text" name="phoneNum" class="phone" placeholder="ex)010-xxxx-xxxx"
            <c:if test="${registerFailed}">value="${member.phoneNum}"</c:if>>
            <div class="name"></div>

            <span class="emailtext">이메일</span>
            <input type="text" name="email" class="emails"
            <c:if test="${registerFailed}">value="${member.email}"</c:if>>
            <div class="name"></div>
        </div>
        
        <div class="qarea">
            <span class="partq">&#45;&nbsp;개발 분야 또는 관심 분야는 무엇인가요?</span>
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
                
            <span class="positionq">&#45;&nbsp;'멘토'와 '멘티' 둘 중 어느 역할에 속하시나요?</span>
          <div class="positionck">
            <input type="radio" name="position" value="멘토">멘토&nbsp;
         <input type="radio" name="position" value="멘티">멘티&nbsp;
          </div>
        
          <input type="button" class="register" onClick="memberCreate()" value="Sign up">
        </div>
    </div>
</form>
</body>
</html>