<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="title" value="구장"/>
  <jsp:param name="menu" value="stadium"/>
</jsp:include>
<div class="text-center py-5">
  <h2 class="fw-bold mb-4">구장 관리</h2>
  <div class="d-flex justify-content-center gap-3">
    <a href="${pageContext.request.contextPath}/stadium/list" class="btn btn-primary btn-lg">
      모든 구장 보기
    </a>
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
