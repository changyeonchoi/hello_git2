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
    <title>makeup_qnadetail</title>
    <link rel="stylesheet" href="resources/css/main.css"/>
    <link rel="stylesheet" href="resources/css/detail.css" />
  <style>
    .filebox {
        position: relative;
        display: flex;
        align-items: center;
    }

    .filebox .file-label {
        padding: 0px 10px;
        background-color: #999999;
        cursor: pointer;
        margin-left: 10px;
        border: 1px solid black;
        border-radius: 1px;
    }

    .filebox .upload-name {
        height: 20px;
        padding: 0 10px;
        border: 1px solid #dddddd;
        color: #999999;
    }

    .filebox .upload-status {
        color: red;
        margin-left: 10px;
    }

    .filebox input[type="file"] {
        position: absolute;
        width: 0;
        height: 0;
        overflow: hidden;
        border: 0;
    }
    .filebox {
    position: relative;
    display: flex;
    align-items: center;
}

.filebox .file-label {
    padding: 0px 10px;
    background-color: #999999;
    cursor: pointer;
    margin-left: 10px;
    border: 1px solid black;
    border-radius: 1px;
}

.filebox .upload-name-detail {
    height: 20px;
    padding: 0 10px;
    border: 1px solid #dddddd;
    color: #999999;
}

.filebox .upload-status-detail {
    color: red;
    margin-left: 10px;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    overflow: hidden;
    border: 0;
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
        <a href="makeuplist" id="selected">Make Up</a>
        <a href="accessorylist">Accessory</a>
        <a href="search">검색</a>
      </nav>
      <c:if test="${membervo.user_id == null}">
      <nav class="shop-nav__info">
        <a href="login?returnUrl=mypage" id="loginLink">MY</a>
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
    <!-- 게시판 상세보기 -->
    <div class="notice__detail--box">
      <h1>게시글 보기</h1>
      <div class="detail__notice">
        <div class="detail__notice--button--box">
          <button class="search--button">찜하기 ♡</button>
        </div>
        <div class="info__box--title">
          <div class="title__box">
            <p>등록자</p>
			<input
			    type="text"
			    class="title__box--user"
			    value="${qnavo.user_id}"
			    disabled
			/>
          </div>
          <div class="title__box">
            <p>제목*</p>
            <input
              id="qna_title"
              type="text"
              class="title__box--user"
              value="${qnavo.qna_title}"
            />
          </div>
        </div>
        <br />
        <div class="info__box--title">
          <div id="title__box--img" class="title__box">
            <p>이미지</p>
			<div class="title__box--img">
			    <div class="filebox">
			        <img id="previewImage" src="${qnavo.file_img}" />
			        <label for="file_img" class="file-label">이미지 찾기</label>
			        <input type="file" id="file_img" accept=".png, .jpeg, .jpg" onchange="previewFile()" />
			        <span class="upload-status"></span>
			    </div>
			</div>
          </div>
          <div id="title__box--content" class="title__box">
            <p>내용*</p>
				<input
				  id="qna_detail"
	              type="text"
	              class="title__box--user"
	              value="${qnavo.qna_detail}"
	            />
          </div>
          <div class="title__box">
            <p>비밀번호</p>
			<input
              id="qna_pw"
              type="text"
              class="title__box--user"
              value="${qnavo.qna_pw}"
            />
          </div>
        </div>
        <div class="cancel__box">
          	<button onclick="cancel()">취소</button>
			<button id="updateButton">저장</button>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
    function previewFile() {
        var fileInput = document.getElementById('file_img');
        var previewImage = document.getElementById('previewImage');
        var fileStatusLabel = document.querySelector('.upload-status');

        var file = fileInput.files[0];

        if (file) {
            var reader = new FileReader();

            reader.onload = function (e) {
                // 이미지를 미리보기 엘리먼트에 표시
                previewImage.src = e.target.result;
                fileStatusLabel.innerText = '업로드 완료';
            };

            reader.readAsDataURL(file);
        } else {
            // 파일이 선택되지 않았을 때의 처리
            previewImage.src = "${qnavo.file_img}"; // 기존 이미지로 복원
            fileStatusLabel.innerText = '이미지를 선택하세요.';
        }
    }
    $(document).ready(function () {
    	
    	var valueFromDatabase = "${qnavo.qna_like_yn}";
    	
        $("#radioY").prop('checked', (valueFromDatabase === "Y"));
        $("#radioN").prop('checked', (valueFromDatabase === "N"));
        
        $('#updateButton').click(function () {
		 var qna_title = $("#qna_title").val();
	     var file_img = $("#file_img")[0].files[0]; // Get the file object
	     var qna_detail = $("#qna_detail").val();
	     var qna_like_yn = $("input[name='qna_like_yn']:checked").val();
	     var qna_pw = $("#qna_pw").val();
	
	     var formData = new FormData();
	     formData.append("qna_title", qna_title);
	     formData.append("file_img", file_img);
	     formData.append("qna_detail", qna_detail);
	     formData.append("qna_like_yn", qna_like_yn);
	     formData.append('seq_id', '${qnavo.seq_id}');
	     formData.append('qna_pw', qna_pw);
	     
	     console.log(formData);

	        $.ajax({
	            url: '/makeupqnaupdate',
	            method: 'POST',
	            data: formData,
	            dataType: "text",
//                 enctype: 'multipart/form-data',
	            contentType: false,
	            processData: false,
	            success: function(response) {
	                // 등록 성공 시 알림 표시 후 목록 페이지로 이동
	                alert('저장되었습니다.');
	                window.location.href = '/makeupqnalist'; // 등록 후 이동할 페이지 URL로 변경해주세요
	            },
	            error: function(error) {
	                // 등록 실패 시 알림 표시
	                alert('에러에러');
	                console.error('Error:', error);
	            }
	        });
	     });
	 });
        
    function cancel() {
    	window.location.href = 'makeupqnalist';
    }
    
    function getUserId() {
        var userId = '${membervo.user_id}';
        
        window.location.href = 'mypage?user_id=' + userId;
    }
    </script>

  </body>
</html>
