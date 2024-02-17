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
    List<Mentoring> mentoringList = (List<Mentoring>)request.getAttribute("applyMentoringList");
    List<Study> studyList = (List<Study>)request.getAttribute("applyStudyList");
%>

<!DOCTYPE html>
<html>
<head>
<script>
   function PopupEmpInfo(clicked_element) {
      var row_td = clicked_element.getElementsByTagName("td");
      var modal = document.getElementById("modal_emp_info");
      
      document.getElementById("emp_info_emnum").value = row_td[0].innerHTML;
      // 사원 정보 보기 모달을 보이게 합니다.
      modal.style.display = 'block';
   }
   </script>
<meta charset="UTF-8">
<title>ApplyList</title>
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
   <div style="float:left;"><h1><a href ="<c:url value='/view/main'/>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;홈</a></h1></div>
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
                </c:url>"> 프로필 </a></li>
            <li><a href="<c:url value='/user/update/form'>
                 <c:param name='userId' value='<%=member.getId()%>'/>
                </c:url>">프로필 수정</a></li>
            <li><a href="<c:url value='/user/apply'>
                 <c:param name='userId' value='<%=member.getId()%>'/>
                </c:url>" class="active"> 신청 현황 </a></li>
            <li><a href="<%=member.getPortfolio()%>">포트폴리오</a></li>
        </ul>
    </div>
    <div class="v86_494">
    <div class="mentoring">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;멘토링 현황</div>
    <div class="commTable">
    <table>
      <tr>
        <th class="commHead">멘토 ID</th>
        <th class="commHead">분야</th>
        <th class="commHead">지역</th>
        <th class="commHead">모집 인원</th>
         <th class="commHead">평가</th>
      </tr>
<%
   if (mentoringList != null) {   
     Iterator<Mentoring> mentoringIter = mentoringList.iterator();
   
     //사용자 리스트를 클라이언트에게 보여주기 위하여 출력.
     while ( mentoringIter.hasNext() ) {
      Mentoring mentoring = (Mentoring) mentoringIter.next();
      String leaderId = mentoring.getLeaderId();
      
      
      String part = mentoring.getPart();
      String region = mentoring.getRegion();   
      int quota = mentoring.getQuota();
      int mtrId = mentoring.getmtrId();
%>   

    <tr onclick="PopupEmpInfo(this)">   
        <td width="210" align="center" bgcolor="ffffff" height="20"><%=leaderId%></td>
        <td width="210" align="center" bgcolor="ffffff" style="padding-left: 10">
           <%=part%>
        </td>
        <td width="210" align="center" bgcolor="ffffff" height="20">
         <%=region%>
        </td>
        <td width="210" align="center" bgcolor="ffffff" height="20">
         <%=quota%>
        </td>
        <td width="210" align="center" bgcolor="ffffff" style="padding-left: 10">
         <a href="#open">멘토 평가</a>
          
   </td>
         
</tr>

<%
    }
  }
%>

   </table>
   
   </div>
   
   <div class="white_content" id="open">
              <div>
                 <h2>멘토님의 별점을 남겨주세요😍</h2>
                 <form name="form" method="POST" action="<c:url value='/user/rating' />">
                 <div class="star-rating space-x-4 mx-auto">
                  <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
                  <label for="5-stars" class="star pr-4">★</label>
                  <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
                  <label for="4-stars" class="star">★</label>
                  <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
                  <label for="3-stars" class="star">★</label>
                  <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
                  <label for="2-stars" class="star">★</label>
                  <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
                  <label for="1-star" class="star">★</label>
               </div> 
                  
               

               <%-- <p class="w3-input w3-border" style="height: 50px" id="emp_info_emnum" readonly></p>--%>
               <input type='text' id='emp_info_emnum' name='mentor' value='test용'/>
               <a href="#close"><input type="button" value="취소"></a>
               <input type="button" onClick="form.submit()" value="저장">
                 </div>
                 </form>
           </div>  
       </div>


   
   <div class="study">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;스터디 현황</div>
   <div class="commTable2">
   <table>
      <tr>
        <!-- <td width="200" align="center" bgcolor="E6ECDE" height="22">커뮤니티 ID</td> -->
        <th class="commHead">번호</th>
        <th class="commHead">분야</th>
        <th class="commHead">스터디 한 줄 소개</th>
        <th class="commHead">모집 인원</th>
        <th class="commHead">모집 기한</th>

      </tr>
      <%
// 주의: 아래와 같은 scriptlet은 생략하고 <c:for-each>와 EL로 구현하는 것이 바람직함 (list2.jsp 참조)
   if (studyList != null) {   
     Iterator<Study> studyIter = studyList.iterator();
   
     //사용자 리스트를 클라이언트에게 보여주기 위하여 출력.
     while ( studyIter.hasNext() ) {
      Study study = (Study)studyIter.next();
      
%>           
      <tr>
        <td width="210" align="center" bgcolor="ffffff" height="20">
         <%=study.getStudyId()%>
        </td>
        <td width="210" align="center" bgcolor="ffffff" style="padding-left: 10">
           <%=study.getPart()%>
        </td>
        <td width="210" align="center" bgcolor="ffffff" height="20">
         <%=study.getLeaderId()%>
        </td>
        <td width="210" align="center" bgcolor="ffffff" height="20">
         <%=study.getQuota()%>
        </td>
        <td width="210" align="center" bgcolor="ffffff" height="20">
           <%=study.getDeadline()%>
        </td>
      </tr>
<%
     }
   }
%> 
   </table> 
</div>
 
</html> <br /><br />
<style>
    * {
        box-sizing: border-box;
    }

    body {
        font-size: 14px;
    }
.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}
.white_content {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
}
.white_content:target {
    opacity:1;
    pointer-events: auto;
}
.white_content > div {
   position: absolute;
   top: 300px;
   left: 600px;
   width: 25%;
   height: 25%;
   padding: 16px;
   border: 16px solid orange;
   background-color: white;
   overflow: auto;   
}

    .v86_494 {
        width: 1000px;
        height: 2604px;
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: relative;
        top: 300px;
        left: 300px;
        overflow: hidden;
    }
    
        .menu {
    width: 100%;
  position: absolute;
  top: 145px;
  left: 10px;
    }

    .v53_490 {
        width: 100%;
        height: 1500px;
        background: url("../images/v53_490.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 700px;
        left: 71px;
        overflow: hidden;
    }

    .v53_505 {
        width: 180px;
        height: 26px;
        background: url("../images/v53_505.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 1209px;
        left: 1122px;
        overflow: hidden;
    }

    .name {
        color: #fff;
    }

    .name {
        color: #fff;
    }

    .name {
        color: #fff;
    }

    .name {
        color: #fff;
    }

    .v53_491 {
        width: 100%;
        height: 500px;
        background: rgba(14, 14, 14, 1);
        opacity: 1;
        position: absolute;
        top: 2284px;
        left: 21px;
    }

    .mentoring{
    top: 35px;
    left: 0px;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size: 30px;
    line-height: 42px;
    color: #C7F2A4;
    position: absolute;
}
.study{
    top: 800px;
    left: 310px;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size: 30px;
    line-height: 42px;
    color: #C7F2A4;
    position: absolute;
}
    .v53_494 {
        width: 238px;
        height: 69px;
        background: rgba(77, 198, 75, 0.800000011920929);
        padding: 20px 49px;
        margin: 8px;
        opacity: 1;
        position: absolute;
        top: 215px;
        left: 600px;
        overflow: hidden;
    }

    .v53_495 {
        width: 238px;
        color: rgba(245, 245, 245, 1);
        position: absolute;
        top: 20px;
        left: 49px;
        font-family: Montserrat;
        font-weight: Medium;
        font-size: 24px;
        opacity: 1;
        text-align: left;
    }

    .commTable {
   width : 100%;
   top: 100px;
   left: 0px;
   position: absolute;
    }
    
    .commTable2 {
   width : 100%;
   top: 900px;
   left: 300px;
   position: absolute;
    }

    .profileText {
        width: 1000px;
        color: rgba(0, 0, 0, 1);
        position: absolute;
        top: 250px;
        left: 500px;
        font-family: Roboto;
        font-weight: SemiBold;
        font-size: 40px;
        opacity: 1;
        text-align: left;
    }

    .namearea {
        width: 405px;
        height: 150px;
        background: url("../images/v55_325.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 500px;
        left: 500px;
        overflow: hidden;
    }


    .namebox {
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

    .nametext {
        width: 48px;
        color: rgba(27, 27, 27, 1);
        position: relative;
        top: px;
        left: 0px;
        font-family: Roboto;
        font-weight: SemiBold;
        font-size: 26px;
        opacity: 1;
        text-align: left;
    }

    .names {
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

    .partarea {
        width: 405px;
        height: 120px;
        background: url("../images/partarea.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 950px;
        left: 500px;
        overflow: hidden;
    }
    .partbox {
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

    .parttext {
        width: 195px;
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

    .part {
        width: 82px;
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
        top: 800px;
        left: 500px;
        overflow: hidden;
    }

    .emailbox {
        width: 873px;
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

    .emailtext {
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
  .imgg {
        width: 100px;
     position: relative;
     
        top: 350px;
        left: 900px;         
    }
    .img2 {
        top: 350px;
        position: absolute;
        left: 500px;         
    }
    .email {
        width: 407px;
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


    .category {
        position: absolute;
        top: 350px;
        left: 60px;
    }
    .idarea {
        width: 405px;
        height: 150px;
        background: url("../images/idarea.png");
        ;
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 650px;
        left: 500px;
        overflow: hidden;
    }

    .idbox {
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

    .idtext {
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

    .id {
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
        left: 500px;
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
        top: 1100px;
        left: 500px;
        overflow: hidden;
    }

    .careerbox {
        width: 876px;
        height: 129px;
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
        font-size: 26px;
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
        background: url("../images/v55_365.png");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        opacity: 1;
        position: absolute;
        top: 350px;
        left: 300px;
        overflow: hidden;
    }

    .introbox {
        width: 633px;
        height: 116px;
        background: rgba(255, 255, 255, 1);
        opacity: 1;
        position: relative;
        top: 0px;
        left: 200px;
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
        top: 25px;
        left: 230px;
        font-family: Roboto;
        font-weight: Medium;
        font-size: 24px;
        opacity: 1;
        text-align: left;
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
                color: white;            }

            li a:hover:not(.active) {
                background-color: #555;
                color: white;
            }
  </style>