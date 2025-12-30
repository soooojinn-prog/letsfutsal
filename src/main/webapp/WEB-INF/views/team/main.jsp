<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="title" value="팀"/>
  <jsp:param name="menu" value="team"/>
</jsp:include>
<div class="text-center py-5">
  <h2 class="fw-bold mb-4">팀 관리</h2>
  <div class="d-flex justify-content-center gap-3">
    <a href="${pageContext.request.contextPath}/team/list" class="btn btn-primary btn-lg">
      모든 팀 보기
    </a>
    <a href="${pageContext.request.contextPath}/team/create" class="btn btn-success btn-lg">
      팀 생성하기
    </a>
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
