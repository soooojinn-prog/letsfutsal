<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="title" value="${user.nickname}님의 프로필"/>
  <jsp:param name="menu" value="user"/>
</jsp:include>
<div class="row justify-content-center">
  <div class="col-lg-6">
    <div class="card shadow-sm">
      <div class="card-header bg-primary text-white">
        <h4 class="mb-0 fw-bold">${user.nickname}님의 프로필</h4>
      </div>
      <div class="card-body">
        <table class="table table-borderless">
          <tr>
            <th class="text-muted" style="width: 120px;">닉네임</th>
            <td>${user.nickname}</td>
          </tr>
          <tr>
            <th class="text-muted">성별</th>
            <td>${user.gender}</td>
          </tr>
          <tr>
            <th class="text-muted">선호 포지션</th>
            <td>
              <c:choose>
                <c:when test="${empty user.preferredPosition}">
                  <span class="text-muted">설정 안 함</span>
                </c:when>
                <c:otherwise>${user.preferredPosition}</c:otherwise>
              </c:choose>
            </td>
          </tr>
          <tr>
            <th class="text-muted">포인트</th>
            <td><span class="badge bg-success">${user.point} P</span></td>
          </tr>
          <tr>
            <th class="text-muted">등급</th>
            <td><span class="badge bg-primary">${user.grade}</span></td>
          </tr>
          <tr>
            <th class="text-muted">가입일</th>
            <td>${user.createdAt}</td>
          </tr>
        </table>
        <c:if test="${not empty user.introduction}">
          <hr>
          <h6 class="fw-bold">자기소개</h6>
          <p class="text-muted mb-0">${user.introduction}</p>
        </c:if>
      </div>
      <div class="card-footer bg-transparent">
        <a href="${pageContext.request.contextPath}/user/list" class="btn btn-outline-primary">회원 목록으로</a>
        <a href="${pageContext.request.contextPath}/" class="btn btn-outline-secondary ms-2">홈으로</a>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
