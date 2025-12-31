<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="../common/header.jsp">
  <jsp:param name="title" value="${article.title}"/>
  <jsp:param name="menu" value="board"/>
</jsp:include>

<div class="mb-4">
  <a href="${pageContext.request.contextPath}/free" class="btn btn-outline-secondary btn-sm">
    &larr; 목록으로
  </a>
</div>

<!-- 게시글 -->
<div class="card shadow-sm mb-4">
  <div class="card-header bg-primary text-white">
    <div class="d-flex justify-content-between align-items-center">
      <h5 class="mb-0">
        <c:choose>
          <c:when test="${article.cateName == '공지사항'}"><span class="badge badge-category-notice me-2">${article.cateName}</span></c:when>
          <c:when test="${article.cateName == '구장 리뷰'}"><span class="badge badge-category-review me-2">${article.cateName}</span></c:when>
          <c:when test="${article.cateName == '경기 소감'}"><span class="badge badge-category-impression me-2">${article.cateName}</span></c:when>
          <c:when test="${article.cateName == '팀원 모집'}"><span class="badge badge-category-recruit me-2">${article.cateName}</span></c:when>
          <c:when test="${article.cateName == '중고 거래'}"><span class="badge badge-category-trade me-2">${article.cateName}</span></c:when>
          <c:otherwise><span class="badge bg-secondary me-2">${article.cateName}</span></c:otherwise>
        </c:choose>
        ${article.title}
      </h5>
    </div>
  </div>
  <div class="card-body">
    <div class="d-flex justify-content-between text-muted small mb-3 pb-3 border-bottom">
      <div>
        <span class="me-3">작성자: <strong>${article.authorNickname}</strong></span>
        <span>작성일: <fmt:formatDate value="${article.createdAtAsDate}" pattern="yyyy-MM-dd HH:mm"/></span>
      </div>
      <div>조회수: ${article.views}</div>
    </div>
    <div class="article-content" style="min-height: 200px; white-space: pre-wrap; line-height: 1.8;">
${article.content}</div>
  </div>
  <div class="card-footer d-flex justify-content-end gap-2">
    <c:if test="${sessionScope.loginUser.userId == article.authorId}">
      <a href="${pageContext.request.contextPath}/free/edit/${article.articleId}" class="btn btn-warning">수정</a>
      <form action="${pageContext.request.contextPath}/free/delete/${article.articleId}" method="post" class="d-inline" onsubmit="return confirm('정말 삭제하시겠습니까?');">
        <button type="submit" class="btn btn-danger">삭제</button>
      </form>
    </c:if>
  </div>
</div>

<!-- 댓글 섹션 -->
<div class="card shadow-sm">
  <div class="card-header">
    <h5 class="mb-0">댓글 (${comments.size()})</h5>
  </div>
  <div class="card-body">
    <c:forEach var="comment" items="${comments}">
      <div class="mb-3 p-3 rounded ${comment.parentId != null ? 'ms-4 bg-light' : 'bg-white border'}">
        <c:choose>
          <c:when test="${comment.deleted}">
            <div class="text-muted fst-italic">삭제된 댓글입니다.</div>
          </c:when>
          <c:otherwise>
            <div class="d-flex justify-content-between align-items-center mb-2">
              <div>
                <strong>${comment.nickname}</strong>
                <small class="text-muted ms-2">
                  <fmt:formatDate value="${comment.createdAtAsDate}" pattern="yyyy-MM-dd HH:mm"/>
                </small>
              </div>
              <c:if test="${sessionScope.loginUser.userId == comment.authorId}">
                <form action="${pageContext.request.contextPath}/free/comment/delete" method="post" class="d-inline" onsubmit="return confirm('댓글을 삭제하시겠습니까?');">
                  <input type="hidden" name="commentId" value="${comment.commentId}">
                  <input type="hidden" name="articleId" value="${article.articleId}">
                  <button type="submit" class="btn btn-outline-danger btn-sm">삭제</button>
                </form>
              </c:if>
            </div>
            <div style="white-space: pre-wrap;">${comment.content}</div>
            <c:if test="${sessionScope.loginUser.userId != null && comment.parentId == null}">
              <button type="button" class="btn btn-outline-primary btn-sm mt-2" onclick="toggleReplyForm(${comment.commentId})">답글</button>
              <div id="reply-form-${comment.commentId}" class="mt-2" style="display: none;">
                <form action="${pageContext.request.contextPath}/free/comment/write" method="post">
                  <input type="hidden" name="articleId" value="${article.articleId}">
                  <input type="hidden" name="parentId" value="${comment.commentId}">
                  <textarea name="content" class="form-control mb-2" rows="2" placeholder="답글을 입력하세요" required></textarea>
                  <button type="submit" class="btn btn-primary btn-sm">답글 작성</button>
                </form>
              </div>
            </c:if>
          </c:otherwise>
        </c:choose>
      </div>
    </c:forEach>

    <c:if test="${empty comments}">
      <div class="text-center text-muted py-4">첫 댓글을 남겨보세요!</div>
    </c:if>

    <!-- 댓글 작성 폼 -->
    <c:if test="${sessionScope.loginUser.userId != null}">
      <hr>
      <h6 class="mb-3">댓글 작성</h6>
      <form action="${pageContext.request.contextPath}/free/comment/write" method="post">
        <input type="hidden" name="articleId" value="${article.articleId}">
        <textarea name="content" class="form-control mb-2" rows="3" placeholder="댓글을 입력하세요" required></textarea>
        <div class="text-end">
          <button type="submit" class="btn btn-primary">댓글 작성</button>
        </div>
      </form>
    </c:if>
    <c:if test="${sessionScope.loginUser.userId == null}">
      <hr>
      <div class="text-center text-muted">
        댓글을 작성하려면 <a href="${pageContext.request.contextPath}/user/login">로그인</a>이 필요합니다.
      </div>
    </c:if>
  </div>
</div>

<script>
function toggleReplyForm(commentId) {
  const form = document.getElementById('reply-form-' + commentId);
  form.style.display = form.style.display === 'none' ? 'block' : 'none';
}
</script>

<jsp:include page="../common/footer.jsp"/>
