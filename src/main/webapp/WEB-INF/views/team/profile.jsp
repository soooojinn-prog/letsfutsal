<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="title" value="${team.teamName}"/>
  <jsp:param name="menu" value="team"/>
</jsp:include>
<script>
  const isLogin = ${loginUser != null};
  function joinTeam() {
    if (!isLogin) {
      alert("로그인 후 가입 가능합니다.");
      return;
    }
    const isConfirmed = confirm("닉네임 : ${loginUser.nickname}\n팀 이름 : ${team.teamName}\n\n해당 팀에 가입하시겠습니까?");
    if (isConfirmed) {
      alert("가입이 완료되었습니다!");
      location.href = "${pageContext.request.contextPath}/team/list";
    }
  }
</script>
<div class="row">
  <div class="col-lg-8">
    <div class="card shadow-sm">
      <div class="card-header bg-primary text-white">
        <h4 class="mb-0 fw-bold">${team.teamName}</h4>
      </div>
      <div class="card-body">
        <table class="table table-borderless">
          <tr>
            <th class="text-muted" style="width: 120px;">성별</th>
            <td><c:choose>
                <c:when test="${team.gender == 'BOTH'}">혼성</c:when>
                <c:when test="${team.gender == 'MALE'}">남성</c:when>
                <c:when test="${team.gender == 'FEMALE'}">여성</c:when>
                <c:otherwise>-</c:otherwise>
              </c:choose></td>
          </tr>
          <tr>
            <th class="text-muted">등급</th>
            <td><c:choose>
                <c:when test="${team.minGrade == 0}">입문</c:when>
                <c:when test="${team.minGrade == 1}">초보</c:when>
                <c:when test="${team.minGrade == 2}">중수</c:when>
                <c:when test="${team.minGrade == 3}">고수</c:when>
              </c:choose> ~ <c:choose>
                <c:when test="${team.maxGrade == 0}">입문</c:when>
                <c:when test="${team.maxGrade == 1}">초보</c:when>
                <c:when test="${team.maxGrade == 2}">중수</c:when>
                <c:when test="${team.maxGrade == 3}">고수</c:when>
              </c:choose></td>
          </tr>
          <tr>
            <th class="text-muted">지역</th>
            <td>${team.region}</td>
          </tr>
          <tr>
            <th class="text-muted">팀 주장</th>
            <td>${team.leaderNickname}</td>
          </tr>
        </table>
        <hr>
        <h6 class="fw-bold">팀 소개</h6>
        <p class="text-muted">${team.introduction}</p>
      </div>
      <div class="card-footer bg-transparent">
        <button type="button" class="btn btn-success" onclick="joinTeam()">팀
          가입하기</button>
        <a href="${pageContext.request.contextPath}/team/list"
           class="btn btn-outline-secondary ms-2">팀 목록으로</a>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
