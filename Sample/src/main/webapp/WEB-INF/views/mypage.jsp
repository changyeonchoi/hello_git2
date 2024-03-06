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
        <a href="search">검색</a>
      </nav>
      <c:if test="${membervo.user_id == null}">
      <nav class="shop-nav__info">
        <a href="#">MY</a>
        <a href="login" id="loginLink">Login</a>
      </nav>
      </c:if>
      <c:if test="${membervo.user_id != null}">
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
          id="selected" >찜</a
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
				    <p id="all">전체</p>
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
    // 페이지 로드 시 현재 URL에서 code 값 가져오기
    var currentCode = getUrlParameter('code');

    // 현재 code 값이 존재하면 해당 값과 일치하는 p에 selected 클래스 추가
    if (currentCode) {
        $('.top-box__total p').each(function() {
            if ($(this).text().toLowerCase() === currentCode) {
                $(this).addClass("selected");
            }
        });
    } else {
        // code 값이 없으면 '전체'에 selected 클래스 추가
        $('#all').addClass("selected");
    }

    // 각 항목 클릭 이벤트
    $('.top-box__total p').click(function() {

        // 선택한 값에 따라 code 설정
        var selectedValue = $(this).text().toLowerCase();

        // 현재 클릭된 p에 selected 클래스 추가
        $(this).addClass("selected");

        // 다른 p에서 selected 클래스 제거
        $('.top-box__total p').not(this).removeClass("selected");

        // 이동할 페이지 URL 설정
        var pageURL = '/mypage';
        if (selectedValue !== '전체' && selectedValue !== '상품' && selectedValue !== '게시판') {
            pageURL += '?code=' + selectedValue;
        }

        // 페이지 이동
        window.location.href = pageURL;
    });

    // URL에서 매개변수 추출하는 함수
    function getUrlParameter(name) {
        name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
        var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
        var results = regex.exec(location.search);
        return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
    }
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
