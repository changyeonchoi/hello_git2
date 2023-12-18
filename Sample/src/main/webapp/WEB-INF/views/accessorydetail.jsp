<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
     <style>
        /* 추가적인 스타일링은 여기에 작성하세요. */
        .heart-filled {
    	color: red; /* 빨간색으로 설정 */
    	}
        .fashion__img--box {
            display: none;
        }
        .consultation__content {
            display: none;
        }
         .fashion__box--pay {
	    text-align: left;
	    }
	    .fashion__box--drive{
	    text-align: left;
	    }
	    .fashion__box--sale {
	    text-align: left;
	    }
	
	    .fashion__box--pay .price {
	        display: inline-block;
	        text-align: right;
	        margin-left: 50px; /* 여백 조절 */
	    }
	    .fashion__box--drive .price {
	        display: inline-block;
	        text-align: right;
	        margin-left: 53px; /* 여백 조절 */
	    }
	    .fashion__box--sale .price {
	        display: inline-block;
	        text-align: right;
	        margin-left: 50px; /* 여백 조절 */
	    }
    </style>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>accessory_detail</title>

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
        <a href="makeuplist">Make Up</a>
        <a href="accessorylist" id="selected">Accessory</a>
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
        <a href="../fashion_detail/fashion.html" target="_blank" id="selected">지금 뜨는 액세서리</a>
        <p>게시판</p>
      </div>
      <!-- 상세 내용 -->
      <div class="wrap">
        <div id="photoBox" class="shop__header--photoBox">
          <div class="fashion__box">
            <div class="fashion__box--img">
           		<img
                src="${accessory.file_img}"
              	/>
            </div>
            <div class="fashion__box--content">
              <div class="fashion__content">
                <h1>${accessory.product_name}</h1>

                <div class="fashion__box--pay">
  					<p>정상가<span class="price">${accessory.product_amount}원</span></p>
                </div>
                <div class="fashion__box--drive">
                  	<p>배송비 <span class="price"> ${accessory.delivery_fee}원</span></p>
                </div>
                <div class="fashion__box--sale">
                  	<p>판매업체<span class="price">${accessory.company_name}</span></p>
                </div>
              </div>
              <button class="fashion__order--btn" onclick="showAlert()">주문하기</button>
            </div>
          </div>
          <div class="shopping--box">
  			<button class="fashion__order--btn" onclick="toggleHeart()"><span id="heart">찜하기♡</span></button>
          </div>
        </div>
		 <div class="fashion__menu--box">
		    <div class="fashion__menu--content">
		        <p onclick="showContent('detailInfo', this)">상세 정보</p>
		        <p onclick="showContent('consultationInfo', this)">상담 하기</p>
		    </div>
		    <div class="fashion__img--box" id="detailInfo">
		        <img src="${accessory.detail_img}" alt="poster">
		    </div>
		    <div class="consultation__content" id="consultationInfo">
		        <div class="fashion__content">
		            <p style="color: black;">업체 상담센터</p>
		            <p><span>${accessory.company_phone}</span> <span style="color: red;">*클릭 시 전화연결 됩니다.</span></p>
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
// 페이지 로딩 시 상세 정보를 기본으로 노출
showContent('detailInfo', document.querySelector('.fashion__menu--box .fashion__menu--content p:first-child'));

function showContent(contentId, clickedElement) {
    // 모든 content를 숨기기
    var contents = document.querySelectorAll('.fashion__img--box, .consultation__content');
    contents.forEach(function (content) {
        content.style.display = 'none';
    });

    // 선택한 content 보이기
    var selectedContent = document.getElementById(contentId);
    if (selectedContent) {
        selectedContent.style.display = 'block';
    }

    // 모든 p 요소의 텍스트 색상을 기본으로 변경
    var allParagraphs = document.querySelectorAll('.fashion__menu--box .fashion__menu--content p');
    allParagraphs.forEach(function(paragraph) {
        paragraph.classList.remove('active');
        paragraph.style.color = 'black'; // 모든 p 요소의 색상을 검은색으로 변경
    });

    // 클릭한 p 요소의 텍스트 색상을 변경
    clickedElement.classList.add('active');
}
function showAlert() {
    alert('주문이 완료되었습니다.');
}
function toggleHeart() {
    var heart = document.getElementById('heart');
    console.log("heart" + heart);
    heart.classList.toggle('heart-filled');
}

</script>
  </body>
</html>
