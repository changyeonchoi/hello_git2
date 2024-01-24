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
	.coupon-carousel .carousel {
	  display: flex;
	  transition: transform 0.5s ease-in-out;
	  width: 100%; /* 변경된 부분: 이미지 개수 * 100%로 설정 */
	}
	
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
.shop__coupon--photoBox {
  overflow: hidden;
  width: 150px;
  margin: 0 auto;
  position: relative; /* 추가된 부분 */
  left: -20%; /* 추가된 부분: 부모 요소의 가로 중앙으로 이동 */
  transform: translateX(-50%); /* 추가된 부분: 가로 중앙 정렬 */

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
.slide__coupon-box {
  display: flex;
  align-items: center;
  position: absolute;
  z-index: 99;
  color: black;
  bottom: 10px;
  right: 10px; /* 변경된 부분: left 대신 right 사용 */
}

.slide__coupon-box .arrow {
  font-size: 20px;
  margin: 0 5px;
  cursor: pointer;
}
.slide__coupon-box .couponcounter {
  margin: 0 5px;
}
.slide__count-box {
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  z-index: 99;
  color: black;
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
		  <!-- 배너 영역 케러셀 -->
		  <div class="carousel banner-carousel">
		    <c:forEach var="banner" items="${banner}" varStatus="status">
		      <img src="${banner.banner_img}" alt="test"/>
		    </c:forEach>
		  </div>
		  <div class="slide__count-box">
		    <div class="arrow prev" onclick="prevBannerSlide()">❮</div>
		    <div class="counter">1 / 3</div>
		    <div class="arrow next" onclick="nextBannerSlide()">❯</div>
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
              </div>
            </div>
			<div class="shop__main--axeBox">
			  <div class="shop__code--titleBox">
			    <p>쿠폰 할인받기!</p>
			  </div>
			  <!-- 쿠폰 영역 케러셀 -->
			  <div class="shop__coupon--photoBox">
			  <div class="carousel coupon-carousel">
			    <c:forEach var="coupon" items="${coupon}" varStatus="status">
			        <c:choose>
			            <c:when test="${coupon.code eq 'fashion'}">
			                <a href="/fashiondetail?seq_id=${coupon.seq_id}&sale=${coupon.sale}">
			                    <img src="${coupon.banner_img}" alt="Fashion Coupon Image"/>
			                </a>
			            </c:when>
			            <c:when test="${coupon.code eq 'makeup'}">
			                <a href="/makeupdetail?seq_id=${coupon.seq_id}&sale=${coupon.sale}">
			                    <img src="${coupon.banner_img}" alt="Makeup Coupon Image"/>
			                </a>
			            </c:when>
			            <c:when test="${coupon.code eq 'accessory'}">
			                <a href="/accessorydetail?seq_id=${coupon.seq_id}&sale=${coupon.sale}">
			                    <img src="${coupon.banner_img}" alt="Accessory Coupon Image"/>
			                </a>
			            </c:when>
			        </c:choose>
			    </c:forEach>
			  </div>
			  <div class="slide__coupon-box">
			    <div class="arrow prev" onclick="prevCouponSlide()">❮</div>
			    <div class="couponcounter">1 / 3</div>
			    <div class="arrow next" onclick="nextCouponSlide()">❯</div>
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
    // 배너 영역 스크립트
    let currentBannerSlide = 0;
    const bannerSlides = document.querySelectorAll(".banner-carousel img");
    const bannerCounter = document.querySelector(".counter");

    function showBannerSlide(index) {
      if (index < 0) {
        currentBannerSlide = bannerSlides.length - 1;
      } else if (index >= bannerSlides.length) {
        currentBannerSlide = 0;
      } else {
        currentBannerSlide = index;
      }
      const transformValue = -currentBannerSlide * 100 + "%";
      document.querySelector(".banner-carousel").style.transform =
        "translateX(" + transformValue + ")";
      updateBannerCounter();
    }

    function prevBannerSlide() {
      showBannerSlide(currentBannerSlide - 1);
    }

    function nextBannerSlide() {
      showBannerSlide(currentBannerSlide + 1);
    }

    function updateBannerCounter() {
      bannerCounter.textContent = currentBannerSlide + 1 + " / " + bannerSlides.length;
    }

    updateBannerCounter();
      
 	// 쿠폰 영역 스크립트
    let currentCouponSlide = 0;
    const couponSlides = document.querySelectorAll(".coupon-carousel img");
    const couponCounter = document.querySelector(".couponcounter");

    function showCouponSlide(index) {
      if (index < 0) {
        currentCouponSlide = couponSlides.length - 1;
      } else if (index >= couponSlides.length) {
        currentCouponSlide = 0;
      } else {
        currentCouponSlide = index;
      }
      const transformValue = -currentCouponSlide * 100 + "%";
      document.querySelector(".coupon-carousel").style.transform =
        "translateX(" + transformValue + ")";
      updateCouponCounter();
    }

    function prevCouponSlide() {
      showCouponSlide(currentCouponSlide - 1);
    }

    function nextCouponSlide() {
      showCouponSlide(currentCouponSlide + 1);
    }

    function updateCouponCounter() {
      couponCounter.textContent = currentCouponSlide + 1 + " / " + couponSlides.length;
    }

    updateCouponCounter();
    </script>
  </body>
</html>
