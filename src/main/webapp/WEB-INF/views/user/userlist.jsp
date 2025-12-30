<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="title" value="회원 목록"/>
  <jsp:param name="menu" value="user"/>
</jsp:include>
<div class="d-flex justify-content-between align-items-center mb-4">
  <h2 class="fw-bold mb-0">회원 목록</h2>
  <div class="d-flex align-items-center gap-2">
    <label for="sortBy" class="form-label mb-0 fw-bold">정렬:</label>
    <select class="form-select form-select-sm" id="sortBy" style="width: auto;" onchange="location.href='${pageContext.request.contextPath}/user/list?sortBy=' + this.value;">
      <option value="point" ${currentSort == 'point' ? 'selected' : ''}>포인트 높은 순</option>
      <option value="grade" ${currentSort == 'grade' ? 'selected' : ''}>등급 높은 순</option>
      <option value="nickname" ${currentSort == 'nickname' ? 'selected' : ''}>닉네임 순</option>
    </select>
  </div>
</div>
<c:choose>
  <c:when test="${empty users}">
    <div class="alert alert-info">등록된 회원이 없습니다.</div>
  </c:when>
  <c:otherwise>
    <div class="card shadow-sm">
      <div class="table-responsive">
        <table class="table table-hover mb-0">
          <thead class="table-dark">
            <tr>
              <th style="width: 60px;">순위</th>
              <th>닉네임</th>
              <th>성별</th>
              <th>포지션</th>
              <th>포인트</th>
              <th>등급</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="user" items="${users}" varStatus="status">
              <tr>
                <td class="fw-bold text-center">${status.index + 1}</td>
                <td>
                  <a href="${pageContext.request.contextPath}/user/profile/${user.userId}" class="text-decoration-none">${user.nickname}</a>
                </td>
                <td>${user.gender}</td>
                <td>
                  <c:choose>
                    <c:when test="${empty user.preferredPosition}">
                      <span class="text-muted">-</span>
                    </c:when>
                    <c:otherwise>${user.preferredPosition}</c:otherwise>
                  </c:choose>
                </td>
                <td><span class="badge bg-success">${user.point} P</span></td>
                <td><span class="badge bg-primary">${user.grade}</span></td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </c:otherwise>
</c:choose>
<div class="mt-4">
  <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">홈으로</a>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
