<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="title" value="팀 목록" />
  <jsp:param name="menu" value="team" />
</jsp:include>
<h2 class="fw-bold mb-4">팀 전체 목록</h2>
<c:choose>
  <c:when test="${empty teams}">
    <div class="alert alert-info">등록된 팀이 없습니다.</div>
  </c:when>
  <c:otherwise>
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
      <c:forEach var="team" items="${teams}">
        <div class="col">
          <div class="card h-100 shadow-sm">
            <div class="card-body">
              <h5 class="card-title fw-bold">${team.teamName}</h5>
              <p class="card-text text-muted small">
                ${team.region} |
                <c:choose>
                  <c:when test="${team.gender == 'BOTH'}">혼성</c:when>
                  <c:when test="${team.gender == 'MALE'}">남성</c:when>
                  <c:when test="${team.gender == 'FEMALE'}">여성</c:when>
                  <c:otherwise>-</c:otherwise>
                </c:choose>
                |
                <c:choose>
                  <c:when test="${team.minGrade == 0}">입문</c:when>
                  <c:when test="${team.minGrade == 1}">초보</c:when>
                  <c:when test="${team.minGrade == 2}">중수</c:when>
                  <c:when test="${team.minGrade == 3}">고수</c:when>
                </c:choose>
                ~
                <c:choose>
                  <c:when test="${team.maxGrade == 0}">입문</c:when>
                  <c:when test="${team.maxGrade == 1}">초보</c:when>
                  <c:when test="${team.maxGrade == 2}">중수</c:when>
                  <c:when test="${team.maxGrade == 3}">고수</c:when>
                </c:choose>
              </p>
            </div>
            <div class="card-footer bg-transparent">
              <a href="${pageContext.request.contextPath}/team/profile/${team.teamId}" class="btn btn-outline-primary btn-sm">상세보기</a>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </c:otherwise>
</c:choose>
<div class="mt-4">
  <a href="${pageContext.request.contextPath}/team" class="btn btn-secondary">팀 메인으로</a>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
