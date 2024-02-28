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
    <title>shop_detail</title>
    <style type="text/css">
    	.center-div {
    	width: 100%;
    	text-align: center;
    	margin-top: 20px; /* 필요에 따라 조절 가능한 상단 여백 */
	}
	.pagination {
    	margin: 0 5px; /* 페이지 번호와 부등호 사이의 간격을 조절할 수 있습니다. */
	}

	.page-number {
    	text-decoration: none;
    	padding: 3px 5px; /* 페이지 번호의 간격 및 여백을 조절할 수 있습니다. */
    	border: 1px solid #ccc; /* 페이지 번호의 테두리를 추가할 수 있습니다. */
    	color: #333; /* 페이지 번호의 글자색을 조절할 수 있습니다. */
	}

	.page-number:hover {
    	background-color: #f5f5f5; /* 마우스 오버 시 배경색을 변경할 수 있습니다. */
	}
    </style>
	<link rel="stylesheet" href="resources/css/main.css" />
    <link rel="stylesheet" href="resources/css/detail.css" />
    <link rel="stylesheet" href="resources/css/mypage.css" />
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
        <a href="accessorylist">Accessory</a>
        <a href="search">검색</a>
      </nav>
 	<c:if test="${memberVo.user_id == null}">
      <nav class="shop-nav__info">
        <a href="login"  id="selected">MY</a>
        <a href="login" id="loginLink">Login</a>
      </nav>
      </c:if>
      <c:if test="${memberVo.user_id != null}">
      <nav class="shop-nav__info">
        <a href="#" id="selected">MY</a>
        <a href="${pageContext.request.contextPath}/logout" id="logoutLink">Logout</a>
      </nav>
    </c:if>
    </header>
    <!-- 메인 -->
    <div>
      <div class="box">
        <a
          href="mypage"
          >찜</a
        >
        <br />
        <br />
        <a href="mypageproduct" id="noice__board">주문현황</a>
      </div>

      <!-- 초기에 보이는 fashion -->
      <div class="wrap">
        <!-- 상품 게시판 전체 패션 메이크업 등... -->
        <div class="top-box">
          <div class="top-box__total">
            <a href="mypage">상품</a>
            <p id="selected">게시판</p>
          </div>
          <div class="top-box__total">
            <p id="selected">전체</p>
            <p>Fashion</p>
            <p>Accessory</p>
          </div>
        </div>
        <!-- 게시판 -->
        <div class="container">
          <div class="search__box">
            <div class="search__box--cotainer">
              <input type="text" placeholder="제목을 입력하세요" />
              <button onclick="goSearch()" class="search-button"></button>
            </div>
          </div>
          <div class="table__container">
            <table>
              <thead>
                <tr>
                  <th>No</th>
                  <th>등록일</th>
                  <th>제목</th>
                  <th>찜개수</th>
                  <th>등록자</th>
                </tr>
              </thead>
              <tbody>
				<c:forEach var="qnaList" items="${qnaList}" varStatus="status">
				        <tr>
				            <td>${qnaList.rnum}</td>
				            <td>
				            <fmt:parseDate value="${qnaList.regdate}" var="regdate" pattern="yyyy-mm-dd"/>
				            <fmt:formatDate value="${regdate}" pattern="yyyy.mm.dd"/>
				            </td>
				            <td>
				            <a href="#" class="detail-link" data-seq-id="${qnaList.seq_id}" data-user-id="${memberVo.user_id}">
				                ${qnaList.qna_title}
				            </a>
				            </td>
				            <td>${qnaList.heartcount}</td>
				            <td>${qnaList.user_id}</td>
				        </tr>
				    </c:forEach>
              </tbody>
            </table>
            <div class="center-div">${navigation}</div>
          </div>
        </div>
      </div>
    </div>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
	$(document).ready(function() {
	    // 각 항목 클릭 이벤트
	    $('.top-box__total p').click(function() {

	        // 선택한 값에 따라 code 설정
	        var selectedValue = $(this).text().toLowerCase();
	        
	        // 이동할 페이지 URL 설정
	        var pageURL = '/mypageqna';
	        if (selectedValue !== '전체' && selectedValue !== '상품' && selectedValue !== '게시판') {
	            pageURL += '?code=' + selectedValue;
	        }
	        
	        // 페이지 이동
	        window.location.href = pageURL;
	    });
	});
    function redirectToMypage() {
        window.location.href = "/mypage";
    }
    $(document).ready(function() {
        // 클래스가 detail-link인 요소를 클릭했을 때의 동작 정의
        $('.detail-link').click(function() {
            // data-seq-id 속성을 통해 seq_id 값을 가져옴
            var seqId = $(this).data('seq-id');
            console.log(seqId);
            console.log(this);
            // data-user-id 속성을 통해 user_id 값을 가져옴
            var userId = $(this).data('user-id');
            
            // user_id가 없으면 로그인 페이지로 이동
            if (!userId) {
                alert("로그인이 필요한 서비스입니다. 로그인 페이지로 이동합니다.");
                window.location.href = '/login';
                return; // 중단하여 뒤의 코드를 실행하지 않도록 함
            }

            // seq_id 값을 사용하여 detail 페이지로 이동
            window.location.href = '/fashionqnadetail?seq_id=' + seqId;
        });
    });
    </script>
  </body>
</html>
