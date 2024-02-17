<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@page import="service.dto.*" %>
<%@page import="controller.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
   @SuppressWarnings("unchecked")
   List<Study> studyList = (List<Study>)request.getAttribute("studyList"); 
   List<Mentoring> mentoringList = (List<Mentoring>)request.getAttribute("mentoringList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchResult</title>
</head>
<style>
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
.memo{

   position: absolute;
   width: 100%;
   height: 180px;
   left: 0px;
   top: 252px;
   
   background: rgba(252, 255, 178, 0.8);
}
.text{
   position: absolute;
   width: 957px;
   height: 98px;
   left: 103px;
   /*top: px;*/
   
   font-family: 'Montserrat';
   font-style: normal;
   font-weight: 500;
   font-size: 30px;
   line-height: 49px;
   display: flex;
   align-items: center;
   letter-spacing: -0.04em;
   
   color: rgba(15, 15, 15, 0.7);
}
.small{
   position: absolute;
   width: 137px;
   height: 20px;
   left: 103px;
   /*top: 248px;*/
   
   font-family: 'Montserrat';
   font-style: normal;
   font-weight: 600;
   font-size: 12px;
   line-height: 20px;
   /* identical to box height*/ 
   
   display: flex;
   align-items: center;
   text-align: center;
   letter-spacing: 0.075em;
   text-transform: uppercase;
   
   color: #959595;
}
.mentoringList{
   position: absolute;
   width: 427px;
   height: 20px;
   left: 0px;
   top: 560px;
   
   font-family: 'Inter';
   font-style: normal;
   font-weight: 700;
   font-size: 35px;
   line-height: 42px;
   display: flex;
   align-items: center;
   text-align: center;
   
   color: #B6E388;
}
.mentoringLank{
   position: absolute;
   width: 100%;
   height: 60%;
   top: 650px;
   <!--background-color : red; -->
   font-family: 'Inter';
   font-style: normal;
   font-weight: 700;
   font-size: 30px;
   line-height: 42px;
   color: #C7F2A4;
   padding: 20px;
   align-items: center;
}
.box1{
   float:left;
   width: 200px;
   height: 300px;
   padding : 30px;
   margin: 20px;
   box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
   border-radius: 15px;
   align-items: center;
   text-align: center;
}
  .num1{ 
    position: relative;
   left: 46%;
   font-family: 'Inter';
   font-style: normal;
   font-weight: 700;
   font-size: 25px;
   line-height: 30px;
   display: flex;
   align-items: center;
   text-align: center;
   color: #B6E388;
}
.photo1{
   width: 100px;
   height: 100px;
   top: 10px;
   left: 30px;
   border-radius: 70%;
   background: url(.jpg);
   border: 6px solid #FFFFFF;
   box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}
.name1{
   height: 54px;
    position: relative;
   left: 40%;
   font-family: 'Inter';
   font-style: normal;
   font-weight: 700;
   font-size: 13px;
   line-height: 19px;
   display: flex;
   align-items: center;
   text-align: center;
   color: #8C8888;
   text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}
.part1{
   height: 54px;
     position: relative;
   left: 38%;
   font-family: 'Inter';
   font-style: normal;
   font-weight: 600;
   font-size: 12px;
   line-height: 15px;
   display: flex;
   align-items: center;
   text-align: center;
   color: #000000;
   text-shadow: 0px 4px 4px
}
.score{
   width: 100px;
   height: 60px;
   background: #B6E388;
   font-family: 'Inter';
   font-style: normal;
   font-weight: 600;
   font-size: 12px;
   color: white;
   padding: 5px;
}
.studyList{
   position: absolute;
   width: 427px;
   height: 20px;
   left: 0px;
   top: 1180px;
   
   font-family: 'Inter';
   font-style: normal;
   font-weight: 700;
   font-size: 35px;
   line-height: 42px;
   display: flex;
   align-items: center;
   text-align: center;
   
   color: #B6E388;
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
.table{
   position: absolute;
   width: 100%;
   height: 60%;
   left: 150px;
   top: 1250px;
   align-items: center;
   text-align: center;
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
.mentoringtable{
   position: absolute;
   width: 100%;
   height: 60%;
   left: 150px;
   top: 630px;
   align-items: center;
   text-align: center;
}
</style>

<body>


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
   
   <br><br><br><br><br><br>
   
   <div style="float:left;"><h1><a href ="<c:url value='/view/main'/>" class = "this">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;홈</a></h1></div>
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
   
<div class='memo'>
      <p class='small'>OUR SERVICE</p>
      <p class='text'>Fill it up with your beautiful colors, the palette is here.</p>
   </div>
   
   <a class="mentoringList">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;검색결과 '멘토링'</a>
   <br><br>
   
   <div class='mentoringtable'>
      <table>
         <tr>
           <!-- <td width="200" align="center" bgcolor="E6ECDE" height="22">커뮤니티 ID</td> -->
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
      int i=0;
        //사용자 리스트를 클라이언트에게 보여주기 위하여 출력.
        while ( mentoringIter.hasNext() ) {
         Mentoring mentoring = (Mentoring)mentoringIter.next();
   %>           
         <tr>
           <td width="210" align="center" bgcolor="ffffff" height="20">
            <%=mentoring.getLeaderId()%>
            </td>
            <td width="210" align="center" bgcolor="ffffff" style="padding-left: 10">
            <%=mentoring.getPart()%>
            </td>
            <td width="210" align="center" bgcolor="ffffff" height="20">
            <%=mentoring.getRegion()%>
            </td>
            <td width="210" align="center" bgcolor="ffffff" height="20">
            <%=mentoring.getQuota()%>
            </td>
            <td width="210" align="center" bgcolor="ffffff" height="20">
            <%=mentoring.getDeadline()%>
            </td>
           <td width="190" align="center" bgcolor="ffffff" style="padding-left: 10">
            <a href="<c:url value='/view/main'>
                     <c:param name='mtrId' value='<%=Integer.toString(mentoring.getmtrId())%>'/>
                    </c:url>">
              click</a>
           </td>
         </tr>
   <%
        }
      }
   %>           
        </table>          
   </div>
   
   <a class="studyList">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;검색결과 '스터디'</a>
   <br><br>
   
   <div class='table'>
      <table>
         <tr>
           <!-- <td width="200" align="center" bgcolor="E6ECDE" height="22">커뮤니티 ID</td> -->
           <th class="commHead">리더 ID</th>
           <th class="commHead">분야</th>
           <th class="commHead">지역</th>
           <th class="commHead">모집 인원</th>
           <th class="commHead">모집 기한</th>
           <th class="commHead">신청</th>
         </tr>
         <%
   // 주의: 아래와 같은 scriptlet은 생략하고 <c:for-each>와 EL로 구현하는 것이 바람직함 (list2.jsp 참조)
      if (studyList != null) {   
        Iterator<Study> studyIter = studyList.iterator();
      int i=0;
        //사용자 리스트를 클라이언트에게 보여주기 위하여 출력.
        while ( studyIter.hasNext() ) {
         Study study = (Study)studyIter.next();
   %>           
         <tr>
           <td width="210" align="center" bgcolor="ffffff" height="20">
            <%=study.getLeaderId()%>
            </td>
            <td width="210" align="center" bgcolor="ffffff" style="padding-left: 10">
            <%=study.getPart()%>
            </td>
            <td width="210" align="center" bgcolor="ffffff" height="20">
            <%=study.getRegion()%>
            </td>
            <td width="210" align="center" bgcolor="ffffff" height="20">
            <%=study.getQuota()%>
            </td>
            <td width="210" align="center" bgcolor="ffffff" height="20">
            <%=study.getDeadline()%>
            </td>
           <td width="190" align="center" bgcolor="ffffff" style="padding-left: 10">
            <a href="<c:url value='/view/main'>
                     <c:param name='studyId' value='<%=Integer.toString(study.getStudyId())%>'/>
                    </c:url>">
              click</a>
           </td>
         </tr>
   <%
        }
      }
   %>           
        </table>          
   </div>
</body>
</html>