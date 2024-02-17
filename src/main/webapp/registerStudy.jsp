<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String id = (String)request.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>
* {
	margin: 4px 0;
}

.controller {
	padding: 25px 0;
	margin: auto;
	width: 840px;
}

#wriTitle{
	text-align: center;
	background-color: #B6E388;
	width: 800px;
	height: 20px;
	padding: 12px 0;
	color: white;
}
table {
	width: 840px;
	margin: 25px 0;
	padding: 20px;
	border-collapse: collapse;
}

#category {
	width: 100px;
	height: 30px;
}

#title {
	width: 700px;
	height: 24px;
}

textarea {
	width: 800px;
	height: 400px;
}

.button {
	width: 100px;
	padding: 5px 12px;
	border: none;
	background-color: rgba(77, 198, 75, 0.8);
	color: white;
}

button {
	padding: 5px 12px;
	background-color: white;
	border-color: rgb(180, 180, 180);
	border-width: 1px;
}

textarea {
	resize: none;
}
</style>
</head>
<body>
	<div class="controller">
	<div id="wriTitle"><b>스터디 등록</b></div>
		<form action="<c:url value='/study/Register' />" method="GET">
		<input type="hidden" name="id"  value="<%=id%>" />
			<table>
				<tr>
					<td width="100px">분야</td>
					<td><select name="bbsCategory" id="category" >
							<option>Frontend(web)</option>
							<option>Backend(web)</option>
							<option>ios</option>
							<option>Android</option>
							<option>Game</option>
							<option>Embedded System</option>
							<option>기타</option>
					</select></td>
				</tr>
				<tr>
					<td>지역</td>
					<td><input type="text" name="bbsTitle" required id="title" />
					</td>
				</tr>
				<tr>
			   	<td>마감기한</td>
				<td><input type="date" name="deadline"></td>
				</tr>
                 <tr>
					<td>모집인원</td>
					<td><input type="number" name="quota">
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="bbsTitle" required id="title" />
					</td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="12" cols="50"
							name="bbsContent" required></textarea></td>
				</tr>
				<tr>
								
					<td align="center"><input type="submit" value="등록" class="button"></td>
					<td align="center"><input type="reset" value="내용 초기화" class="button"></td>
				</tr>
			</table>
		</form>
		
		<div>
			<a href="<c:url value='/user/list' />"> //나중에
				<button>홈으로</button>
			</a>
		</div>
	</div>
</body>
</html>
