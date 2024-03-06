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
    <title>accessory_list</title>

    <link rel="stylesheet" href="resources/css/detail.css" />
    <link rel="stylesheet" href="resources/css/main.css" />
  </head>
  <body>
    <!-- 상단 바 -->
    <header>
      <div class="logo">
        <a href="main" target="_blank">BT</a>
      </div>
      <nav class="shop-nav">
        <a href="fashionlist">Fashion</a>
        <a href="makeuplist">Make Up</a>
        <a href="accessorylist" id="selected">Accessory</a>
        <a href="search">검색</a>
      </nav>
      <c:if test="${membervo.user_id == null}">
      <nav class="shop-nav__info">
        <a href="login?returnUrl=mypage" id="loginLink">MY</a>
    	<a href="login?returnUrl=accessorylist">Login</a>
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
        <a href="accessoryList" id="selected">지금 뜨는 액세서리</a><br /><br />
        <a href="accessoryqnalist">게시판</a>
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
            <c:forEach var="accessory" items="${accessory}" varStatus="status">
	            <div class="grid-item">
		            <a href="/accessorydetail?seq_id=${accessory.seq_id}"> <!-- 여기에 해당 상품의 상세 페이지 URL을 지정 -->
		                <img src="${accessory.file_img}" alt="test"/>
		            </a>
		            <p class="shop__code--content">
		            	${accessory.banner_title}
		            </p>
	        	</div>
			</c:forEach>
<!--             <div class="shop__code--product"> -->
<!--                 <div class="shop__code--ready">	 -->
<!--                   <p>상품 준비중</p> -->
<!--                 </div> -->
<!--              </div> -->
<!--               <img -->
<!--                 src="https://m.gifteabox.com/web/product/big/202209/9ba87936e31b29ebdd3769ff8e9c226f.jpg" -->
<!--                 alt="codeOne" -->
<!--               /> -->
<!--               <p>예시 상품</p> -->
<!--             </div> -->
<!--             <div class="grid-item"> -->
<!--               <img -->
<!--                 src="https://m.youngcode.kr/web/product/big/202109/fae83f9866375e7bc69866a3732ac30b.jpg" -->
<!--                 alt="codeTwo" -->
<!--               /> -->
<!--               <p>예시 상품</p> -->
<!--             </div> -->
<!--             <div class="grid-item"> -->
<!--               <img -->
<!--                 src="https://dabagirl.co.kr/web/product/big/201607/37861_shop1_195611.jpg" -->
<!--                 alt="codeThree" -->
<!--               /> -->
<!--               <p>예시 상품</p> -->
<!--             </div> -->
<!--             <div class="grid-item"> -->
<!--               <img -->
<!--                 src="https://media.bunjang.co.kr/product/201794544_1_1686871596_w360.jpg" -->
<!--                 alt="codeFour" -->
<!--               /> -->
<!--               <p>예시 상품</p> -->
<!--             </div> -->
<!--             <div class="grid-item"> -->
<!--               <img -->
<!--                 src="https://i.pinimg.com/originals/c1/df/fe/c1dffe3a1a0774637b8c5a3e687f2a86.jpg" -->
<!--                 alt="codeFive" -->
<!--               /> -->
<!--               <p>예시 상품</p> -->
<!--             </div> -->
<!--             <div class="grid-item"> -->
<!--               <img -->
<!--                 src="https://cdn.ownerclan.com/4PKtKkFtS5EGEfZPBR9iRfBopdyd_IFD7uCxZkbp2IY/marketize/auto/as/v1.jpg" -->
<!--                 alt="codeSix" -->
<!--               /> -->
<!--               <p>예시 상품</p> -->
<!--             </div> -->
<!--             <div class="grid-item"> -->
<!--               <img -->
<!--                 src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/5349563372/B.jpg?202000000" -->
<!--                 alt="codeSeven" -->
<!--               /> -->
<!--               <p>예시 상품</p> -->
<!--             </div> -->
<!--             <div class="grid-item"> -->
<!--               <img -->
<!--                 src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/5531561782/B.jpg?524000000" -->
<!--                 alt="codeEight" -->
<!--               /> -->
<!--               <p>예시 상품</p> -->
<!--             </div> -->
          </div>
        </div>
      </div>
    </div>
<footer>
  <span class="brand">BT</span> SITE<br>
  고객센터 : 010-5674-0712
</footer>
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

    function getUserId() {
        var userId = '${membervo.user_id}';
        
        window.location.href = 'mypage?user_id=' + userId;
    }
    </script>
  </body>
</html>
