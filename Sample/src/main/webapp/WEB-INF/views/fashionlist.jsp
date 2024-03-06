<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>fashion_list</title>
    <link rel="stylesheet" href="resources/css/detail.css" />
    <link rel="stylesheet" href="resources/css/main.css" />
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
        <a href="search">검색</a>
      </nav>
	      <c:if test="${membervo.user_id == null}">
	      <nav class="shop-nav__info">
        	<a href="login?returnUrl=mypage" id="loginLink">MY</a>
    		<a href="login?returnUrl=fashionlist">Login</a>
	      </nav>
	      </c:if>
	      <c:if test="${membervo.user_id != null}">
	      <nav class="shop-nav__info">
        	<a href="mypage" onclick="getUserId()">MY</a>
        	<a href="${pageContext.request.contextPath}/logout" id="logoutLink">Logout</a>
	      </nav>
	      </c:if>
    </header>
    <!-- 메인 -->
    <div>
      <div class="box">
        <a href="fashionlist" id="selected">계절 유행 STYLE</a><br /><br />
  		<a href="javascript:void(0);" id="fashionBoard">게시판</a>
      </div>
      <div class="wrap">
        <div id="photoBox" class="shop__header--photoBox">
          <div class="carousel">
	          	<c:forEach var="banner" items="${banner}" varStatus="status">
			    		<img src="${banner.banner_img}" alt="test"/>
				</c:forEach>
          </div>
          <div class="slide__count-box">
            <div class="arrow prev" onclick="prevSlide()">❮</div>
            <div class="counter">1 / 3</div>
            <div class="arrow next" onclick="nextSlide()">❯</div>
          </div>
        </div>

        <div id="main-box" class="shop__main--box">
          <div class="grid-container">
            <c:forEach var="fashion" items="${fashion}" varStatus="status">
	            <div class="grid-item">
		            <a href="/fashiondetail?seq_id=${fashion.seq_id}">
		                <img src="${fashion.file_img}"/>
		            </a>
		            <p class="shop__code--content">
		            	${fashion.banner_title}
		            </p>
	        	</div>
			</c:forEach>
          </div>
        </div>
      </div>
    </div>
<footer>
  <span class="brand">BT</span> SITE<br>
  고객센터 : 010-5674-0712
</footer>
  	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
    let currentSlide = 0;
    const slides = document.querySelectorAll(".carousel img");
    const counter = document.querySelector(".counter");

    function showSlide(index) {
      if (index < 0) {
        currentSlide = slides.length - 1;
      } else if (index >= slides.length) {
        currentSlide = 0;
      } else {
        currentSlide = index;
      }
      // 여기를 증가하면 됩니다.
      const transformValue = -currentSlide * 100 + "%";
      document.querySelector(".carousel").style.transform =
        "translateX(" + transformValue + ")";
      updateCounter();
    }

    function prevSlide() {
      showSlide(currentSlide - 1);
    }

    function nextSlide() {
      showSlide(currentSlide + 1);
    }

    function updateCounter() {
      counter.textContent = currentSlide + 1 + " / " + slides.length;

      // 배너 이미지가 없을 때 숨김 처리
//       const slideCountBox = document.querySelector(".slide__count-box");
//       slideCountBox.style.display = slides.length === 0 ? "none" : "block";
    }

    updateCounter();

    $(document).ready(function() {
        $('#fashionBoard').on('click', function(event) {

          var newURL = "fashionqnalist";

          // 새로운 URL로 이동
          window.location.href = newURL;
        });
    });
    
    function getUserId() {
        var userId = '${membervo.user_id}';
        
        window.location.href = 'mypage?user_id=' + userId;
    }
    </script>
  </body>
</html>
