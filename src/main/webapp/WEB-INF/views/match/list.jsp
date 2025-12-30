<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="title" value="경기 목록"/>
  <jsp:param name="menu" value="match"/>
</jsp:include>
<div class="container py-5">
  <h2 class="mb-4 fw-bold text-dark">경기 목록</h2>
  <ul class="nav nav-pills mb-4 bg-white p-2 rounded shadow-sm">
    <li class="nav-item">
      <a class="nav-link ${empty param.tab or param.tab == 'all' ? 'active' : ''}" href="${pageContext.request.contextPath}/match?tab=all">전체</a>
    </li>
    <li class="nav-item">
      <a class="nav-link ${param.tab == 'individual' ? 'active' : ''}" href="${pageContext.request.contextPath}/match?tab=individual">개인 경기</a>
    </li>
    <li class="nav-item">
      <a class="nav-link ${param.tab == 'team' ? 'active' : ''}" href="${pageContext.request.contextPath}/match?tab=team">팀 경기</a>
    </li>
  </ul>
  <%
    var tab = request.getParameter("tab");
    if (tab == null) tab = "";
    String tabStr = switch (tab) {
      case "individual" -> "개인 경기";
      case "team" -> "팀 경기";
      default -> "전체 경기";
    };
    pageContext.setAttribute("tab", tab);
    pageContext.setAttribute("tabStr", tabStr);
  %>
  <div class="alert alert-info py-2 shadow-sm" style="display: inline-block;">
    선택 탭: <strong>${tabStr}</strong>
  </div>
  <div class="card border-0 shadow-sm mb-4 mt-3">
    <div class="card-body p-4">
      <form method="get" class="row g-3 align-items-end">
        <input type="hidden" name="tab" value="${tab}">
        <div class="col-md-3">
          <label class="form-label fw-bold small">지역</label>
          <input type="text" name="region" class="form-control" value="${region}" placeholder="지역">
        </div>
        <div class="col-md-3">
          <label class="form-label fw-bold small">날짜</label>
          <input type="date" name="startHour" class="form-control" value="${startHour}">
        </div>
        <div class="col-md-2">
          <label class="form-label fw-bold small">성별</label>
          <select name="gender" class="form-select">
            <option value="both" ${gender.toString() == 'BOTH' ? 'selected' : ''}>전체</option>
            <option value="male" ${gender.toString() == 'MALE' ? 'selected' : ''}>남성</option>
            <option value="female" ${gender.toString() == 'FAMALE' ? 'selected' : ''}>여성</option>
          </select>
        </div>
        <div class="col-md-2">
          <label class="form-label fw-bold small">등급 (최소~최대)</label>
          <div class="input-group">
            <input type="number" name="minGrade" class="form-control" value="${minGrade}" min="0" max="1" placeholder="0">
            <span class="input-group-text">~</span>
            <input type="number" name="maxGrade" class="form-control" value="${maxGrade}" min="0" max="3" placeholder="3">
          </div>
        </div>
        <div class="col-md-2">
          <label class="form-label fw-bold small">인원</label>
          <input type="number" name="status" class="form-control" value="${status}" min="0" max="10" placeholder="명">
        </div>
        <div class="col-12 text-end mt-4">
          <button type="reset" class="btn btn-light border px-4 me-2">초기화</button>
          <button type="submit" class="btn btn-primary px-4">검색하기</button>
        </div>
      </form>
    </div>
  </div>
  <div class="card border-0 shadow-sm overflow-hidden">
    <div class="table-responsive">
      <table class="table table-hover align-middle mb-0">
        <thead class="table-light">
          <tr>
            <th class="ps-4">ID</th>
            <th>지역</th>
            <th>경기 타입</th>
            <th>날짜</th>
            <th>성별</th>
            <th>분류(등급)</th>
            <th class="text-center">빈 자리</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="m" items="${matches}">
          <tr>
            <td class="ps-4"><a href="${pageContext.request.contextPath}/match/${m.matchId}" class="text-decoration-none fw-bold">#${m.matchId}</a></td>
            <td><span class="badge bg-light text-dark border">${m.region}</span></td>
            <td>
              <c:choose>
                <c:when test="${m.matchType.toString() == 'INDIVIDUAL'}">
                  <span class="badge bg-info-subtle text-info">개인 경기</span>
                </c:when>
                <c:when test="${m.matchType.toString() == 'TEAM'}">
                  <span class="badge bg-warning-subtle text-warning">팀 경기</span>
                </c:when>
                <c:when test="${m.matchType.toString() == 'RENT'}">
                  <span class="badge bg-secondary-subtle text-secondary">구장 대여</span>
                </c:when>
                <c:otherwise>
                  ${m.matchType.toString()}
                </c:otherwise>
              </c:choose>
            </td>
            <td class="small text-muted">${m.matchDate}</td>
            <td>
              <c:choose>
                <c:when test="${m.gender.toString() == 'BOTH'}">혼성</c:when>
                <c:when test="${m.gender.toString() == 'MALE'}">남성</c:when>
                <c:when test="${m.gender.toString() == 'FEMALE'}">여성</c:when>
                <c:otherwise>${m.gender.toString()}</c:otherwise>
              </c:choose>
            </td>
            <td><span class="text-dark small">${m.minGrade} ~ ${m.maxGrade}</span></td>
            <td class="text-center">
              <c:choose>
                <c:when test="${m.status < 10}">
                  <span class="badge rounded-pill bg-success px-3">있음</span>
                </c:when>
                <c:otherwise>
                  <span class="badge rounded-pill bg-danger px-3">없음</span>
                </c:otherwise>
              </c:choose>
            </td>
          </tr>
        </c:forEach>
        <c:if test="${empty matches}">
        <tr>
          <td colspan="7" class="text-center py-5 text-muted">검색 조건에 맞는 결과가 없습니다.</td>
        </tr>
        </c:if>
        </tbody>
      </table>
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
