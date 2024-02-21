<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>댓글 등록</title>
    <link rel="stylesheet" href="resources/css/main.css"/>
    <link rel="stylesheet" href="resources/css/detail.css"/>
    <style>
    #commentContent {
      width: 85%; /* 초기 너비를 100%로 설정 */
/*       max-width: 430px; /* 최대 너비를 430px로 제한 */ */
      box-sizing: border-box; /* 너비에 패딩과 테두리를 포함하도록 설정 */
      padding: 10px; /* 선택적으로 패딩을 추가할 수 있음 */
    }
     .table__container {
        max-height: 300px; /* 원하는 높이로 설정 */
        overflow-y: auto; /* 세로 스크롤이 필요한 경우만 표시 */
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    table, th, td {
        border: 1px solid #ddd;
    }

    th, td {
        padding: 8px;
        text-align: left;
    }

/*     th { */
/*         background-color: #f2f2f2; */
/*     } */
    </style>
</head>
<body>

<!-- 팝업 내용 -->
        <div class="table__container" style="height: 300px; overflow: auto;">
          <table>
            <thead>
              <tr>
                <th>No</th>
                <th>댓글목록</th>
                <th>회원명</th>
              </tr>
            </thead>
            <tbody>
            <c:choose>
			    <c:when test="${empty commentvo}">
			        <tr>
			            <td colspan="5">등록된 댓글 없습니다.</td>
			        </tr>
			    </c:when>
			    <c:otherwise>
			        <c:forEach var="cmt" items="${commentvo}" varStatus="status">
			            <tr>
			                <td>${cmt.rnum}</td>
			                <td>
			                    ${cmt.comment_content}
			                </td>
			                <td>${cmt.user_id}</td>
			            </tr>
			        </c:forEach>
			    </c:otherwise>
			</c:choose>
            </tbody>
          </table>
        </div>
	    <input type="text" id="commentContent" placeholder="댓글을 입력하세요" maxlength="20"></input>
	    <button onclick="submitComment()">등록</button><br />
	    <div class="cancel__box">
	    <button onclick="closePopup()">닫기</button>
	    </div>
	    
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
    // 댓글 등록 처리
    function submitComment() {
        var urlParams = new URLSearchParams(window.location.search);
        var codeValue = urlParams.get('code');
        var seq_id = urlParams.get('seq_id');
    	var comment_content = document.getElementById('commentContent').value;
    	
    	 var formData = new FormData();
    	 formData.append('code', codeValue);
    	 formData.append('comment_content', comment_content);
    	 formData.append('seq_id', seq_id);
    
		 $.ajax({
	            url: '/commentinsert',
	            method: 'POST',
	            data: formData,
	            dataType: "json",
	            enctype: 'multipart/form-data',
	            contentType: false,
	            processData: false,
	            success: function(response) {
	                alert('댓글이 등록되었습니다.');
	                
	                // 새로운 댓글을 테이블에 추가
	                var newRow = '<tr><td>' + response.rnum + '</td><td>' + response.comment_content + '</td><td>' + response.user_id + '</td></tr>';
	                $('table tbody').prepend(newRow);

	                // 입력 필드 초기화
	                $('#commentContent').val('');
	            },
	            error: function(error) {
	                alert('댓글 등록에 실패하였습니다. 다시 시도해주세요.');
	                console.error('Error:', error);
	            }
	        });
    }
    
    function closePopup(){
    	window.close();
    }
</script>

</body>
</html>