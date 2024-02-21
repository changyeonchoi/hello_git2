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
        <a href="#" id="selected">MY</a>
        <a href="${pageContext.request.contextPath}/logout" id="logoutLink">Logout</a>
      </nav>
      </c:if>
    </header>
    <!-- 메인 -->
    <div>
      <div class="box">
        <a
          id="noice__board--non"
          href="../fashion_detail/fashion.html"
          target="_blank"
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
            <p id="selected">상품</p>
            <a href="mypageqna" onclick="getUserId()">게시판</a>
          </div>
          <div class="top-box__total">
            <p>전체</p>
            <p>Fashion</p>
            <p>MakeUp</p>
            <p>Accessory</p>
          </div>
        </div>
        <div id="main-box" class="shop__main--box">
          <div class="grid-container">
            <c:forEach var="productList" items="${productList}" varStatus="status">
	            <div class="grid-item">
		            <a href="/fashiondetail?seq_id=${productList.seq_id}">
		                <img src="${productList.file_img}"/>
		            </a>
		            <p class="shop__code--content">
		            	${productList.banner_title}
		            </p>
	        	</div>
			</c:forEach>
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
        var pageURL = '/mypage';
        if (selectedValue !== '전체' && selectedValue !== '상품' && selectedValue !== '게시판') {
            pageURL += '?code=' + selectedValue;
        }
        
        // 페이지 이동
        window.location.href = pageURL;
    });
});

function getUserId() {
    // membervo.user_id 값을 얻어옴
    var userId = '${membervo.user_id}';
   
    
    // 이후에 필요한 작업 수행
    // 예를 들어, 해당 값으로 서버에 요청을 보내거나 다른 동작 수행 가능
    console.log("User ID:", userId);
    
    // 페이지 이동
    window.location.href = 'mypageqna?user_id=' + userId;
}

</script>
  </body>
</html>
