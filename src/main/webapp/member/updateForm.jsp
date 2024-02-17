<%@page contentType="text/html; charset=utf-8" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page import="service.dto.*" %>
 <% Member member = (Member)request.getAttribute("member"); %>

 <!DOCTYPE html>
 <html>

 <head>
     <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet" />
     <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet" />
     <link href="https://fonts.googleapis.com/css?family=Content&display=swap" rel="stylesheet" />
     <link href="https://fonts.googleapis.com/css?family=Abhaya+Libre+SemiBold&display=swap" rel="stylesheet" />
     <link href="https://fonts.googleapis.com/css?family=Paprika&display=swap" rel="stylesheet" />
     <title>마이프로필수정</title>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
     <link rel=stylesheet href="<c:url value='/css/member.css' />" type="text/css">
     <script>
         function userModify() {
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
             if (emailExp.test(form.email.value) == false) {
                 alert("이메일 형식이 올바르지 않습니다.");
                 form.email.focus();
                 return false;
             }
             /* var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
             if(phoneExp.test(form.phone.value)==false) {
                alert("전화번호 형식이 올바르지 않습니다.");
                form.phone.focus();
                return false;
             } */
             form.submit();
         }

         function userList(targetUri) {
             form.action = targetUri;
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


     .modifyarea {
         width: 100%;
         height: 1350px;
         background-repeat: no-repeat;
         background-position: center-center;
         background-size: cover;
         margin: 40px;
         opacity: 1;
         position: absolute;
         top: 300px;
         left: 0px;
         overflow: hidden;
     }

     .modifytext {
         width: 200px;
         position: absolute;
         top: 50px;
         left: 550px;
         color: rgba(51, 51, 51, 1);
         font-family: Poppins;
         font-weight: Medium;
         font-size: 25px;
         opacity: 1;
         text-align: center;
     }

     .category {
         position: absolute;
         top: 15px;
         left: 20px;
     }

     .inputarea {
         width: 832px;
         height: 600px;
         background: url("../images/inputarea.png");
         background-repeat: no-repeat;
         background-position: center center;
         background-size: cover;
         margin: 24px;
         opacity: 1;
         position: absolute;
         top: 112px;
         left: 480px;
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
         left: 185px;
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

     .part {
         width: 300px;
         height: 43px;
         color: rgba(102, 102, 102, 0.6000000238418579);
         border-radius: 25px;
         position: absolute;
         top: 40px;
         left: 284px;
         font-family: Poppins;
         font-weight: Regular;
         font-size: 16px;
         opacity: 1;
         text-align: left;
     }

     .positionq {
         width: 500px;
         color: rgba(17, 17, 17, 1);
         position: absolute;
         top: 130px;
         left: 275px;
         font-family: Poppins;
         font-weight: Regular;
         font-size: 17px;
         opacity: 1;
         text-align: left;
     }

     .position {
         width: 300px;
         height: 43px;
         color: rgba(102, 102, 102, 0.6000000238418579);
         border-radius: 25px;
         position: absolute;
         top: 170px;
         left: 284px;
         font-family: Poppins;
         font-weight: Regular;
         font-size: 16px;
         opacity: 1;
         text-align: left;
     }
     
       .portfolioq {
         width: 500px;
         color: rgba(17, 17, 17, 1);
         position: absolute;
         top: 255px;
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
         position: absolute;
         top: 295px;
         left: 284px;
         font-family: Poppins;
         font-weight: Regular;
         font-size: 16px;
         opacity: 1;
         text-align: left;
     }
     

     .update {
         width: 200px;
         height: 65px;
         background: rgba(77, 198, 75, 0.8);
         border-radius: 60px;
         border: 0;
         position: absolute;
         bottom: 120px;
         left: 450px;
         font-family: Inter;
         font-weight: Regular;
         font-size: 25px;
         color: white;
         opacity: 1;
         text-align: center;
     }

     .cancel {
         width: 200px;
         height: 65px;
         background: #E6E6E6;
         border-radius: 60px;
         border: 0;
         position: absolute;
         bottom: 120px;
         left: 670px;
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

     .aply_list {
         width: 100%;
         height: 800px;
         background: url("../images/aply_list.png");
         position: absolute;
         top: 240px;

     }

     .mtrlist_area {
         width: 100%;
         height: 400px;
         background: url("../images/mtrlist_area.png");
         position: absolute;
         top: 490px;
     }

     .mtrlist {
         color: rgba(51, 51, 51, 1);
         font-family: Poppins;
         font-weight: Medium;
         font-size: 25px;
         opacity: 1;
         text-align: center;
         position: absolute;
         left: 625px;
     }

     .stdlist_area {
         width: 100%;
         height: 400px;
         background: url("../images/stdlist_area.png");
         position: absolute;
         top: 900px;

     }

     .stdlist {
         color: rgba(51, 51, 51, 1);
         position: absolute;
         top: 0px;
         left: 625px;
         font-family: Poppins;
         font-weight: Medium;
         font-size: 25px;
         opacity: 1;
         text-align: center;
     }

     .introarea {

         width: 100%;
         height: 80px;
         background: url("../images/introarea.png");
         position: absolute;
         top: 250px;
         left: 200px
     }

     .intro {
         width: 1000px;
         color: rgba(75, 75, 75, 1);
         position: absolute;
         left: 250px;
         font-family: Roboto;
         font-weight: Regular;
         font-size: 27px;
         opacity: 1;

     }

     .v81_693 {
         width: 957px;
         height: 98px;
         background: url("../images/v81_693.png");
         background-repeat: no-repeat;
         background-position: center center;
         background-size: cover;
         opacity: 1;
         position: absolute;
         top: 93px;
         left: 103px;
         overflow: hidden;
     }

     .v81_694 {
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

     .v81_695 {
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

    a:link {
        color: black;
    }

    a:hover {
        color: rgba(77, 198, 75, 0.8);
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

     .register {
         width: 300px;
         height: 100px;
         background-repeat: no-repeat;
         background-position: center center;
         background-size: cover;
         opacity: 1;
         position: absolute;
         top: 2130px;
         left: 500px;
         overflow: hidden;
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
            }

            li a.active {
                background-color: #4CAF50;
                color: white;
            }

            li a:hover:not(.active) {
                background-color: #555;
                color: white;
            }

 </style>

 <body>


     <div id='palette' class='palette'>Palette</div>
     <form name="f" method="POST" action="<c:url value='/view/search'/>">
         <input type='text' id='search' class='search' value='분야를 검색하세요' name='part'>
         <button id='button' class='button2' type='submit'>검색</button>
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

     <div style="float:left;">
         <h1><a href="<c:url value='/view/main'/>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;홈</a></h1>
     </div>
     <div style="float:left;">
         <h1><a href="<c:url value='/study/list'/>">&nbsp;&nbsp;스터디</a></h1>
     </div>
     <div style="float:left;">
         <h1><a href="<c:url value='/mentoring/list'/>">&nbsp;&nbsp;멘토링</a></h1>
     </div>
     <div style="float:left;">
         <h1><a href="<c:url value='/user/list'/>">&nbsp;&nbsp;마이페이지</a></h1>
     </div>
     <br><br><br><br>

     <hr style="border: solid 2px #C7F2A4;">
     <br><br>

     <div class="introarea">
         <span class="intro">내일이 기대되는 <%= member.getPart() %> 개발자 <%=member.getName() %> 입니다.</span>
     </div>


     <!-- registration form  -->
     <form name="form" method="POST" action="<c:url value='/user/update' />">
         <input type="hidden" name="userId" value="<%=member.getId()%>" />
         <!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
         <c:if test="${registerFailed}">
             <font color="red">
                 <c:out value="${exception.getMessage()}" />
             </font>
         </c:if>
         <div class="modifyarea">
         <div class="category">
        <ul>
            <li><a href="<c:url value='/user/list'>
                 <c:param name='userId' value='<%=member.getId()%>'/>
                </c:url>" > 프로필 </a></li>
            <li><a href="<c:url value='/user/update/form'>
                 <c:param name='userId' value='<%=member.getId()%>'/>
                </c:url>" class="active">프로필 수정</a></li>
            <li><a href="<c:url value='/user/apply'>
                 <c:param name='userId' value='<%=member.getId()%>'/>
                </c:url>" > 신청 현황 </a></li>
            <li><a href="<%=member.getPortfolio()%>">포트폴리오</a></li>
        </ul>
    </div>
            
             <span class="modifytext">회원정보 수정</span>
             <div class="inputarea">
                 <span class="idtext">아이디</span>
                 <div><input type="text" name="userId" class="id" value="<%= member.getId() %>" />
                 </div>
                 <div class="name"></div>

                 <span class="pwtext">비밀번호</span>
                 <input type="password" name="password" class="pw" value="<%=member.getPassword()%>" />
                 <div class="name"></div>

                 <span class="pwcheck">비밀번호 확인</span>
                 <input type="password" name="password2" class="pwck" value="<%=member.getPassword()%>" />
                 <div class="name"></div>

                 <span class="nametext">이름</span>
                 <input type="text" name="name" class="names" value="<%=member.getName()%>" />
                 <div class="name"></div>

                 <span class="phonetext">전화번호</span>
                 <input type="text" name="phone" class="phone" placeholder=" ex)010-xxxx-xxxx" value="<%=member.getPhoneNum()%>" />
                 <div class="name"></div>

                 <span class="emailtext">이메일</span>
                 <input type="text" name="email" class="emails" value="<%=member.getEmail()%>">
                 <div class="name"></div>
             </div>

             <div class="qarea">
                 <span class="partq">&#45;&nbsp;개발 분야 또는 관심 분야는 무엇인가요?</span>
                 <input type="text" class="part" value="<%=member.getPart()%>" />

                 <span class="positionq">&#45;&nbsp;'멘토'와 '멘티' 둘 중 어느 역할에 속하시나요?</span>
                 <input type="text" class="position" name="position" value="<%=member.getPosition()%>" />
               
                 <span class="portfolioq">&#45;&nbsp;본인의 포트폴리오 링크를 공유해보세요.</span>
                 <input type="text" class="portfolio" name="portfolio" value="<%=member.getPortfolio()%>" />
                 
                 
             </div>
             
             <input type="button" class="update" value="수정" onClick="userModify()">
             <input type="button" class="cancel" value="취소" onClick="userList('<c:url value='/user/list' />')">
         </div>
     </form>
 </body>

 </html>