<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="../common/header.jsp">
  <jsp:param name="title" value="검색 결과"/>
  <jsp:param name="menu" value="board"/>
</jsp:include>

<div class="d-flex justify-content-between align-items-center mb-4">
  <h2 class="fw-bold mb-0">검색 결과</h2>
  <a href="${pageContext.request.contextPath}/free" class="btn btn-outline-secondary">목록으로</a>
</div>

<!-- 검색 정보 -->
<div class="alert alert-info">
  <strong>검색 조건:</strong>
  <c:if test="${not empty query}">제목/내용: ${query}</c:if>
  <c:if test="${not empty writer}"> | 작성자: ${writer}</c:if>
  <br>
  <strong>검색 결과:</strong> 총 ${totalCount}개의 게시글
</div>

<!-- 검색 결과 목록 -->
<div class="card shadow-sm">
  <div class="table-responsive">
    <table class="table table-hover mb-0">
      <thead class="table-dark">
        <tr>
          <th width="8%">번호</th>
          <th width="12%">카테고리</th>
          <th width="40%">제목</th>
          <th width="12%">작성자</th>
          <th width="15%">작성일</th>
          <th width="8%">조회수</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="article" items="${articles}">
          <tr>
            <td>${article.articleId}</td>
            <td>
              <c:choose>
                <c:when test="${article.cateName == '공지사항'}"><span class="badge badge-category-notice">${article.cateName}</span></c:when>
                <c:when test="${article.cateName == '구장 리뷰'}"><span class="badge badge-category-review">${article.cateName}</span></c:when>
                <c:when test="${article.cateName == '경기 소감'}"><span class="badge badge-category-impression">${article.cateName}</span></c:when>
                <c:when test="${article.cateName == '팀원 모집'}"><span class="badge badge-category-recruit">${article.cateName}</span></c:when>
                <c:when test="${article.cateName == '중고 거래'}"><span class="badge badge-category-trade">${article.cateName}</span></c:when>
                <c:otherwise><span class="badge bg-secondary">${article.cateName}</span></c:otherwise>
              </c:choose>
            </td>
            <td>
              <a href="${pageContext.request.contextPath}/free/view/${article.articleId}" class="text-decoration-none text-dark">
                ${article.title}
              </a>
            </td>
            <td>${article.authorNickname}</td>
            <td><fmt:formatDate value="${article.createdAtAsDate}" pattern="yyyy-MM-dd HH:mm"/></td>
            <td>${article.views}</td>
          </tr>
        </c:forEach>
        <c:if test="${empty articles}">
          <tr>
            <td colspan="6" class="text-center py-4 text-muted">검색 결과가 없습니다.</td>
          </tr>
        </c:if>
      </tbody>
    </table>
  </div>
</div>

<!-- 페이지네이션 -->
<nav class="mt-4">
  <ul class="pagination justify-content-center">
    <c:if test="${currentPage > 1}">
      <li class="page-item">
        <c:url var="prevUrl" value="${pageContext.request.contextPath}/free/search">
          <c:param name="query" value="${query}"/>
          <c:param name="writer" value="${writer}"/>
          <c:param name="page" value="${currentPage - 1}"/>
        </c:url>
        <a class="page-link" href="${prevUrl}">&laquo; 이전</a>
      </li>
    </c:if>

    <c:forEach begin="1" end="${totalPages}" var="i">
      <c:url var="pageUrl" value="${pageContext.request.contextPath}/free/search">
        <c:param name="query" value="${query}"/>
        <c:param name="writer" value="${writer}"/>
        <c:param name="page" value="${i}"/>
      </c:url>
      <li class="page-item ${currentPage == i ? 'active' : ''}">
        <a class="page-link" href="${pageUrl}">${i}</a>
      </li>
    </c:forEach>

    <c:if test="${currentPage < totalPages}">
      <li class="page-item">
        <c:url var="nextUrl" value="${pageContext.request.contextPath}/free/search">
          <c:param name="query" value="${query}"/>
          <c:param name="writer" value="${writer}"/>
          <c:param name="page" value="${currentPage + 1}"/>
        </c:url>
        <a class="page-link" href="${nextUrl}">다음 &raquo;</a>
      </li>
    </c:if>
  </ul>
</nav>

<jsp:include page="../common/footer.jsp"/>
