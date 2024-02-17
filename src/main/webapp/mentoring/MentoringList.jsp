<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@page import="service.dto.*" %>
<%@page import="controller.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
   @SuppressWarnings("unchecked")
   List<Mentoring> mentoringList = (List<Mentoring>)request.getAttribute("mentorings");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MentoringList</title>
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
.mentoring{

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 30px;
line-height: 42px;
color: #C7F2A4;
}
table {
   margin-left:auto;
   margin-right:auto;
}
td {
   font-family: 돋움;
   font-size: 12px; 
   color: #333333; 
   line-height: 18px;
}
/* td {
   font-family: 돋움;
   font-size: 35px; 
   color: #333333; 
   line-height: 40px;
}

tr {
   width : 100%;
}

.commTable {
   width : 100%;
} */
.title {
   font-family: 돋움;
   font-size: 12pt; 
   font-weight: bold;
   color: Black; 
   background-color: Beige;
   line-height: 22px;
}

.button3{
   position: absolute;
   width: 126px;
   height: 36px;
   top: 304px;
   left: 1257px;
   background: #B6E388;
   text-align: center;
}

</style>
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
   <!-- <a href="<c:url value='/user/login'></c:url>"><input type ='button' id='button' class='button' value='  LOGIN'></a> -->
   <br><br><br><br><br><br>
   
   <div style="float:left;"><h1><a href ="<c:url value='/view/main'/>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;홈</a></h1></div>
   <div style="float:left;"><h1><a href ="<c:url value='/study/list'/>">&nbsp;&nbsp;스터디</a></h1></div>
   <div style="float:left;"><h1><a href ="<c:url value='/mentoring/list'/>"  class = "this">&nbsp;&nbsp;멘토링</a></h1></div>
   <!--<div style="float:left;"><h1><a href ="<c:url value='/user/list'/>" >&nbsp;&nbsp;마이페이지</a></h1></div>  -->
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
   <a class="mentoring">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;멘토링</a>
   <div><a href="<c:url value='/mentoring'/>"><input type='button' class = "button3" value='글쓰기'></a></div>
   <br><br><br><br><br><br>
    <table class="commTable">
      <tr>
        <th class="commHead">멘토 ID</th>
        <th class="commHead">분야</th>
        <th class="commHead">지역</th>
        <th class="commHead">모집 인원</th>
        <th class="commHead">모집 기한</th>
        <th class="commHead">신청</th>
      </tr>

<%
// 주의: 아래와 같은 scriptlet은 생략하고 <c:for-each>와 EL로 구현하는 것이 바람직함 (list2.jsp 참조)
   if (mentoringList != null) {   
     Iterator<Mentoring> mentoringIter = mentoringList.iterator();
   
     //사용자 리스트를 클라이언트에게 보여주기 위하여 출력.
     while ( mentoringIter.hasNext() ) {
      Mentoring mentoring = (Mentoring) mentoringIter.next();
      String leaderId = mentoring.getLeaderId();
      String part = mentoring.getPart();
      String region = mentoring.getRegion();   
      int quota = mentoring.getQuota();
      Date deadLine = mentoring.getDeadline();
      int mtrId = mentoring.getmtrId();
%>   
    <tr>
        <td width="210" align="center" bgcolor="ffffff" height="20">
         <%=leaderId %>
        </td>
        <td width="210" align="center" bgcolor="ffffff" style="padding-left: 10">
           <%=part %>
        </td>
        <td width="210" align="center" bgcolor="ffffff" height="20">
         <%=region %>
        </td>
        <td width="210" align="center" bgcolor="ffffff" height="20">
         <%=quota%>
        </td>
        <td width="210" align="center" bgcolor="ffffff" height="20">
           <%=deadLine%>
          </td>
        <td width="210" align="center" bgcolor="ffffff" style="padding-left: 10">
         <a href="<c:url value='/mentoring/mentoringApply'>
                 <c:param name='mtrId' value='<%=Integer.toString(mtrId) %>'/>
                 </c:url>">click</a>
           </td>
      </tr>
<%
    }
  }
%>
</table>   
</body>

</html>