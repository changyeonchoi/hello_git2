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
    <title>shop_detail</title>
	<link rel="stylesheet" href="resources/css/main.css" />
    <link rel="stylesheet" href="resources/css/detail.css" />
    <link rel="stylesheet" href="resources/css/mypage.css" />
<style type="text/css">   
.box {
  top: 44%;
  padding: 20px 50px 20px 20px;
  height: 30vh;
  left: 5%;
}

#main-box {
  width: 75%;
}

.top-box {
  display: flex;
  align-items: flex-start;
  flex-direction: column;
  width: 65%;
  margin: 2px auto;
}
.top-box .top-box__total {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 10%;
  margin-right: 5px;
  margin-bottom: 20px;
  cursor: pointer;
}
.top-box .top-box__total p {
  font-weight: 600;
  font-size: 1.1em;
}

.top-box__total:last-child {
  width: 47%;
  margin-bottom: 10px;
}
.top-box__total:last-child p {
  font-weight: 600;
  font-size: 1.1em;
  margin-right: 5px;
  border-right: 1px solid #333;
  padding-right: 40px;
}

.selected {
  font-size: 1.1em;
  font-weight: 600;
}
.red-text {
  color: #d1180b;
}
.ordered-product {
  width: 70%;
  margin: 91px auto 0;
}
.ordered-product .notice__detail--box {
  padding: 0;
  margin: 0;
}

.title__box {
  border: unset;
}
    .center-div {
    	width: 100%;
    	text-align: center;
    	margin-top: 20px; /* 필요에 따라 조절 가능한 상단 여백 */
	}
	.pagination {
    	margin: 0 5px; /* 페이지 번호와 부등호 사이의 간격을 조절할 수 있습니다. */
	}

	.page-number {
    	text-decoration: none;
    	padding: 3px 5px; /* 페이지 번호의 간격 및 여백을 조절할 수 있습니다. */
    	border: 1px solid #ccc; /* 페이지 번호의 테두리를 추가할 수 있습니다. */
    	color: #333; /* 페이지 번호의 글자색을 조절할 수 있습니다. */
	}

	.page-number:hover {
    	background-color: #f5f5f5; /* 마우스 오버 시 배경색을 변경할 수 있습니다. */
	}
</style>
  </head>
  <body>
    <!-- 상단 바 -->
    <header>
      <div class="logo">
   		<a href="main">BT</a>
      </div>
      <nav class="shop-nav">
        <a href="fashionlist">Fashion</a>
        <a href="makeuplist">Make Up</a>
        <a href="accessorylist">Accessory</a>
        <a href="search">검색</a>
      </nav>
	<c:if test="${membervo.user_id == null}">
	   <nav class="shop-nav__info">
	     <a href="login"  id="selected">MY</a>
	     <a href="login" id="loginLink">Login</a>
	   </nav>
	   </c:if>
	   <c:if test="${membervo.user_id != null}">
	   <nav class="shop-nav__info">
	     <a href="#" id="selected">MY</a>
	     <a href="${pageContext.request.contextPath}/logout" id="logoutLink">Logout</a>
	   </nav>
    </c:if>
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
				    <c:forEach var="OrderList" items="${OrderList}">
				            <div class="info__box--title">
				                <div class="title__box" style="border: unset">
				                    <p style="width: 100%; text-align: left; padding-left: 15px">${OrderList.regdate}</p>
				                </div>
				                <div class="title__box">
				                    <p>상품명</p>
				                    <input type="text" class="title__box--user" placeholder="${OrderList.product_name}" style="cursor: auto" disabled />
				                </div>
				            </div>
				     </c:forEach>       
					<div class="center-div">${navigation}</div>
		        </div>
		    </div>
		</div>
      </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    function goPage(pageNo){
    	let searchInputValue = $("#searchInput").val();
    	$(location).attr('href',"<c:url value='/mypageproduct?pageNo="+pageNo+"'/>");
    }
    </script>
  </body>
</html>
