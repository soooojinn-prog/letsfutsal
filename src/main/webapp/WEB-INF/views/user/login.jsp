<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="title" value="로그인"/>
  <jsp:param name="menu" value="user"/>
</jsp:include>
<script>
  window.onload = function () {
    var urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('error') === 'true') {
      alert("이메일 또는 비밀번호가 일치하지 않습니다!");
    }
  };
</script>
<div class="row justify-content-center">
  <div class="col-lg-5 col-md-7">
    <div class="card shadow-sm">
      <div class="card-header bg-primary text-white">
        <h4 class="mb-0 fw-bold">로그인</h4>
      </div>
      <div class="card-body">
        <form action="${pageContext.request.contextPath}/user/login" method="post">
          <div class="mb-3">
            <label for="email" class="form-label fw-bold">이메일</label>
            <input type="email" class="form-control" id="email" name="email" required>
          </div>
          <div class="mb-3">
            <label for="password" class="form-label fw-bold">비밀번호</label>
            <input type="password" class="form-control" id="password" name="password" required>
          </div>
          <div class="d-grid gap-2">
            <button type="submit" class="btn btn-primary">로그인</button>
          </div>
        </form>
      </div>
      <div class="card-footer text-center bg-transparent">
        <span class="text-muted">계정이 없으신가요?</span>
        <a href="${pageContext.request.contextPath}/user/register" class="ms-2">회원가입하기</a>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
