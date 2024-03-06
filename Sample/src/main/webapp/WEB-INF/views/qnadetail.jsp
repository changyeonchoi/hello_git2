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
  <style>
  </style>
  </head>
  <body>
    <!-- 상단 바 -->
    <header>
      <div class="logo">
        <p>BT</p>
      </div>
      <nav class="shop-nav">
        <a href="fashionlist">Fashion</a>
        <a href="makeuplist">Make Up</a>
        <a href="accessorylist">Accessory</a>
        <a href="search">검색</a>
      </nav>
      <c:if test="${membervo.user_id == null}">
      <nav class="shop-nav__info">
        <a href="login?returnUrl=mypage" id="loginLink">MY</a>
        <a href="login" id="loginLink">Login</a>
      </nav>
      </c:if>
      <c:if test="${membervo.user_id != null}">
      <nav class="shop-nav__info">
        <a href="mypage" onclick="getUserId()">MY</a>
        <a href="${pageContext.request.contextPath}/logout" id="logoutLink">Logout</a>
      </nav>
      </c:if>
    </header>
    <!-- 게시판 상세보기 -->
    <div class="notice__detail--box">
      <h1>게시글 보기</h1>
      <div class="detail__notice">
		<c:if test="${qnavo.qna_like_yn eq 'Y'}">
		    <div class="detail__notice--button--box">
		        <button class="search--button" id="toggleHeart">
		            <span id="heart">${heartCount eq 1 ? '찜하기❤️' : '찜하기♡'}</span>
		        </button>
		    </div>
		</c:if>
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
        <c:if test="${membervo.user_id == qnavo.user_id}">
          <button onclick="update(${qnavo.seq_id})">수정</button>
        </c:if>
        <c:if test="${membervo.user_id != qnavo.user_id}">
        </c:if>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
    function update(seq_id) {
		window.location.href =  'fashionupdateqna?seq_id=' + seq_id;
    }
    function cancel() {
    	window.location.href = 'mypageqna';
    }
    function openPopup() {
        var code = '${qnavo.code}';
        var seq_id = ${qnavo.seq_id};
        var user_id = '${membervo.user_id}';
        var url = 'commentpopup?code=' + code + '&seq_id=' + seq_id + '&user_id=' + user_id;
        window.open(url, '댓글 등록', 'width=500, height=300, left=500, top=200');
    }
    $(document).ready(function() {
        $('#toggleHeart').click(function() {
            var heartElement = $('#heart');
            var heart = ${heartCount};
            var user_id = '${membervo.user_id}';
            var seq_id = ${qnavo.seq_id};
            var code = 'fashion';
            
            $.ajax({
                type: 'post',
                url: 'qnaupHeart',
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify({
                    user_id: user_id,
                    seq_id: seq_id,
                    heart: heart,
                    code: code
                }),
                success: function(data) {
                    console.log(data);
                    if (data && data.action) {
                        var action = data.action;
                        
                        if (action === '삭제') {
                            // 삭제 동작 수행
                            heartElement.text('찜하기♡');
                        } else if (action === '등록') {
                            // 등록 동작 수행
                            heartElement.text('찜하기❤️');
                        }
                    } else {
                        console.error("Invalid response format");
                    }
                }
            });
        });
    });
    function getUserId() {
        var userId = '${membervo.user_id}';
        
        window.location.href = 'mypage?user_id=' + userId;
    }
    </script>

  </body>
</html>
