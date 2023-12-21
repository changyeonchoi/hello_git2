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
    <title>shop</title>
<!--     <link rel="stylesheet" href="resources/css/reset.css" /> -->
<!--     <link rel="stylesheet" href="resources/css/main.css" /> -->
  </head>
  <style>
    footer {
    border-top: 1px solid black;
    padding: 10px;
  }

  footer span.brand {
    color: red;
  }
  body {
  --sb-track-color: #ffffff;
  --sb-thumb-color: #060606;
  --sb-size: 5px;
  scrollbar-color: var(--sb-thumb-color) var(--sb-track-color);
}

body::-webkit-scrollbar {
  width: var(--sb-size);
}

body::-webkit-scrollbar-track {
  background: var(--sb-track-color);
  border-radius: 1px;
}

body::-webkit-scrollbar-thumb {
  background: var(--sb-thumb-color);
  border-radius: 1px;
  border: 7px solid #232e33;
}

header {
  color: #333;
  padding: 30px;
  display: flex;
  align-items: center;
  height: 75px;
}
header .logo {
  cursor: pointer;
  width: 10%;
  font-size: 2em !important;
  color: #333;
  font-size: 1.2em;
  font-weight: bold;
  line-height: normal;
  letter-spacing: -0.02em;
  display: flex;
  align-items: center;
  justify-content: center;
}
header .logo p {
  color: #d1180b;
}
header .shop-nav {
  display: flex;
  gap: 32px;
}
header .shop-nav a {
  color: #333;
  font-size: 1.2em;
  font-weight: bold;
  line-height: normal;
  letter-spacing: -0.02em;
}
header .shop-nav a:hover {
    color: #d1180b; 
}
header .shop-nav__info {
  width: 10%;
  margin-left: auto;
}
header .shop-nav__info a {
  color: #333;
  font-size: 1.2em;
  font-weight: bold;
  line-height: normal;
  letter-spacing: -0.02em;
}
header .shop-nav__info a:hover {
    color: #d1180b; 
}
header .shop-nav__info a:first-child {
  margin-right: 15px;
}

.wrap .shop__header--photoBox {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 85%;
  height: 250px;
  overflow: hidden;
  margin: 0 auto;
  margin-bottom: 40px;
}
.wrap .shop__header--photoBox img {
  width: 100%;
  height: 100%;
  -o-object-fit: cover;
     object-fit: cover;
  display: block;
}
.wrap .shop__main--box {
  width: 82%;
  margin-bottom: 100px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
}
.wrap .shop__main--box .shop__code--titleBox {
  display: flex;
  align-items: center;
  justify-content: center;
  color: #333;
  font-size: 1.2em;
  font-weight: bold;
  line-height: normal;
  letter-spacing: -0.02em;
  justify-content: space-between;
  padding: 0px 5px 15px 5px;
}
.wrap .shop__main--box .shop__code--titleBox a {
  font-size: 0.8em;
}
.wrap .shop__main--box .shop__code--Box {
  display: flex;
  align-items: center;
  justify-content: center;
  justify-content: space-between;
}
.wrap .shop__main--box .shop__code--Box .shop__code--product {
  cursor: pointer;
  width: 200px;
  height: 310px;
  margin-right: 26px;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
}
.wrap .shop__main--box .shop__code--Box .shop__code--product img {
  width: 100%;
  height: 100%;
}
.wrap .shop__main--box .shop__code--Box .shop__code--product .shop__code--content {
  width: 100px;
  color: #333;
  font-size: 1.2em;
  font-weight: bold;
  line-height: normal;
  letter-spacing: -0.02em;
  font-size: 15px;
  margin-top: 10px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  transition: all 0.3s ease;
}
.wrap .shop__main--box .shop__code--Box .shop__code--product .shop__code--content:hover {
  width: auto;
  white-space: normal;
  overflow: visible;
  text-overflow: initial;
}
.wrap .shop__main--box .shop__code--Box .shop__code--product:last-child {
  margin-right: unset;
}

.shop__code--ready {
  cursor: no-drop;
  display: flex;
  align-items: center;
  justify-content: center;
  border: 1px solid #ececec;
  width: 100%;
  height: 100%;
  transition: all 0.3s ease;
}
.shop__code--ready:hover {
  color: white;
  background-color: red;
}

.shop__main--axeBox {
  margin-top: 100px;
  margin-bottom: 500px;
}

.shop__header--photoBox {
  overflow: hidden;
  width: 300px;
  margin: 0 auto;
}

.carousel {
  display: flex;
  transition: transform 0.5s ease-in-out;
}

.carousel img {
  width: 100%;
  height: auto;
}

.arrow {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  cursor: pointer;
  font-size: 30px;
}

.prev {
  left: 5px;
}

.next {
  right: 5px;
}

.slide__count-box {
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  z-index: 99;
  color: white;
  width: 7%;
  bottom: 10px;
  left: 10px;
  display: flex;
  align-items: center;
}
.slide__count-box .arrow {
  font-size: 20px;
  margin: 0 5px;
  cursor: pointer;
}
.slide__count-box .counter {
  margin: 0 5px;
}/*# sourceMappingURL=style.css.map */
  </style>
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
    <!-- 메인 -->
    <div class="wrap">
      <div class="shop__header--photoBox">
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
      <!-- 좌측 -->
      <div class="shop__main--box">
        <div class="shop__main--styleBox">
          <div class="shop__main--seasonBox">
            <div class="shop__code--titleBox">
              <p>계절 유행 STYLE</p>
              <a href="fashionlist">더보기</a>
            </div>
            <div class="shop__code--Box">
            <c:forEach var="fashion" items="${fashion}" varStatus="status">
	            <div class="shop__code--product">
		            <a href="/fashiondetail?seq_id=${fashion.seq_id}"> <!-- 여기에 해당 상품의 상세 페이지 URL을 지정 -->
		                <img src="${fashion.file_img}" alt="test"/>
		            </a>
		            <p class="shop__code--content">
		            	${fashion.banner_title}
		            </p>
	        	</div>
			</c:forEach>
<!--               <div class="shop__code--product"> -->
<!--                 <img -->
<!--                   src="https://m.gifteabox.com/web/product/big/202209/9ba87936e31b29ebdd3769ff8e9c226f.jpg" -->
<!--                   alt="code-image" -->
<!--                 /> -->
<!--                 <p class="shop__code--content">가을 코디</p> -->
<!--               </div> -->
<!--               <div class="shop__code--product"> -->
<!--                 <img -->
<!--                   src="https://m.youngcode.kr/web/product/big/202109/fae83f9866375e7bc69866a3732ac30b.jpg" -->
<!--                   alt="code-image" -->
<!--                 /> -->
<!--                 <p class="shop__code--content">초가을 바람막이</p> -->
<!--               </div> -->
<!--               <div class="shop__code--product"> -->
<!--                 <div class="shop__code--ready"> -->
<!--                   <p>상품 준비중</p> -->
<!--                 </div> -->
<!--               </div> -->
            </div>
          </div>
          <div class="shop__main--axeBox">
            <div class="shop__code--titleBox">
              <p>지금 뜨는 액세서리</p>
              <a href="accessorylist">더보기</a>
            </div>
            <div class="shop__code--Box">
            <c:forEach var="accessory" items="${accessory}" varStatus="status">
	            <div class="shop__code--product">
		            <a href="/accessorydetail?seq_id=${accessory.seq_id}"> <!-- 여기에 해당 상품의 상세 페이지 URL을 지정 -->
		                <img src="${accessory.file_img}" alt="test"/>
		            </a>
		            <p class="shop__code--content">
		            	${accessory.banner_title}
		            </p>
	        	</div>
			</c:forEach>
<!--               <div class="shop__code--product"> -->
<!--                 <img -->
<!--                   src="https://cdn.imweb.me/thumbnail/20220423/47b73dd721574.jpg" -->
<!--                   alt="ring-image" -->
<!--                 /> -->
<!--                 <p class="shop__code--content">기부 목적 귀걸이</p> -->
<!--               </div> -->
<!--               <div class="shop__code--product"> -->
<!--                 <img -->
<!--                   src="https://cowx2.cafe24.com/web/product/small/shop1_6eb5e9154055e0c37eb1a8bde6a68326.jpg" -->
<!--                   alt="ring-image" -->
<!--                 /> -->
<!--                 <p class="shop__code--content">블링블링 롱 귀걸이</p> -->
<!--               </div> -->
<!--               <div class="shop__code--product"> -->
<!--                 <img -->
<!--                   src="https://webimg.jestina.co.kr/UpData2/item/G2000014656/20211118105325ZM.jpg" -->
<!--                   alt="ring-image" -->
<!--                 /> -->
<!--                 <p class="shop__code--content">이너용 평평 귀걸이</p> -->
<!--               </div> -->
            </div>
          </div>
        </div>

        <!-- 우측 -->
        <div class="shop__main--makeUpBox">
          <div>
            <div class="shop__main--seasonBox">
              <div class="shop__code--titleBox">
                <p>오늘의 메이크업</p>
                <a href="makeuplist">더보기</a>
              </div>
              <div class="shop__code--Box">
              <c:forEach var="makeup" items="${makeup}" varStatus="status">
	            <div class="shop__code--product">
		            <a href="/makeupdetail?seq_id=${makeup.seq_id}"> <!-- 여기에 해당 상품의 상세 페이지 URL을 지정 -->
		                <img src="${makeup.file_img}" alt="test"/>
		            </a>
		            <p class="shop__code--content">
		            	${makeup.banner_title}
		            </p>
	        	</div>
			  </c:forEach>
<!--                 <div class="shop__code--product"> -->
<!--                   <img -->
<!--                     src="https://mblogthumb-phinf.pstatic.net/MjAyMzAzMDZfMzMg/MDAxNjc4MTA1NTIwNDY0.j7RLMuaEUqEmhDfCIIIPcMJF_q5zV7Ec-oNc2PCuI_Ug.90WZktb3DwK73I6Pg2DqBYWDsxq2f3tB6-AL_rhQdvkg.JPEG.queen3757/%EB%B3%B4%EC%9D%B4%EB%93%9C%EB%B0%94%EC%9D%B4%EB%B0%95%EC%B2%A0_%ED%99%94%EB%B3%B4_%ED%99%9C%EB%B3%B4%EA%B2%BD%EC%9D%80_(14).jpg?type=w800" -->
<!--                     alt="make-image" -->
<!--                   /> -->
<!--                   <p class="shop__code--content">청순 메이크업</p> -->
<!--                 </div> -->
<!--                 <div class="shop__code--product"> -->
<!--                   <img -->
<!--                     src="https://mblogthumb-phinf.pstatic.net/MjAyMzAxMTBfMjcx/MDAxNjczMzUxODQ5MTgx.oRl0kGwM8SjJztTPAT7QHf6JK52DyRz41l9fsj7xxNwg.XrpYHiArqOPx4Aw8TaNsulUPWmTXT8Q2ZahRhLK8_Usg.PNG.juliawed/MIMM2023_(1).png?type=w800" -->
<!--                     alt="make-image" -->
<!--                   /> -->
<!--                   <p class="shop__code--content">글리터로 포인트</p> -->
<!--                 </div> -->
<!--                 <div class="shop__code--product"> -->
<!--                   <img -->
<!--                     src="https://www.iwedding.co.kr/center/iweddingb/product/800_co_sl_m209_14018_1636683168_12733300_3232256100.jpg" -->
<!--                     alt="make-image" -->
<!--                   /> -->
<!--                   <p class="shop__code--content">강렬한 메이크업</p> -->
<!--                 </div> -->
              </div>
            </div>
            <div class="shop__main--axeBox">
              <div class="shop__code--titleBox">
                <p>쿠폰 할인받기!</p>
              </div>
              <div class="shop__code--Box">
                <div class="shop__code--product">
                  <img
                    src="https://img.freepik.com/premium-vector/various-types-of-coupon-mockups-and-points-illustration-set-dollar-present-paper-free-sale_632180-28.jpg"
                    alt="code-image"
                  />
                </div>
              </div>
            </div>
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
        const transformValue = - currentSlide * 100 + "%";
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
      }

      
      updateCounter();
      
    </script>
  </body>
</html>
