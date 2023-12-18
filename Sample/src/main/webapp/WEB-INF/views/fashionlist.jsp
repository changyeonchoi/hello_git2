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
        <a href="main" target="_blank">BT</a>
      </div>
      <nav class="shop-nav">
        <a href="fashionlist" id="selected">Fashion</a>
        <a href="makeuplist">Make Up</a>
        <a href="accessorylist">Accessory</a>
        <a href="#">검색</a>
      </nav>
      <nav class="shop-nav__info">
        <a href="#">MY</a>
        <a href="login">Login</a>
      </nav>
    </header>
    <!-- 메인 -->
    <div>
      <div class="box">
        <a href="../fashion_detail/fashion.html" target="_blank"
          >계절 유행 STYLE</a
        >
        <p>게시판</p>
      </div>
      <div class="wrap">
        <div id="photoBox" class="shop__header--photoBox">
          <div class="carousel">
            <img
              src="https://img.etnews.com/news/article/2021/10/02/cms_temp_article_02224619369582.png"
              alt="Slide 1"
            />
            <img
              src="https://news.samsungdisplay.com/wp-content/uploads/2022/08/3.png"
              alt="Slide 2"
            />
            <img
              src="https://images.moneycontrol.com/static-mcnews/2022/08/samsung-z-flip-4.jpg?impolicy=website&width=1600&height=900"
              alt="Slide 3"
            />
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
		            <a href="/fashiondetail?seq_id=${fashion.seq_id}"> <!-- 여기에 해당 상품의 상세 페이지 URL을 지정 -->
		                <img src="${fashion.file_img}" alt="test"/>
		            </a>
		            <p class="shop__code--content">
		            	${fashion.banner_title}
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
    }

    updateCounter();

    </script>
  </body>
</html>
