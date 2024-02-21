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
              <img
				src="${qnavo.file_img}"
              />
				    <label for="file_img" class="file-label">이미지 찾기</label>
					<input type="file" id="file_img" value="${qnavo.file_img}" accept=".png, .jpeg, .jpg">
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
            <p>찜여부*</p>
            <div class="title__box--radio_box">
			    <label><input type="radio" name="qna_like_yn" id="radioY" value="Y" checked>허용</label>
			    <label><input type="radio" name="qna_like_yn" id="radioN" value="N">허용안함</label>
            </div>
          </div>
          <div class="title__box">
            <p>댓글 달기</p>
            <div class="title__box--content_box">
              <button onclick="openPopup()">댓글 등록하기</button>
              <span>전체댓글(4)</span>
            </div>
          </div>
        </div>
        <div class="cancel__box">
			<button id="updateButton">저장</button>
          	<button onclick="cancel()">취소</button>
        </div>
      </div>
    </div>
    <input type="hidden" id="seq_id_hidden" value="${qnavo.seq_id}" />
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
    $(document).ready(function () {
    	
    	var valueFromDatabase = "${qnavo.qna_like_yn}";
    	
        $("#radioY").prop('checked', (valueFromDatabase === "Y"));
        $("#radioN").prop('checked', (valueFromDatabase === "N"));
        
        $('#updateButton').click(function () {
		 var qna_title = $("#qna_title").val();
	     var file_img = $("#file_img")[0].files[0]; // Get the file object
	     var qna_detail = $("#qna_detail").val();
	     var qna_like_yn = $("input[name='qna_like_yn']:checked").val();
	
	     var formData = new FormData();
	     formData.append("qna_title", qna_title);
	     formData.append("file_img", file_img);
	     formData.append("qna_detail", qna_detail);
	     formData.append("qna_like_yn", qna_like_yn);
	     formData.append('seq_id', '${qnavo.seq_id}');
	     
	     console.log(formData);

	        $.ajax({
	            url: '/fashionqnaupdate',
	            method: 'POST',
	            data: formData,
	            dataType: "text",
	            contentType: false,
	            processData: false,
	            success: function(response) {
	                
	                alert('저장되었습니다.');
	                window.location.href = '/fashionqnalist'; 
	            },
	            error: function(error) {
	                
	                alert('에러에러');
	                console.error('Error:', error);
	            }
	        });
	     });
	 });
        
    function cancel() {
    	window.location.href = 'fashionqnalist';
    }
    
    function openPopup() {
        var codeValue = "fashion"; 
        var seq_id = $("#seq_id_hidden").val();
        console.log(seq_id);
        var url = 'commentpopup?code=' + encodeURIComponent(codeValue) + '&seq_id=' + seq_id;
        window.open(url, '댓글 등록', 'width=500, height=300, left=500, top=200');
    }
    </script>

  </body>
</html>
