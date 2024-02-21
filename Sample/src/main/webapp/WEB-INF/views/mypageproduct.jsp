<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
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
        <a href="../index.html">BT</a>
      </div>
      <nav class="shop-nav">
        <a href="../shop_detail/detail.html">Fashion</a>
        <a href="#">Make Up</a>
        <a href="#">Accessory</a>
        <a href="../shop_search/search.html">검색</a>
      </nav>
      <nav class="shop-nav__info">
        <a href="#" id="selected">MY</a>
        <a href="#">Login</a>
      </nav>
    </header>
    <!-- 메인 -->
    <div>
      <div class="box">
        <a
          id="noice__board--non"
          href="mypage"
          >찜</a
        >
        <br />
        <br />
        <a id="selected">주문현황</a>
      </div>

        <!-- 주문 상품 -->
        <div class="ordered-product">
          <h1 id="selected" style="margin-bottom: 20px">주문상품</h1>
          <div class="notice__detail--box">
            <div class="detail__notice">
              <div class="info__box--title">
                <div class="title__box" style="border: unset">
                  <p style="width: 100%; text-align: left; padding-left: 15px">
                    23.09.20
                  </p>
                </div>
                <div class="title__box">
                  <p>상품명</p>
                  <input
                    type="text"
                    class="title__box--user"
                    placeholder="가을용 반지"
                    style="cursor: auto"
                    disabled
                  />
                </div>
              </div>
              <div class="info__box--title">
                <div class="title__box" style="border: unset">
                  <p style="width: 100%; text-align: left; padding-left: 15px">
                    23.09.20
                  </p>
                </div>
                <div class="title__box">
                  <p>상품명</p>
                  <input
                    type="text"
                    class="title__box--user"
                    placeholder="기부목적 반지"
                    style="cursor: auto"
                    disabled
                  />
                </div>
              </div>
              <div class="info__box--title">
                <div class="title__box" style="border: unset">
                  <p style="width: 100%; text-align: left; padding-left: 15px">
                    23.09.20
                  </p>
                </div>
                <div class="title__box">
                  <p>상품명</p>
                  <input
                    type="text"
                    class="title__box--user"
                    placeholder="기부목적 목걸이"
                    style="cursor: auto"
                    disabled
                  />
                </div>
              </div>
              <div class="info__box--title">
                <div class="title__box" style="border: unset">
                  <p style="width: 100%; text-align: left; padding-left: 15px">
                    23.09.20
                  </p>
                </div>
                <div class="title__box">
                  <p>상품명</p>
                  <input
                    type="text"
                    class="title__box--user"
                    placeholder="가을용 반지"
                    style="cursor: auto"
                    disabled
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script>
    
    </script>
  </body>
</html>
