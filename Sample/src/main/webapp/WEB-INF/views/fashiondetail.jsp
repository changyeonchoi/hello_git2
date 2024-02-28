<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
     <style>
     
    .shopping--box {
      display: inline-block; /* 부모 요소를 인라인 블록으로 설정하여 가로 정렬 */
    }

/*     .fashion__order--btn { */
/*     	font-size: 16px; */
/*     } */
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
    .fashion__img--box {
    display: none;
    }
    .consultation__content {
    	display: none;
    }
    </style>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>fashion_detail</title>

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
        <a href="fashionlist" id="selected">Fashion</a>
        <a href="makeuplist">Make Up</a>
        <a href="accessorylist">Accessory</a>
        <a href="#">검색</a>
      </nav>
		<c:if test="${empty memberVo.user_id}">
		  <nav class="shop-nav__info">
		    <a href="#">MY</a>
		    <a href="login?returnUrl=fashiondetail?seq_id=${fashion.seq_id}">Login</a>
		  </nav>
		</c:if>
		
		<c:if test="${not empty memberVo.user_id}">
		  <nav class="shop-nav__info">
		    <a href="#">MY</a>
		    <a href="${pageContext.request.contextPath}/logout" id="logoutLink">Logout</a>
		  </nav>
		</c:if>
    </header>
    <!-- 메인 -->
    <div>
      <div id="box" class="box">
        <a href="../fashion_detail/fashion.html" target="_blank" id="selected">계절 유행 STYLE</a>
        <p>게시판</p>
      </div>
      <!-- 상세 내용 -->
      <div class="wrap">
        <div id="photoBox" class="shop__header--photoBox">
          <div class="fashion__box">
            <div class="fashion__box--img">
           		<img
                src="${fashion.file_img}"
              	/>
            </div>
            <div class="fashion__box--content">
              <div class="fashion__content">
                <h1 id="product_name">${fashion.product_name}</h1>
                <div class="fashion__box--pay" >
  					<p>정상가<span class="price">${fashion.product_amount}원</span></p>
                </div>
					<c:if test="${not empty param.sale}">
					  <div class="fashion__box--pay">
					    <p><span style="color: red;">쿠폰적용가</span><span class="price">${param.sale}원</span></p>
					  </div>
					</c:if>
                <div class="fashion__box--drive">
                  	<p>배송비 <span class="price"> ${fashion.delivery_fee}원</span></p>
                </div>
                <div class="fashion__box--sale">
                  	<p>판매업체<span class="price">${fashion.company_name}</span></p>
                </div>
              </div>
              <button class="fashion__order--btn" id="order">주문하기</button>
            </div>
          </div>
          <div class="shopping--box">
          
	        <c:if test="${not empty memberVo.user_id}">
				<button class="fashion__order--btn" id="toggleHeart">
				<span id="heart">${heartCount eq 1 ? '찜하기❤️' : '찜하기♡'}</span>
				</button>
	        </c:if>
	        <!-- 미로그인 상태일 경우 로그인 페이지로 이동하는 JavaScript 코드 추가 -->
	        <c:if test="${empty memberVo.user_id}">
	            <script>
	                function redirectToLoginPage() {
	                    window.location.href = 'login?returnUrl=fashiondetail?seq_id=${fashion.seq_id}';
	                }
	            </script>
	            <button class="fashion__order--btn" onclick="redirectToLoginPage()"><span id="heart">찜하기♡</span></button>
	        </c:if>
          </div>
        </div>
		 <div class="fashion__menu--box">
		    <div class="fashion__menu--content">
		        <p onclick="showContent('detailInfo', this)">상세 정보</p>
		        <p onclick="showContent('consultationInfo', this)">상담 하기</p>
		    </div>
		    <div class="fashion__img--box" id="detailInfo">
		        <img src="${fashion.detail_img}" alt="poster">
		    </div>
		    <div class="consultation__content" id="consultationInfo">
		        <div class="fashion__content">
		            <p style="color: black;">업체 상담센터</p>
		            <p><span>${fashion.company_phone}</span> <span style="color: red;">*클릭 시 전화연결 됩니다.</span></p>
		        </div>
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


$(document).ready(function() {
    $('#toggleHeart').click(function() {
        var heartElement = $('#heart');
        var heart = ${heartCount};
        var user_id = '${memberVo.user_id}';
        var seq_id = ${fashion.seq_id};
        var code = 'fashion';
        
        $.ajax({
            type: 'post',
            url: 'upHeart',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify({
                user_id: user_id,
                seq_id: seq_id,
                heart: heart,
                code: code
            }),
            success: function(data) {
                console.log(data);
                if (data && data.action) {
                    var action = data.action;
                    console.log("Action: " + action);
                    
                    if (action === '삭제') {
                        // 삭제 동작 수행
                        heartElement.text('찜하기♡');
                    } else if (action === '등록') {
                        // 등록 동작 수행
                        heartElement.text('찜하기❤️');
                    }
                } else {
                    console.error("Invalid response format");
                }
            }
        });
    });
    $('#order').click(function() {
    	
    	var product_name = $("#product_name").text();
    	var user_id = '${memberVo.user_id}';
    	
    	$.ajax({
            url: "mypageqnainsert", 
            dataType: 'json',
            contentType: 'application/json',
            method: "POST",
            data: JSON.stringify({
                product_name: product_name,
                user_id: user_id
            }),
            success: function(response) {
    			alert("주문이 완료되었습니다.");
            },
            error: function(xhr, status, error) {
                // 오류를 처리합니다.
                console.error("오류:", status, error);
            }
        });
    });
});
</script>
  </body>
</html>
