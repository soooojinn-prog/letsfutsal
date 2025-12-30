<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="title" value="${stadium.name}"/>
  <jsp:param name="menu" value="stadium"/>
</jsp:include>
<div class="row">
  <div class="col-lg-8">
    <div class="card shadow-sm">
      <div class="card-header bg-primary text-white">
        <h4 class="mb-0 fw-bold">${stadium.name}</h4>
      </div>
      <div class="card-body">
        <table class="table table-borderless">
          <tr>
            <th class="text-muted" style="width: 120px;">지역</th>
            <td>${stadium.region}</td>
          </tr>
          <tr>
            <th class="text-muted">주소</th>
            <td>${stadium.location}</td>
          </tr>
          <tr>
            <th class="text-muted">운영시간</th>
            <td>${stadium.startHour} ~ ${stadium.endHour}</td>
          </tr>
        </table>
        <hr>
        <h6 class="fw-bold">구장 소개</h6>
        <p class="text-muted">${stadium.introduction}</p>
      </div>
      <div class="card-footer bg-transparent">
        <c:choose>
          <c:when test="${empty loginUser}">
            <button class="btn btn-secondary" disabled>로그인 후 예약 가능</button>
          </c:when>
          <c:otherwise>
            <a href="${pageContext.request.contextPath}/stadium/rent/${stadium.stadiumId}" class="btn btn-success">대여 예약하기</a>
          </c:otherwise>
        </c:choose>
        <a href="${pageContext.request.contextPath}/stadium/list" class="btn btn-outline-secondary ms-2">구장 목록으로</a>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
