<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="title" value="회원가입"/>
  <jsp:param name="menu" value="user"/>
</jsp:include>
<div class="text-center py-5">
  <h2 class="fw-bold mb-4">회원가입</h2>
  <p class="text-muted">회원가입 페이지입니다.</p>
  <a href="${pageContext.request.contextPath}/user/register" class="btn btn-primary">회원가입하기</a>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
