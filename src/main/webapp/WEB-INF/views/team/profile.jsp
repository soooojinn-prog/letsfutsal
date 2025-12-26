<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="io.github.wizwix.letsfutsal.dto.TeamDTO"%>
<%
TeamDTO team = (TeamDTO)request.getAttribute("team");

    if (team == null) {
%>
<h2>팀 정보를 찾을 수 없습니다.</h2>
<a href="<%=request.getContextPath()%>/team/list">목록으로</a>
<%
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 개별 페이지</title>
</head>
<body>

	<h2><%=team.getTeamName()%></h2>

	팀 이름 :
	<%=team.getTeamId()%><br> 성별 :
	<%=team.getGender()%><br> 등급 :
	<%=team.getMinGrade()%>
	~
	<%=team.getMaxGrade()%><br> 지역 :
	<%=team.getRegion()%><br> 소개 :
	<%=team.getIntroduction()%><br>

	<br>
	<a href="<%=request.getContextPath()%>/team">메인으로</a> &nbsp;|&nbsp;
	<a href="${pageContext.request.contextPath}/team/list">목록으로</a> &nbsp;|&nbsp;
	<a href="<%=request.getContextPath()%>/team/join">팀 가입하기</a>

</body>
</html>