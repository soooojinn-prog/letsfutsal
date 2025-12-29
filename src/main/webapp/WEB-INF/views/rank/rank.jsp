<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>랭킹 - Let's Futsal</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/rank/rank.css">
  <script src="${pageContext.request.contextPath}/resources/script/bootstrap.bundle.min.js"></script>
  <script>
    function changeFilter(type, grade, position) {
      window.location.href = '${pageContext.request.contextPath}/rank?type=' + type + '&grade=' + grade + '&position=' + position;
    }
  </script>
</head>
<body>
  <div class="container py-4">
    <h1 class="mb-4">랭킹</h1>
    <div class="card mb-4">
      <div class="card-body">
        <div class="mb-3">
          <strong class="me-2">타입:</strong>
          <div class="btn-group" role="group">
            <button type="button" class="btn ${type == 'individual' ? 'btn-info' : 'btn-outline-info'}" onclick="changeFilter('individual', ${selectedGrade}, '${selectedPosition}')">개인</button>
            <button type="button" class="btn ${type == 'team' ? 'btn-info' : 'btn-outline-info'}" onclick="changeFilter('team', ${selectedGrade}, '')">팀</button>
          </div>
        </div>
        <div class="mb-3">
          <strong class="me-2">등급:</strong>
          <div class="btn-group" role="group">
            <button type="button" class="btn ${selectedGrade == -1 ? 'btn-info' : 'btn-outline-info'}" onclick="changeFilter('${type}', -1, '${selectedPosition}')">전체</button>
            <button type="button" class="btn ${selectedGrade == 0 ? 'btn-info' : 'btn-outline-info'}" onclick="changeFilter('${type}', 0, '${selectedPosition}')">입문</button>
            <button type="button" class="btn ${selectedGrade == 1 ? 'btn-info' : 'btn-outline-info'}" onclick="changeFilter('${type}', 1, '${selectedPosition}')">초보</button>
            <button type="button" class="btn ${selectedGrade == 2 ? 'btn-info' : 'btn-outline-info'}" onclick="changeFilter('${type}', 2, '${selectedPosition}')">중수</button>
            <button type="button" class="btn ${selectedGrade == 3 ? 'btn-info' : 'btn-outline-info'}" onclick="changeFilter('${type}', 3, '${selectedPosition}')">고수</button>
          </div>
        </div>
        <c:if test="${type == 'individual'}">
          <div>
            <strong class="me-2">포지션:</strong>
            <div class="btn-group" role="group">
              <button type="button" class="btn ${empty selectedPosition ? 'btn-info' : 'btn-outline-info'}" onclick="changeFilter('${type}', ${selectedGrade}, '')">전체</button>
              <button type="button" class="btn ${selectedPosition == 'Goalkeeper' ? 'btn-info' : 'btn-outline-info'}" onclick="changeFilter('${type}', ${selectedGrade}, 'Goalkeeper')">골키퍼</button>
              <button type="button" class="btn ${selectedPosition == 'Defender' ? 'btn-info' : 'btn-outline-info'}" onclick="changeFilter('${type}', ${selectedGrade}, 'Defender')">수비수</button>
              <button type="button" class="btn ${selectedPosition == 'Midfielder' ? 'btn-info' : 'btn-outline-info'}" onclick="changeFilter('${type}', ${selectedGrade}, 'Midfielder')">미드필더</button>
              <button type="button" class="btn ${selectedPosition == 'Forward' ? 'btn-info' : 'btn-outline-info'}" onclick="changeFilter('${type}', ${selectedGrade}, 'Forward')">공격수</button>
            </div>
          </div>
        </c:if>
      </div>
    </div>

    <c:choose>
      <c:when test="${type == 'individual'}">
        <h2 class="h4 mb-3">개인 랭킹 TOP 10</h2>
        <table class="table table-striped table-hover">
          <thead class="table-info">
            <tr>
              <th>순위</th>
              <th>닉네임</th>
              <th>포인트</th>
              <th>등급</th>
              <th>선호 포지션</th>
            </tr>
          </thead>
          <tbody>
            <c:choose>
              <c:when test="${empty rankings}">
                <tr>
                  <td colspan="5" class="text-center text-muted">랭킹 데이터가 없습니다.</td>
                </tr>
              </c:when>
              <c:otherwise>
                <c:forEach var="user" items="${rankings}" varStatus="status">
                  <tr>
                    <td class="rank-number ${status.index == 0 ? 'gold' : (status.index == 1 ? 'silver' : (status.index == 2 ? 'bronze' : ''))}">
                      ${status.index + 1}위
                    </td>
                    <td>
                      <a href="${pageContext.request.contextPath}/user/profile/${user.userId}" class="text-decoration-none">${user.nickname}</a>
                    </td>
                    <td>${user.point}</td>
                    <td>
                      <c:choose>
                        <c:when test="${user.grade == 0}"><span class="badge bg-secondary">입문</span></c:when>
                        <c:when test="${user.grade == 1}"><span class="badge bg-success">초보</span></c:when>
                        <c:when test="${user.grade == 2}"><span class="badge bg-primary">중수</span></c:when>
                        <c:when test="${user.grade == 3}"><span class="badge bg-danger">고수</span></c:when>
                        <c:otherwise>-</c:otherwise>
                      </c:choose>
                    </td>
                    <td>
                      <c:choose>
                        <c:when test="${user.preferredPosition == 'Goalkeeper'}">골키퍼</c:when>
                        <c:when test="${user.preferredPosition == 'Defender'}">수비수</c:when>
                        <c:when test="${user.preferredPosition == 'Midfielder'}">미드필더</c:when>
                        <c:when test="${user.preferredPosition == 'Forward'}">공격수</c:when>
                        <c:otherwise>-</c:otherwise>
                      </c:choose>
                    </td>
                  </tr>
                </c:forEach>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
      </c:when>
      <c:otherwise>
        <h2 class="h4 mb-3">팀 랭킹 TOP 10</h2>
        <table class="table table-striped table-hover">
          <thead class="table-info">
            <tr>
              <th>순위</th>
              <th>팀명</th>
              <th>평균 포인트</th>
              <th>총 포인트</th>
              <th>멤버 수</th>
              <th>지역</th>
            </tr>
          </thead>
          <tbody>
            <c:choose>
              <c:when test="${empty rankings}">
                <tr>
                  <td colspan="6" class="text-center text-muted">랭킹 데이터가 없습니다.</td>
                </tr>
              </c:when>
              <c:otherwise>
                <c:forEach var="team" items="${rankings}" varStatus="status">
                  <tr>
                    <td class="rank-number ${status.index == 0 ? 'gold' : (status.index == 1 ? 'silver' : (status.index == 2 ? 'bronze' : ''))}">
                      ${status.index + 1}위
                    </td>
                    <td>${team.teamName}</td>
                    <td>${team.averagePoints}</td>
                    <td>${team.totalPoints}</td>
                    <td>${team.memberCount}명</td>
                    <td>${team.region != null ? team.region : '-'}</td>
                  </tr>
                </c:forEach>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
      </c:otherwise>
    </c:choose>
    <div class="mt-4">
      <a href="${pageContext.request.contextPath}/" class="btn btn-outline-secondary">홈으로 돌아가기</a>
    </div>
  </div>
</body>
</html>
