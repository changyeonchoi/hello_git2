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
    <title>accessory_qnadetail</title>
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
        <a href="fashionlist">Fashion</a>
        <a href="makeuplist">Make Up</a>
        <a href="accessorylist" id="selected">Accessory</a>
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
              <button onclick="openPopup()">댓글 등록하기</button>
              <span>전체댓글(${totalCount})</span>
            </div>
          </div>
        </div>
		<div class="cancel__box">
          <button onclick="cancel()">취소</button>
        <c:if test="${memberVo.user_id == qnavo.user_id}">
          <button onclick="update(${qnavo.seq_id})">수정</button>
        </c:if>
        <c:if test="${memberVo.user_id != qnavo.user_id}">
        </c:if>
        </div>
      </div>
      </div>
    <script>
    function update(seq_id) {
		window.location.href =  'accessoryupdateqna?seq_id=' + seq_id;
    }
    function cancel() {
    	window.location.href = 'accessoryqnalist';
    }
    function openPopup() {
    	var code = '${qnavo.code}';
        var seq_id = ${qnavo.seq_id};
        var url = 'commentpopup?code=' + code + '&seq_id=' + seq_id;
        window.open(url, '댓글 등록', 'width=500, height=300, left=500, top=200');
    }
    </script>

  </body>
</html>
