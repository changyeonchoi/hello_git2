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
    <title>fashion_qnainsert</title>
    <link rel="stylesheet" href="resources/css/main.css"/>
    <link rel="stylesheet" href="resources/css/detail.css" />
  </head>
  <body>
    <!-- 상단 바 -->
	<header>
	<c:set var="user_id" value="${sessionScope.membervo.user_id}" />
      <div class="logo">
        <a href="main">BT</a>
      </div>
      <nav class="shop-nav">
        <a href="fashionlist" id="selected">Fashion</a>
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
    <div class="notice__detail--box">
      <h1>게시글 등록하기</h1>
      <div class="detail__notice">
        <div class="info__box--title">
          <div class="title__box">
            <p>등록자</p>
            <input type="text" class="title__box--user" value="${user_id}" id="user_id" disabled />
          </div>
          <div class="title__box">
            <p>제목*</p>
            <input type="text" class="title__box--user" id="qna_title" maxlength="15"/>
          </div>
        </div>
        <br />
        <div class="info__box--title">
          <div class="title__box">
            <p>이미지</p>
				<div class="filebox">
				    <input class="upload-name" value="파일선택" placeholder="파일선택">
				    <label for="file_img" class="file-label">이미지 찾기</label> 
						<input type="file" id="file_img" accept=".png, .jpeg, .jpg">
				    <span class="upload-status"></span>
				</div>
          </div>
          <div id="title__box--content" class="title__box">
          	<p>내용*</p>
			  <textarea id="qna_detail"
	          placeholder="헤드셋 : 맥스 &#13;&#10;바람막이 : 무신사 &#13;&#10;평가좀요!!"
	          oninput="checkMaxLength(this);"
	          maxlength="200"></textarea>
          </div>
          <div class="title__box">
            <p>찜 여부*</p>
            <div class="title__box--radio_box">
			    <label><input type="radio" name="qna_like_yn" value="Y" checked>허용</label>
			    <label><input type="radio" name="qna_like_yn" value="N">허용안함</label>
            </div>
          </div>
        </div>
        <div class="cancel__box">
          <button id="saveButton">등록</button>
          <button onclick="cancel()">취소</button>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
    $(document).ready(function () {
        // 등록 버튼 클릭 이벤트
        $('#saveButton').on('click', function() {
            // 필요한 데이터 가져오기
            
            var user_id = $("#user_id").val();
            var qna_title = $("#qna_title").val();
            var file_img = $("#file_img")[0].files[0];
            var qna_detail = $("#qna_detail").val();
            var qna_like_yn = $("input[name='qna_like_yn']:checked").val();
            
            // 필수 입력 필드 체크
            if (!qna_title || !file_img || !qna_detail || !qna_like_yn) {
                alert("모든 항목을 입력해주세요.");
                return; // 필수 입력 필드 중 하나라도 빈 값이면 함수 종료
            }
            
            var formData = new FormData();
            formData.append("code", "fashion");
            formData.append("user_id", user_id);
            formData.append("qna_title", qna_title);
            formData.append("file_img", file_img);
            formData.append("qna_detail", qna_detail);
            formData.append("qna_like_yn", qna_like_yn);
            
            $.ajax({
                url: '/fashionqnaenroll',
                method: 'POST',
                data: formData,
				dataType : "text",
                enctype: 'multipart/form-data',
                contentType: false,
                processData: false,
                success: function(response) {
                    // 등록 성공 시 알림 표시 후 목록 페이지로 이동
                    alert('상품이 등록되었습니다.');
                    window.location.href = '/fashionqnalist';
                },
                error: function(error) {
                    // 등록 실패 시 알림 표시
                    alert('상품 등록에 실패하였습니다. 다시 시도해주세요.');
                    console.error('Error:', error);
                }
            });
        });
        

        
        // 이미지 파일 업로드 시
        $("#file_img").on('change', function () {
            var fileInput = this;
            var fileName = fileInput.value;
            var allowedExtensions = /(\.png|\.jpeg|\.jpg)$/i;

            if (!allowedExtensions.exec(fileName)) {
                alert('허용되지 않는 파일 형식입니다. PNG, JPG 또는 JPEG 파일을 선택해주세요.');
                fileInput.value = ''; // 파일 입력값 초기화
                $(".upload-name").val('파일선택'); // 업로드 이름 초기화
                $(".upload-status").text(""); // 업로드 상태 메시지 초기화
                return false;
            }

            // Read the selected image file
            var reader = new FileReader();
            reader.onload = function (e) {
                var img = new Image();
                img.onload = function () {
                    var maxWidth = 540;
                    var maxHeight = 500;
                    
                    // Check image dimensions
                    if (img.width > maxWidth || img.height > maxHeight) {
                        alert('이미지 크기가 허용된 최대 크기를 초과합니다. 가로 최대 ' + maxWidth + 'px, 세로 최대 ' + maxHeight + 'px로 선택해주세요.');
                        fileInput.value = ''; // 파일 입력값 초기화
                        $(".upload-name").val('파일선택'); // 업로드 이름 초기화
                        $(".upload-status").text(""); // 업로드 상태 메시지 초기화
                        return false;
                    } else {
                        // Display the image name and upload status
                        $(".upload-name").val(fileName);
                        $(".upload-status").text("*업로드 완료");
                    }
                };
                img.src = e.target.result;
            };

            reader.readAsDataURL(fileInput.files[0]);
        });
    });
    
    function cancel() {
    	window.location.href = 'fashionqnalist';
    }
    
    function checkMaxLength(textarea) {
        var maxLength = parseInt(textarea.getAttribute('maxlength'));
        var currentLength = textarea.value.length;

        if (currentLength > maxLength) {
            textarea.value = textarea.value.slice(0, maxLength);
        }
    }
    </script>

  </body>
</html>
