<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>fashion_qnainsert</title>
    <link rel="stylesheet" href="resources/css/main.css"/>
    <link rel="stylesheet" href="resources/css/detail.css" />
  </head>
  <body>
    <!-- 상단 바 -->
	<header>
      <div class="logo">
        <a href="main">BT</a>
      </div>
      <nav class="shop-nav">
        <a href="fashionlist" id="selected">Fashion</a>
        <a href="makeuplist">Make Up</a>
        <a href="accessorylist">Accessory</a>
        <a href="#">검색</a>
      </nav>
      <c:if test="${memberVo.user_id == null}">
      <nav class="shop-nav__info">
        <a href="#">MY</a>
        <a href="login" id="loginLink">Login</a>
      </nav>
      </c:if>
      <c:if test="${memberVo.user_id != null}">
      <nav class="shop-nav__info">
        <a href="#">MY</a>
        <a href="${pageContext.request.contextPath}/logout" id="logoutLink">Logout</a>
      </nav>
      </c:if>
    </header>
    <!-- 게시판 상세보기 -->
    <div class="notice__detail--box">
      <h1>게시글 보기</h1>
      <div class="detail__notice">
        <div class="detail__notice--button--box">
          <button class="search--button">찜하기 ♡</button>
        </div>
        <div class="info__box--title">
          <div class="title__box">
            <p>등록자</p>
			<input
			    type="text"
			    class="title__box--user"
			    value="${qnavo.user_id}"
			    disabled
			/>
          </div>
          <div class="title__box">
            <p>제목</p>
            <input
              type="text"
              class="title__box--user"
              value="${qnavo.qna_title}"
              disabled
            />
          </div>
        </div>
        <br />
        <div class="info__box--title">
          <div id="title__box--img" class="title__box">
            <p>이미지</p>
            <div class="title__box--img">
              <img
				src="${qnavo.file_img}"
              />
            </div>
          </div>
          <div id="title__box--content" class="title__box">
            <p>내용</p>
            <input
              type="text"
              class="title__box--user"
              value="${qnavo.qna_detail}"
              disabled
            />
          </div>
          <div class="title__box">
            <p>댓글 달기</p>
            <div class="title__box--content_box">
              <button>댓글 등록하기</button>
              <span>전체댓글(4)</span>
            </div>
          </div>
        </div>
        <div class="cancel__box">
          <button onclick="cancel()">취소</button>
        </div>
      </div>
    </div>
    <script>
    function cancel() {
    	window.location.href = 'fashionqnalist';
    }
    </script>

  </body>
</html>
