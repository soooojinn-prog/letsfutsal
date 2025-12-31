<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="title" value="랭킹"/>
  <jsp:param name="menu" value="rank"/>
</jsp:include>
  <h2 class="fw-bold mb-4">랭킹</h2>
  <ul class="nav nav-tabs mb-4">
    <li class="nav-item">
      <a class="nav-link ${type == 'individual' ? 'active' : ''}" href="${pageContext.request.contextPath}/rank?type=individual">개인 랭킹</a>
    </li>
    <li class="nav-item">
      <a class="nav-link ${type == 'team' ? 'active' : ''}" href="${pageContext.request.contextPath}/rank?type=team">팀 랭킹</a>
    </li>
    <li class="nav-item">
      <a class="nav-link ${type == 'gender' ? 'active' : ''}" href="${pageContext.request.contextPath}/rank?type=gender">성별 랭킹</a>
    </li>
  </ul>
  <div class="card shadow-sm mb-4">
  <div class="card-body">
    <form class="row g-3 align-items-end" method="get" action="${pageContext.request.contextPath}/rank">
      <input type="hidden" name="type" value="${type}">
      <div class="col-auto">
        <label for="grade" class="form-label fw-bold">등급</label>
        <select name="grade" id="grade" class="form-select">
          <option value="-1" ${selectedGrade == -1 ? 'selected' : ''}>전체</option>
          <option value="0" ${selectedGrade == 0 ? 'selected' : ''}>입문</option>
          <option value="1" ${selectedGrade == 1 ? 'selected' : ''}>초보</option>
          <option value="2" ${selectedGrade == 2 ? 'selected' : ''}>중수</option>
          <option value="3" ${selectedGrade == 3 ? 'selected' : ''}>고수</option>
        </select>
      </div>
      <c:if test="${type == 'individual'}">
        <div class="col-auto">
          <label for="position" class="form-label fw-bold">포지션</label>
          <select name="position" id="position" class="form-select">
            <option value="" ${empty selectedPosition ? 'selected' : ''}>전체</option>
            <option value="GK" ${selectedPosition == 'GK' ? 'selected' : ''}>골키퍼 (GK)</option>
            <option value="DF" ${selectedPosition == 'DF' ? 'selected' : ''}>수비수 (DF)</option>
            <option value="MF" ${selectedPosition == 'MF' ? 'selected' : ''}>미드필더 (MF)</option>
            <option value="FW" ${selectedPosition == 'FW' ? 'selected' : ''}>공격수 (FW)</option>
          </select>
        </div>
      </c:if>
      <c:if test="${type == 'gender'}">
        <div class="col-auto">
          <label for="gender" class="form-label fw-bold">성별</label>
          <select name="gender" id="gender" class="form-select">
            <option value="" ${empty selectedGender ? 'selected' : ''}>전체</option>
            <option value="MALE" ${selectedGender == 'MALE' ? 'selected' : ''}>남성</option>
            <option value="FEMALE" ${selectedGender == 'FEMALE' ? 'selected' : ''}>여성</option>
          </select>
        </div>
      </c:if>
      <div class="col-auto">
        <button type="submit" class="btn btn-primary">검색</button>
      </div>
    </form>
  </div>
</div>
<c:choose>
  <c:when test="${type == 'individual'}">
    <h5 class="fw-bold mb-3">개인 랭킹 TOP 10</h5>
    <div class="card shadow-sm">
      <div class="table-responsive">
        <table class="table table-hover mb-0">
          <thead class="table-dark">
            <tr>
              <th style="width: 60px;">순위</th>
              <th>닉네임</th>
              <th>포지션</th>
              <th>등급</th>
              <th>포인트</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="user" items="${rankings}" varStatus="status">
              <tr>
                <td class="fw-bold text-center">
                  <c:choose>
                    <c:when test="${status.index == 0}"><span class="badge bg-warning text-dark">1</span></c:when>
                    <c:when test="${status.index == 1}"><span class="badge bg-secondary">2</span></c:when>
                    <c:when test="${status.index == 2}"><span class="badge bg-danger">3</span></c:when>
                    <c:otherwise>${status.index + 1}</c:otherwise>
                  </c:choose>
                </td>
                <td>${user.nickname}</td>
                <td>
                  <c:choose>
                    <c:when test="${empty user.preferredPosition}"><span class="text-muted">-</span></c:when>
                    <c:otherwise>${user.preferredPosition}</c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <c:choose>
                    <c:when test="${user.grade == 0}">입문</c:when>
                    <c:when test="${user.grade == 1}">초보</c:when>
                    <c:when test="${user.grade == 2}">중수</c:when>
                    <c:when test="${user.grade == 3}">고수</c:when>
                    <c:otherwise>-</c:otherwise>
                  </c:choose>
                </td>
                <td>${user.point} P</td>
              </tr>
            </c:forEach>
            <c:if test="${empty rankings}">
              <tr><td colspan="5" class="text-center text-muted py-4">데이터가 없습니다.</td></tr>
            </c:if>
          </tbody>
        </table>
      </div>
    </div>
  </c:when>
  <c:when test="${type == 'gender'}">
    <h5 class="fw-bold mb-3">성별 랭킹 TOP 10</h5>
    <div class="card shadow-sm">
      <div class="table-responsive">
        <table class="table table-hover mb-0">
          <thead class="table-dark">
            <tr>
              <th style="width: 60px;">순위</th>
              <th>닉네임</th>
              <th>성별</th>
              <th>등급</th>
              <th>포인트</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="user" items="${rankings}" varStatus="status">
              <tr>
                <td class="fw-bold text-center">
                  <c:choose>
                    <c:when test="${status.index == 0}"><span class="badge bg-warning text-dark">1</span></c:when>
                    <c:when test="${status.index == 1}"><span class="badge bg-secondary">2</span></c:when>
                    <c:when test="${status.index == 2}"><span class="badge bg-danger">3</span></c:when>
                    <c:otherwise>${status.index + 1}</c:otherwise>
                  </c:choose>
                </td>
                <td>${user.nickname}</td>
                <td>
                  <c:choose>
                    <c:when test="${user.gender == 'MALE'}">남성</c:when>
                    <c:when test="${user.gender == 'FEMALE'}">여성</c:when>
                    <c:otherwise>-</c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <c:choose>
                    <c:when test="${user.grade == 0}">입문</c:when>
                    <c:when test="${user.grade == 1}">초보</c:when>
                    <c:when test="${user.grade == 2}">중수</c:when>
                    <c:when test="${user.grade == 3}">고수</c:when>
                    <c:otherwise>-</c:otherwise>
                  </c:choose>
                </td>
                <td>${user.point} P</td>
              </tr>
            </c:forEach>
            <c:if test="${empty rankings}">
              <tr><td colspan="5" class="text-center text-muted py-4">데이터가 없습니다.</td></tr>
            </c:if>
          </tbody>
        </table>
      </div>
    </div>
  </c:when>
  <c:otherwise>
    <h5 class="fw-bold mb-3">팀 랭킹 TOP 10</h5>
    <div class="card shadow-sm">
      <div class="table-responsive">
        <table class="table table-hover mb-0">
          <thead class="table-dark">
            <tr>
              <th style="width: 60px;">순위</th>
              <th>팀명</th>
              <th>지역</th>
              <th>팀원 수</th>
              <th>평균 포인트</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="team" items="${rankings}" varStatus="status">
              <tr>
                <td class="fw-bold text-center">
                  <c:choose>
                    <c:when test="${status.index == 0}"><span class="badge bg-warning text-dark">1</span></c:when>
                    <c:when test="${status.index == 1}"><span class="badge bg-secondary">2</span></c:when>
                    <c:when test="${status.index == 2}"><span class="badge bg-danger">3</span></c:when>
                    <c:otherwise>${status.index + 1}</c:otherwise>
                  </c:choose>
                </td>
                <td>${team.teamName}</td>
                <td>${team.region}</td>
                <td>${team.memberCount}명</td>
                <td>${team.averagePoints} P</td>
              </tr>
            </c:forEach>
            <c:if test="${empty rankings}">
              <tr><td colspan="5" class="text-center text-muted py-4">데이터가 없습니다. (팀 기능 합친 후 사용 가능)</td></tr>
            </c:if>
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
