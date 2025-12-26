<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="io.github.wizwix.letsfutsal.dto.TeamDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>팀 전체 목록</title>
</head>
<body>

	<h2>팀 전체 목록</h2>

	<ul>
		<%
		List<TeamDTO> teams = (List<TeamDTO>) request.getAttribute("teams");

		if (teams == null || teams.isEmpty()) {
		%>
		<li>등록된 팀이 없습니다.</li>
		<%
		} else {
		for (TeamDTO t : teams) {
		%>
		<li><a
			href="<%=request.getContextPath()%>/team/profile/<%=t.getTeamId()%>">
				팀 ID : <%=t.getTeamId()%>
		</a></li>
		<%
		}
		}
		%>
	</ul>

	<hr>

	<a href="<%=request.getContextPath()%>/team">메인으로</a> 

</body>
</html>
