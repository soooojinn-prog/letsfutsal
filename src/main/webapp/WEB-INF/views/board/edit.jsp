<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="../common/header.jsp">
  <jsp:param name="title" value="글 수정"/>
  <jsp:param name="menu" value="board"/>
</jsp:include>

<div class="mb-4">
  <a href="${pageContext.request.contextPath}/free/view/${article.articleId}" class="btn btn-outline-secondary btn-sm">
    &larr; 돌아가기
  </a>
</div>

<div class="card shadow-sm">
  <div class="card-header bg-warning">
    <h5 class="mb-0">글 수정</h5>
  </div>
  <div class="card-body">
    <form action="${pageContext.request.contextPath}/free/edit/${article.articleId}" method="post">
      <div class="mb-3">
        <label for="cateId" class="form-label fw-bold">카테고리</label>
        <select id="cateId" name="cateId" class="form-select" required>
          <option value="">카테고리를 선택하세요</option>
          <c:forEach var="category" items="${categories}">
            <option value="${category.cateId}" ${category.cateId == article.cateId ? 'selected' : ''}>${category.cateName}</option>
          </c:forEach>
        </select>
      </div>

      <div class="mb-3">
        <label for="title" class="form-label fw-bold">제목</label>
        <input type="text" id="title" name="title" class="form-control" value="${article.title}" required maxlength="100">
      </div>

      <div class="mb-3">
        <label for="content" class="form-label fw-bold">내용</label>
        <textarea id="content" name="content" class="form-control" rows="12" required>${article.content}</textarea>
      </div>

      <div class="d-flex justify-content-center gap-2">
        <button type="submit" class="btn btn-warning px-4">수정 완료</button>
        <a href="${pageContext.request.contextPath}/free/view/${article.articleId}" class="btn btn-secondary px-4">취소</a>
      </div>
    </form>
  </div>
</div>

<jsp:include page="../common/footer.jsp"/>
