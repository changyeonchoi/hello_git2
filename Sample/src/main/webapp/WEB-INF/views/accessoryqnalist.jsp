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
    <title>accessory_qnalist</title>
    <style>
    	.center-div {
    	width: 100%;
    	text-align: center;
    	margin-top: 20px; /* 필요에 따라 조절 가능한 상단 여백 */
	}
    </style>
    <link rel="stylesheet" href="resources/css/main.css"/>
    <link rel="stylesheet" href="resources/css/detail.css"/>
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
        <a href="accessorylist" id="selected">Accessory</a>
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
    <div>
      <div class="box">
        <a href="accessorylist">지금 뜨는 액세서리</a><br /><br />
        <a href="accessoryqnalist" id="selected">게시판</a>
      </div>
      
      <!-- 게시판 -->
      <div class="container">
        <div class="search__box">
          <div class="search__box--cotainer">
            <input type="text" id="searchInput" placeholder="제목을 입력하세요" class="input-field"/>
            <button onclick="goSearch()" class="search-button"></button>
          </div>
			<!-- 미로그인 상태일 경우 로그인 페이지로 이동하는 JavaScript 코드 추가 -->
			<c:if test="${empty memberVo.user_id}">
			    <script>
			        function redirectToLoginPage() {
			        	alert("미로그인 상태이므로 로그인 페이지로 이동합니다.")
			            window.location.href = 'login';
			        }
			    </script>
			    <button id="notice__detail" class="search--button" onclick="redirectToLoginPage()">등록하기</button>
			</c:if>
			
			<!-- 로그인 상태일 경우 직접 페이지로 이동하는 JavaScript 코드 추가 -->
			<c:if test="${not empty memberVo.user_id}">
			    <script>
			        function redirectToInsertPage() {
			            window.location.href = 'accessoryqnainsert';
			        }
			    </script>
			    <button id="notice__detail" class="search--button" onclick="redirectToInsertPage()">등록하기</button>
			</c:if>
        </div>
        <div class="table__container">
          <table>
            <thead>
              <tr>
                <th>No</th>
                <th>등록일</th>
                <th>제목</th>
                <th>찜개수</th>
                <th>등록자</th>
              </tr>
            </thead>
            <tbody>
            <c:choose>
			    <c:when test="${empty qnaList}">
			        <tr>
			            <td colspan="5">등록된 게시글이 없습니다.</td>
			        </tr>
			    </c:when>
			    <c:otherwise>
			        <c:forEach var="qnaList" items="${qnaList}" varStatus="status">
			            <tr>
			                <td>${qnaList.rnum}</td>
			                <td>
			                    <fmt:parseDate value="${qnaList.regdate}" var="regdate" pattern="yyyy-MM-dd" />
			                    <fmt:formatDate value="${regdate}" pattern="yyyy.MM.dd" />
			                </td>
			
			                <td>
			                    <a href="#" class="detail-link" data-seq-id="${qnaList.seq_id}" data-user-id="${memberVo.user_id}">
			                        ${qnaList.qna_title}
			                    </a>
			                </td>
			                <td>${qnaList.heartcount}개</td>
			                <td>${qnaList.user_id}</td>
			            </tr>
			        </c:forEach>
			    </c:otherwise>
			</c:choose>
            </tbody>
          </table>
        </div>
          <div class="center-div">${navigation}</div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>

 $(document).ready(function() {
        // 클래스가 detail-link인 요소를 클릭했을 때의 동작 정의
        $('.detail-link').click(function() {
            // data-seq-id 속성을 통해 seq_id 값을 가져옴
            var seqId = $(this).data('seq-id');
            console.log(seqId);
            console.log(this);
            // data-user-id 속성을 통해 user_id 값을 가져옴
            var userId = $(this).data('user-id');
            
            // user_id가 없으면 로그인 페이지로 이동
            if (!userId) {
                alert("로그인이 필요한 서비스입니다. 로그인 페이지로 이동합니다.");
                window.location.href = '/login';
                return; // 중단하여 뒤의 코드를 실행하지 않도록 함
            }

            // seq_id 값을 사용하여 detail 페이지로 이동
            window.location.href = '/accessoryqnadetail?seq_id=' + seqId;
        });
    });
    
    function goSearch(){
    	let search = $("#searchInput").val();
    	let code = "accessory"; // code 값

    	// 현재 URL에 search와 code 파라미터를 추가하여 새로운 URL 생성
    	let newUrl = "<c:url value='/accessoryqnalist'/>?code=" + code + "&search=" + search;

    	// 생성한 URL로 페이지 리디렉션
    	$(location).attr('href', newUrl);
    }
    </script>

  </body>
</html>
