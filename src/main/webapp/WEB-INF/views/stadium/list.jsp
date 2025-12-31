<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="title" value="구장 목록"/>
  <jsp:param name="menu" value="stadium"/>
</jsp:include>
<h2 class="fw-bold mb-4">구장 전체 목록</h2>
<c:choose>
  <c:when test="${empty stadiums}">
    <div class="alert alert-info">등록된 구장이 없습니다.</div>
  </c:when>
  <c:otherwise>
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
      <c:forEach var="stadium" items="${stadiums}">
        <div class="col">
          <div class="card h-100 shadow-sm">
            <div class="card-body">
              <h5 class="card-title fw-bold">${stadium.name}</h5>
              <p class="card-text text-muted small">
                <i class="bi bi-geo-alt"></i> ${stadium.region} | ${stadium.location}
              </p>
              <p class="card-text small">
                운영시간: ${stadium.startHour} ~ ${stadium.endHour}
              </p>
            </div>
            <div class="card-footer bg-transparent">
              <a href="${pageContext.request.contextPath}/stadium/profile/${stadium.stadiumId}" class="btn btn-outline-primary btn-sm">상세보기</a>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </c:otherwise>
</c:choose>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
