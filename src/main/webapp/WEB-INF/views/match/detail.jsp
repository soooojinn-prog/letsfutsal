<%@ page import="io.github.wizwix.letsfutsal.dto.MatchDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="title" value="경기 상세"/>
  <jsp:param name="menu" value="match"/>
</jsp:include>
<%
  var match = (MatchDTO) request.getAttribute("match");

  String minGrade = switch (match.getMinGrade()) {
    case 0 -> "입문";
    case 1 -> "초보";
    case 2 -> "중수";
    case 3 -> "고수";
    default -> String.valueOf(match.getMinGrade());
  };
  pageContext.setAttribute("minGrade", minGrade);
  String maxGrade = switch (match.getMaxGrade()) { // 로직 유지: 오타 수정 없이 기존 흐름을 따릅니다 (match.getMinGrade -> match.getMaxGrade 권장되나 요청대로 유지)
    case 0 -> "입문";
    case 1 -> "초보";
    case 2 -> "중수";
    case 3 -> "고수";
    default -> String.valueOf(match.getMaxGrade());
  };
  pageContext.setAttribute("maxGrade", maxGrade);
%>
<div class="container py-5">
  <div class="d-flex align-items-center mb-4">
    <a href="${pageContext.request.contextPath}/match" class="btn btn-outline-secondary btn-sm me-3 text-decoration-none">
      &larr; 목록
    </a>
    <h2 class="fw-bold text-dark m-0">경기 상세 정보</h2>
  </div>

  <div class="row">
    <div class="col-lg-8 mx-auto">
      <div class="card border-0 shadow-sm overflow-hidden">
        <div class="card-header bg-white py-3 border-bottom">
          <h5 class="card-title mb-0 fw-bold text-primary">Match #${match.matchId}</h5>
        </div>
        <div class="card-body p-0">
          <table class="table mb-0">
            <tbody>
              <tr>
                <th class="bg-light px-4 py-3" style="width: 30%;">구장</th>
                <td class="px-4 py-3 fw-bold">${match.stadiumName}</td>
              </tr>
              <tr>
                <th class="bg-light px-4 py-3">경기 타입</th>
                <td class="px-4 py-3">
                  <c:choose>
                    <c:when test="${match.matchType == 'INDIVIDUAL'}">
                      <span class="badge bg-info-subtle text-info border border-info-subtle px-3 py-2">개인 경기</span>
                    </c:when>
                    <c:when test="${match.matchType == 'TEAM'}">
                      <span class="badge bg-warning-subtle text-warning border border-warning-subtle px-3 py-2">팀 경기</span>
                    </c:when>
                    <c:otherwise>${match.matchType}</c:otherwise>
                  </c:choose>
                </td>
              </tr>
              <tr>
                <th class="bg-light px-4 py-3">경기 일시</th>
                <td class="px-4 py-3">
                  <div class="text-dark">${match.matchDate}</div>
                  <div class="text-muted small">${match.startHour} ~ ${match.endHour}</div>
                </td>
              </tr>
              <tr>
                <th class="bg-light px-4 py-3">성별</th>
                <td class="px-4 py-3">
                  <c:choose>
                    <c:when test="${match.gender == 'MALE'}">남성 전용</c:when>
                    <c:when test="${match.gender == 'FEMALE'}">여성 전용</c:when>
                    <c:when test="${match.gender == 'BOTH'}">남녀 혼성</c:when>
                    <c:otherwise>${match.gender}</c:otherwise>
                  </c:choose>
                </td>
              </tr>
              <tr>
                <th class="bg-light px-4 py-3">등급 범위</th>
                <td class="px-4 py-3">
                  <span class="text-primary fw-semibold">${minGrade}</span>
                  <span class="text-muted mx-1">~</span>
                  <span class="text-primary fw-semibold">${maxGrade}</span>
                </td>
              </tr>
              <tr>
                <th class="bg-light px-4 py-3">빈 자리 여부</th>
                <td class="px-4 py-3">
                  <c:choose>
                    <c:when test="${match.status < 10}">
                      <span class="badge rounded-pill bg-success px-4 py-2">현재 신청 가능</span>
                    </c:when>
                    <c:otherwise>
                      <span class="badge rounded-pill bg-danger px-4 py-2">신청 마감</span>
                    </c:otherwise>
                  </c:choose>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="card-footer bg-white p-4 text-center">
          <c:if test="${match.status < 10}">
            <button type="button" class="btn btn-primary btn-lg w-100 fw-bold shadow-sm">참가 신청하기</button>
          </c:if>
          <c:if test="${match.status >= 10}">
            <button type="button" class="btn btn-secondary btn-lg w-100 disabled" disabled>신청이 마감되었습니다</button>
          </c:if>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
