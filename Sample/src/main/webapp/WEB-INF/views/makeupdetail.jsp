<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>makeup_detail</title>

    <link rel="stylesheet" href="resources/css/fashion.css" />
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
        <a href="makeuplist" id="selected">Make Up</a>
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
      <div id="box" class="box">
        <a href="makeuplist" target="_blank"
          >계절 유행 STYLE</a
        >
        <p>게시판</p>
      </div>
      <!-- 상세 내용 -->
      <div class="wrap">
        <div id="photoBox" class="shop__header--photoBox">
          <div class="fashion__box">
            <div class="fashion__box--img">
           		<img
                src="${makeup.file_img}"
                alt="fashionTest"
              	/>
            </div>
            <div class="fashion__box--content">
              <div class="fashion__content">
                <h1>${makeup.product_name}</h1>

<!--                 <div class="fashion__box--pay"> -->
<%--                   <p id="pay">정상가 ${makeup.product_amount}원</p> --%>
<!--                 </div> -->
<!--                 <div class="fashion__box--drive"> -->
<%--                   <p>배송비 ${makeup.delivery_fee}원</p> --%>
<!--                 </div> -->
                <div class="fashion__box--sale">
                  <p>업체명 ${makeup.company_name}</p>
                </div>
              </div>
              <button class="fashion__order--btn">사이트보기</button>
            </div>
          </div>
          <div class="shopping--box">
            <button class="fashion__order--btn">찜하기 ♡</button>
          </div>
        </div>
        <div class="fashion__menu--box">
          <div class="fashion__menu--content">
            <p style="color: red;">상담 하기</p>
          </div>
          <div class="consultation__content" id="consultationInfo">
          	<div class="fashion__content">
          		<p style="color: black;">업체 상담센터</p>
          		<p><span>${makeup.company_phone}</span> <span style="color: red;">*클릭 시 전화연결 됩니다.</span></p>
          	</div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>