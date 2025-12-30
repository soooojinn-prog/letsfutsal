<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="title" value="마이페이지"/>
  <jsp:param name="menu" value="user"/>
</jsp:include>
<c:choose>
  <c:when test="${not empty sessionScope.loginUser}">
    <div class="row">
      <div class="col-lg-4 mb-4">
        <div class="card shadow-sm">
          <div class="card-header bg-primary text-white">
            <h5 class="mb-0 fw-bold">회원 정보</h5>
          </div>
          <div class="card-body">
            <table class="table table-borderless mb-0">
              <tr>
                <th class="text-muted" style="width: 100px;">이메일</th>
                <td>${loginUser.email}</td>
              </tr>
              <tr>
                <th class="text-muted">성별</th>
                <td>${loginUser.gender}</td>
              </tr>
              <tr>
                <th class="text-muted">포인트</th>
                <td><span class="badge bg-success">${loginUser.point} P</span></td>
              </tr>
              <tr>
                <th class="text-muted">등급</th>
                <td><span class="badge bg-primary">${loginUser.grade}</span></td>
              </tr>
              <tr>
                <th class="text-muted">가입일</th>
                <td>${loginUser.createdAt}</td>
              </tr>
            </table>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card shadow-sm">
          <div class="card-header bg-secondary text-white">
            <h5 class="mb-0 fw-bold">정보 수정</h5>
          </div>
          <div class="card-body">
            <form action="${pageContext.request.contextPath}/user/update" method="post">
              <input type="hidden" name="userId" value="${loginUser.userId}">
              <div class="mb-3">
                <label for="nickname" class="form-label fw-bold">닉네임</label>
                <input type="text" class="form-control" id="nickname" name="nickname" value="${loginUser.nickname}" required>
              </div>
              <div class="mb-3">
                <label for="password" class="form-label fw-bold">새 비밀번호</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="변경하지 않으려면 비워두세요">
                <div class="form-text">변경 시에만 입력하세요.</div>
              </div>
              <div class="mb-3">
                <label for="preferredPosition" class="form-label fw-bold">선호 포지션</label>
                <select class="form-select" id="preferredPosition" name="preferredPosition">
                  <option value="" ${empty loginUser.preferredPosition ? 'selected' : ''}>선택안함</option>
                  <option value="Goalkeeper" ${loginUser.preferredPosition == 'Goalkeeper' ? 'selected' : ''}>Goalkeeper (GK)</option>
                  <option value="Defender" ${loginUser.preferredPosition == 'Defender' ? 'selected' : ''}>Defender (DF)</option>
                  <option value="Midfielder" ${loginUser.preferredPosition == 'Midfielder' ? 'selected' : ''}>Midfielder (MF)</option>
                  <option value="Forward" ${loginUser.preferredPosition == 'Forward' ? 'selected' : ''}>Forward (FW)</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="introduction" class="form-label fw-bold">자기소개</label>
                <textarea class="form-control" id="introduction" name="introduction" rows="4" placeholder="자기소개를 입력하세요...">${loginUser.introduction}</textarea>
              </div>
              <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary">수정하기</button>
                <a href="${pageContext.request.contextPath}/user/logout" class="btn btn-outline-danger">로그아웃</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </c:when>
  <c:otherwise>
    <div class="alert alert-warning text-center">
      <p class="mb-2">로그인이 필요합니다.</p>
      <a href="${pageContext.request.contextPath}/user/login" class="btn btn-primary">로그인하기</a>
    </div>
  </c:otherwise>
</c:choose>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
