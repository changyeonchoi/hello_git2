<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 현황</title>
<style type="text/css">
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
	body {
		text-align: center;
/* 		color: #FFF; */
		width: 900px;
	}
	div#wapper {
		width: 100%;
		text-align: left;
		min-height: 300px;
		margin: 0 auto;
	}
 	header, footer, nav, aside, section { 
/*  		border: 1px solid #999;  */
 		margin: 5px; 
/*  		padding: 10px;  */
 	} 

	nav, section, aside {
		float: left;
/* 		height: 100px; */
	}
	nav {
	height : 500px;
    width: 100px;
    border-right: 2px solid black; /* 오른쪽 선 스타일 설정 */
	}
	section {
/* 		background-color: green;	 */
		width: 775px; 
	}
	article {
		width: 90%;
		margin: 20px;
		background-color: #999;
	}
	.menu {
      margin-bottom: 20px; /* 선과의 간격 조절 가능 */
      display: flex;
      align-items: center; /* 세로 가운데 정렬 */
      border-bottom: 2px solid black; /* 메뉴 아래 수평선 */
      padding-bottom: 10px; /* 수평선 아래 여백 */
    }
    .menu h3 {
        display: inline;
        margin-right: 20px; /* 텍스트 간격을 조절할 수 있습니다. */
    }
    .menu h3:last-child {
        margin-right: 0; /* 마지막 메뉴 아이템의 오른쪽 마진을 제거합니다. */
    }
    .menu h3 a {
        color: black; /* 기본 텍스트 색상을 지정합니다. */
        text-decoration: none; /* 밑줄을 제거합니다. */
        transition: color 0.3s; /* 색상 변경 시 부드럽게 애니메이션을 적용합니다. */
    }
    .menu h3 a.red-text {
        color: red; /* 특정 클래스가 적용된 경우에만 텍스트 색상을 빨간색으로 변경합니다. */
    }
    .menu h3 a:hover {
        color: red; /* 마우스를 올렸을 때 텍스트 색상을 빨간색으로 변경합니다. */
    }
    .menu-items h5 a {
        color: black; /* 기본 텍스트 색상을 지정합니다. */
        text-decoration: none; /* 밑줄을 제거합니다. */
        transition: color 0.3s; /* 색상 변경 시 부드럽게 애니메이션을 적용합니다. */
    }
    .menu-items h5 a.red-text {
        color: red; /* 특정 클래스가 적용된 경우에만 텍스트 색상을 빨간색으로 변경합니다. */
    }
    .menu-items h5 a:hover {
        color: red; /* 마우스를 올렸을 때 텍스트 색상을 빨간색으로 변경합니다. */
    }
    table {
    	width: 50%;
	}
	th, td {
   		border: 1px solid black;
    	padding: 10px;
    	text-align: center;
	}
	th {
    	background-color: black;
    	color: white; /* 텍스트 색상을 하얀색으로 설정 */
	}
	table {
   	 	width: 100%; /* 표의 너비를 70%로 설정 */
   	 	border-collapse: collapse;
	}
 	.underline-input {
    	display: flex;
    	align-items: center;
    	width: 300px;
    	margin-bottom: 20px;
  	}
  	.input-field {
    	flex: 1;
    	border: none;
    	border-bottom: 1px solid black;
   		margin-right: 10px;
    	padding: 5px;
    	font-size: 16px;
  	}
  	.search-button {
    	width: 24px; /* 돋보기 이미지의 너비로 설정 */
    	height: 24px; /* 돋보기 이미지의 높이로 설정 */
    	background: url('/resources/img/search.png') no-repeat center center;
    	border: none;
    	cursor: pointer;
  	}
    .section-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .section-header h3 {
        margin: 0;
    }
</style>
 
</head>
<body>

	<div id="wapper">
		<!--헤더시작-->
		<header>
			<div class="menu">
    		<h3><a href="#">상품관리</a></h3>
    		<h3><a href="#">배너관리</a></h3>
    		<h3><a href="#" class="red-text">사용자관리</a></h3>
			</div>
		</header>
		<!--네비게이션-->
		<nav>
			<div class="menu-items">
    			<h3>사용자관리</h3>
    			<h5><a href="#" class="red-text">관리자 현황</a></h5>		
    			<h5><a href="#">사용자 현황</a></h5>
    			<h5><a href="#">사용자 주문현황</a></h5>
			</div>
		</nav>
		<!--콘텐츠부분-->
		<section>
			<div class="section-header">
        		<h3>관리자 현황</h3>
				<div class="underline-input">
    				<input type="text" id="searchInput" placeholder="회원 ID를 입력해주세요" class="input-field"/>
    				<button onclick="goSearch()" class="search-button"></button>
				</div>
    		</div>
			<table id="tableContainer">
        		<tr>
            		<th>NO</th>
            		<th>회원ID</th>
            		<th>이름</th>
            		<th>상태</th>
        		</tr>
        	<c:forEach var="member" items="${member}" varStatus="status">
            	<tr>            	
                    <td>${status.index + 1}</td>
                	<td>${member.user_id}</td>
                	<td>${member.user_name}</td>
                	<td>${member.user_auth}</td>
	            </tr>
    	    </c:forEach>
    		</table>
			<div class="center-div">${navigation}</div>
    	</section>
	</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

function goPage(pageNo){
	let searchInputValue = $("#searchInput").val();
	$(location).attr('href',"<c:url value='/adminlist?pageNo="+pageNo+"'/>");
}

function goSearch(){
	let search = $("#searchInput").val();
	console.log("search" + search);
	$(location).attr('href',"<c:url value='/adminlist?search="+search+"'/>");
}
$(document).on('click', '#tableContainer td:nth-child(2)', function() {
    var user_id = $(this).text(); // 클릭한 행의 user_id 값을 가져옴
    window.location.href = '/adminupdate?user_id=' + user_id; // adminupdate.jsp로 이동하면서 user_id를 파라미터로 전달
    	
});

$(document).on('click', '#tableContainer td:nth-child(3)', function() {
    // 현재 클릭한 td의 부모인 tr을 찾습니다.
    var tr = $(this).closest('tr');
    
    // tr에서 td:nth-child(2)를 찾아서 그 값을 가져옵니다.
    var user_id = tr.find('td:nth-child(2)').text();

    // user_id 값을 사용하여 adminupdate.jsp로 이동
    window.location.href = '/adminupdate?user_id=' + user_id;
});


// function searchMembers() {
//     var searchInputValue = $("#searchInput").val();

//     // 서버로 요청 보내기
//     $.ajax({
//         url: '/adminlist',
//         method: 'POST',
//         data: { search: searchInputValue },
//         dataType: 'json',
//         success: function(data) {
//         	console.log(data);
//             // 서버에서 받은 JSON 데이터를 기반으로 동적으로 테이블 생성
//             var tableHTML = '<table>' +
//                             '<tr>' +
//                                 '<th>NO</th>' +
//                                 '<th>회원ID</th>' +
//                                 '<th>이름</th>' +
//                                 '<th>상태</th>' +
//                             '</tr>';
//             $.each(data, function(index, member) {
//                 tableHTML += '<tr>' +
//                                 '<td>' + (index + 1) + '</td>' +
//                                 '<td>' + member.user_id + '</td>' +
//                                 '<td>' + member.user_name + '</td>' +
//                                 '<td>' + member.user_auth + '</td>' +
//                              '</tr>';
//             });
//             tableHTML += '</table>';

//             // 기존 테이블 삭제
//             $("#tableContainer").empty();

//             // 생성한 테이블을 화면에 추가 (ID가 "tableContainer"인 엘리먼트에 추가)
//             $("#tableContainer").html(tableHTML);
//         },
//         error: function(error) {
//             // 오류 처리
//             console.error('Error:', error);
//         }
//     });
// }
</script>
</body>
</html>