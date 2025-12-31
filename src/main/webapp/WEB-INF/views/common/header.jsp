<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${param.title} - 렛츠풋살</title>
  <script>const contextPath = '${pageContext.request.contextPath}';</script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/bootstrap/bootstrap.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/common/theme.css"/>
</head>
<body>
  <!-- 헤더 -->
  <header>
    <div class="container py-2">
      <div class="d-flex align-items-center justify-content-between">
        <!-- 로고 -->
        <a href="${pageContext.request.contextPath}/" class="d-inline-flex align-items-center text-decoration-none">
          <img src="${pageContext.request.contextPath}/resources/image/logo/logo.png" height="44" alt="렛츠풋살 로고">
        </a>
        <!-- 회원 링크 -->
        <div class="text-end">
          <c:choose>
            <%--@elvariable id="loginUser" type="io.github.wizwix.letsfutsal.dto.UserDTO"--%>
            <c:when test="${not empty loginUser}">
              <span class="small">${loginUser.nickname}님 환영합니다</span>
              <span class="mx-2 text-muted">|</span>
              <a href="${pageContext.request.contextPath}/user/logout" class="small">로그아웃</a>
              <span class="mx-2 text-muted">|</span>
              <a href="${pageContext.request.contextPath}/user/mypage" class="small">마이페이지</a>
            </c:when>
            <c:otherwise>
              <a href="${pageContext.request.contextPath}/user/login" class="small">로그인</a>
              <span class="mx-2 text-muted">|</span>
              <a href="${pageContext.request.contextPath}/user/register" class="small">회원가입</a>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </header>
  <!-- 네비게이션 -->
  <nav>
    <div class="container">
      <ul class="nav justify-content-center py-2">
        <li class="nav-item">
          <a class="nav-link ${param.menu == 'match' ? 'active' : ''}" href="${pageContext.request.contextPath}/match">매치</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${param.menu == 'team' ? 'active' : ''}" href="${pageContext.request.contextPath}/team">팀</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${param.menu == 'stadium' ? 'active' : ''}" href="${pageContext.request.contextPath}/stadium">구장</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${param.menu == 'rank' ? 'active' : ''}" href="${pageContext.request.contextPath}/rank">랭킹</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${param.menu == 'board' ? 'active' : ''}" href="${pageContext.request.contextPath}/free">게시판</a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- 메인 콘텐츠 시작 -->
  <main class="container py-4">
