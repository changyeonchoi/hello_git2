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
	<link rel="stylesheet" href="resources/css/main.css" />
    <link rel="stylesheet" href="resources/css/search.css" />
    <link rel="stylesheet" href="resources/css/mypage.css" />
    <link rel="stylesheet" href="resources/css/detail.css" />
  </head>
  <body>
    <!-- 상단 바 -->
    <header>
      <div class="logo">
        <a href="../index.html" id="selected">BT</a>
      </div>
      <nav class="shop-nav">
        <a href="fashionlist">Fashion</a>
        <a href="makeuplist">Make Up</a>
        <a href="accessorylist">Accessory</a>
        <a href="search" id="selected">검색</a>
      </nav>
      <c:if test="${membervo.user_id == null}">
        <nav class="shop-nav__info">
          <a href="login" id="loginLink">MY</a>
          <a href="login" id="loginLink">Login</a>
        </nav>
      </c:if>
      <c:if test="${membervo.user_id != null}">
        <nav class="shop-nav__info">
          <a href="mypage" onclick="getUserId()">MY</a>
          <a href="${pageContext.request.contextPath}/logout" id="logoutLink">Logout</a>
        </nav>
      </c:if>
    </header>
    <div class="box">
      <a id="noice__board">검색</a>
    </div>
    <!-- 메인 -->
    <div class="wrap" id="main">
      <div class="container" id="resultContainer">
        <div class="search__box--cotainer" id="searchResultContainer">
          <div class="search__box">
            <input type="text" id="searchInput" placeholder="검색항목을 입력하세요" />
            <button onclick="goSearch()" class="search-button"></button>
          </div>
        </div>
        <h2>인기 검색어 <span style="color: red;">Top5</span></h2>
        <div class="table__container">
          <table>
            <thead>
              <tr>
                <th>No</th>
                <th>Top5</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="RankingList" items="${RankingList}" varStatus="status">
                <tr>
                  <td>${status.index + 1}</td>
                  <td>${RankingList.keyword}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <div class="center-div">${navigation}</div>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
      let currentBannerSlide = 0;
      let bannerSlides = [];
      let bannerCounter;

      function initBanner() {
        bannerSlides = document.querySelectorAll(".banner-carousel .banner-slide");
        bannerCounter = $(".counter");
      }

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
        console.log("prevBannerSlide clicked");
      }

      function nextBannerSlide() {
        showBannerSlide(currentBannerSlide + 1);
        console.log("nextBannerSlide clicked");
      }

      function updateBannerCounter() {
        bannerCounter.text(currentBannerSlide + 1 + " / " + bannerSlides.length);
      }

      function goSearch() {
        var search = $("#searchInput").val();

        // Ajax를 이용한 서버와의 통신
        $.ajax({
          type: "GET",
          url: "searchresult",
          data: {
            search: search,
          },
          success: function (data) {
            // 받아온 데이터를 JavaScript 객체로 변환
            var productList = data.productList;
            var bannerList = data.bannerList;

            // 검색 결과를 표시할 영역 선택
            var mainContainer = $("#main");

            // 이전 검색 결과 삭제
            mainContainer.empty();

            // 동적으로 생성한 HTML
            var productHtml = '<div class="wrap">';
            productHtml += '<div class="search__box--cotainer">';
            productHtml += '<div class="search__box">';
            productHtml += '<input type="text" id="searchInput" placeholder="검색항목을 입력하세요" />';
            productHtml += '<button onclick="goSearch()" class="search-button"></button>';
            productHtml += '</div>';
            productHtml += '</div>';
            productHtml += '<div id="shop__header--photoBox" class="shop__header--photoBox">';
            productHtml += '<div class="carousel banner-carousel">';

            // productList와 bannerList 중 작은 길이만큼 반복
            var loopLength = Math.min(productList.length, bannerList.length);
            for (var i = 0; i < loopLength; i++) {
              var product = productList[i];
              var banner = bannerList[i];
              var decodedFileImg = decodeURIComponent(decodeURIComponent(product.file_img));

              // Banner 이미지를 추가
              productHtml += '<img src="' + banner.banner_img + '" alt="Banner Slide" class="banner-slide" />';
            }

            productHtml += '</div>';
            productHtml += '<div class="slide__count-box">';
            productHtml += '<div class="arrow prev" onclick="prevBannerSlide()">❮</div>';
            productHtml += '<div class="counter">1 / ' + loopLength + '</div>';
            productHtml += '<div class="arrow next" onclick="nextBannerSlide()">❯</div>';
            productHtml += '</div>';
            productHtml += '</div>';
            productHtml += '<div id="main-box" class="shop__main--box">';
            productHtml += '<div class="grid-container">';

            // 제품 리스트에 대한 반복문 추가
            for (var i = 0; i < productList.length; i++) {
              var product = productList[i];
              var decodedFileImg = decodeURIComponent(decodeURIComponent(product.file_img));
              productHtml += '<div class="grid-item">';
              productHtml += '<img src="' + decodedFileImg.replace(/\\/g, '/') + '" alt="' + product.product_name + '" />';
              productHtml += '<p class="shop__code--content">' + product.product_name + '</p>';
              productHtml += '</div>';
            }
            productHtml += '</div>';
            productHtml += '</div>';
            productHtml += '</div>';

            // 생성한 HTML을 결과 영역에 추가
            mainContainer.append(productHtml);

            // 검색 후에 bannerSlides와 bannerCounter를 초기화
            initBanner();

            // 새로운 값으로 초기화된 bannerSlides와 bannerCounter를 사용
            showBannerSlide(0);
          },
          error: function () {
            alert("검색 결과가 없습니다.");
          },
        });
      }

      // 페이지 로드 시에 초기화
      $(document).ready(function () {
        initBanner();
        showBannerSlide(0);
      });
    </script>
  </body>
  </html>