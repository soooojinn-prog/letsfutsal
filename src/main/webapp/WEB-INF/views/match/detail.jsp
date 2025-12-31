<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="../common/header.jsp">
  <jsp:param name="title" value="매치 상세"/>
  <jsp:param name="menu" value="match"/>
</jsp:include>

<div class="mb-4">
  <a href="${pageContext.request.contextPath}/match" class="btn btn-outline-secondary btn-sm">
    &larr; 목록으로
  </a>
</div>

<div class="row">
  <div class="col-lg-8">
    <div class="card shadow-sm">
      <div class="card-header bg-primary text-white">
        <h4 class="mb-0">매치 상세 정보</h4>
      </div>
      <div class="card-body">
        <div class="row align-items-center py-2">
          <div class="col-4 text-muted">경기 ID</div>
          <div class="col-8 fw-bold">${match.matchId}</div>
        </div>
        <hr>
        <div class="row align-items-center py-2">
          <div class="col-4 text-muted">구장</div>
          <div class="col-8 fw-bold">${match.stadiumName}</div>
        </div>
        <hr>
        <div class="row align-items-center py-2">
          <div class="col-4 text-muted">경기 타입</div>
          <div class="col-8">
            <c:choose>
              <c:when test="${match.matchType == 'INDIVIDUAL'}">
                <span class="badge bg-info">개인 경기</span>
              </c:when>
              <c:when test="${match.matchType == 'TEAM'}">
                <span class="badge bg-warning text-dark">팀 경기</span>
              </c:when>
              <c:otherwise>
                <span class="badge bg-secondary">대여</span>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
        <hr>
        <div class="row align-items-center py-2">
          <div class="col-4 text-muted">경기 날짜</div>
          <div class="col-8">${match.matchDate}</div>
        </div>
        <hr>
        <div class="row align-items-center py-2">
          <div class="col-4 text-muted">경기 시간</div>
          <div class="col-8">${match.startHour} ~ ${match.endHour}</div>
        </div>
        <hr>
        <div class="row align-items-center py-2">
          <div class="col-4 text-muted">성별</div>
          <div class="col-8">
            <c:choose>
              <c:when test="${match.gender == 'MALE'}">
                <span class="badge bg-primary">남성</span>
              </c:when>
              <c:when test="${match.gender == 'FEMALE'}">
                <span class="badge bg-danger">여성</span>
              </c:when>
              <c:otherwise>
                <span class="badge bg-success">혼성</span>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
        <hr>
        <div class="row align-items-center py-2">
          <div class="col-4 text-muted">등급 범위</div>
          <div class="col-8">
            <c:choose>
              <c:when test="${match.minGrade == 0}">입문</c:when>
              <c:when test="${match.minGrade == 1}">초보</c:when>
              <c:when test="${match.minGrade == 2}">중수</c:when>
              <c:when test="${match.minGrade == 3}">고수</c:when>
            </c:choose>
            ~
            <c:choose>
              <c:when test="${match.maxGrade == 0}">입문</c:when>
              <c:when test="${match.maxGrade == 1}">초보</c:when>
              <c:when test="${match.maxGrade == 2}">중수</c:when>
              <c:when test="${match.maxGrade == 3}">고수</c:when>
            </c:choose>
          </div>
        </div>
        <hr>
        <div class="row align-items-center py-2">
          <div class="col-4 text-muted">참여 현황</div>
          <div class="col-8">
            <span class="fs-5 fw-bold text-primary">${match.status}</span>
            <span class="text-muted">/ 10명</span>
            <c:if test="${match.status < 10}">
              <span class="badge bg-success ms-2">참여 가능</span>
            </c:if>
            <c:if test="${match.status >= 10}">
              <span class="badge bg-danger ms-2">마감</span>
            </c:if>
          </div>
        </div>
      </div>
      <div class="card-footer">
        <c:if test="${match.status < 10}">
          <button class="btn btn-primary">참여 신청</button>
        </c:if>
        <c:if test="${match.status >= 10}">
          <button class="btn btn-secondary" disabled>마감되었습니다</button>
        </c:if>
      </div>
    </div>
  </div>

  <div class="col-lg-4 mt-4 mt-lg-0">
    <div class="card shadow-sm">
      <div class="card-header">
        <h5 class="mb-0">참여 인원</h5>
      </div>
      <div class="card-body">
        <div class="progress mb-3">
          <div class="progress-bar" role="progressbar" style="width: ${match.status * 10}%">
            ${match.status}/10
          </div>
        </div>
        <p class="text-muted small">
          <c:choose>
            <c:when test="${match.status == 0}">아직 참여자가 없습니다.</c:when>
            <c:when test="${match.status < 5}">참여자를 모집 중입니다.</c:when>
            <c:when test="${match.status < 10}">곧 마감됩니다!</c:when>
            <c:otherwise>모집이 완료되었습니다.</c:otherwise>
          </c:choose>
        </p>
      </div>
    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp"/>
