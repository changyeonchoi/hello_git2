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
    <title>fashion_qnalist</title>
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
        <a href="makeuplist" id="selected">Make Up</a>
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
    <div>
      <div class="box">
        <a href="makeuplist">오늘의 메이크업</a><br /><br />
        <a href="makeupqnalist" id="selected">게시판</a>
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
			            window.location.href = 'makeupqnainsert';
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
                <th>비밀번호</th>
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
			                    <a href="#" class="detail-link" data-seq-id="${qnaList.seq_id},${qnaList.qna_pw}">
			                        ${qnaList.qna_title}
			                    </a>
			                </td>
			                <td>
							   <c:choose>
							        <c:when test="${not empty qnaList.qna_pw}">
							           O
							        </c:when>
							        <c:otherwise>
							           X
							        </c:otherwise>
							    </c:choose>
							</td>
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
//     function redirectToInsertPage() {
//         window.location.href = 'login?qnainsert&code=fashion';
//     }

	$(document).ready(function() {
	    // 클래스가 detail-link인 요소를 클릭했을 때의 동작 정의
	    $('.detail-link').click(function() {
	        // data-seq-id 속성을 통해 seq_id와 qna_pw 값을 가져옴
	        var dataSeqId = $(this).data('seq-id');
	        var seqId = dataSeqId.split(',')[0];
	        var password = dataSeqId.split(',')[1];
	        
	        // 사용자에게 비밀번호를 입력받음
	        var inputPassword = prompt("비밀번호를 입력하세요:");
	
	        // 비밀번호를 확인하고 일치하면 페이지 이동
	        if (inputPassword === password) {
	            window.location.href = '/makeupqnadetail?seq_id=' + seqId;
	        } else {
	            alert("비밀번호가 일치하지 않습니다.");
	        }
	    });
	});
    
    function goSearch(){
    	let search = $("#searchInput").val();
    	let code = "fashion"; // code 값

    	// 현재 URL에 search와 code 파라미터를 추가하여 새로운 URL 생성
    	let newUrl = "<c:url value='/makeupqnalist'/>?code=" + code + "&search=" + search;

    	// 생성한 URL로 페이지 리디렉션
    	$(location).attr('href', newUrl);
    }
    </script>

  </body>
</html>
