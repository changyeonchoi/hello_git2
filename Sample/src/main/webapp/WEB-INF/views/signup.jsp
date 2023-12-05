<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style>
    .center-align {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-container {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .table-container {
        width: 100%;
    }

    .table-container table {
        border: 1px solid black;
        width: 100%;
    }

    .custom-cell {
        background-color: black;
        color: white;
        text-align: center;
    }
    
    .button-container {
        display: flex;
        justify-content: space-between;
        width: 100%;
        margin-top: 10px;
    }

    .button-container button {
        cursor: pointer;
    }

    .button-container button.button-container-black {
        background-color: black;
        color: white;
        padding: 3px 10px;
        border: none;
        margin-right: 1px; /* 신청 버튼의 오른쪽 마진을 10px로 설정 */
    }

    .button-container button.button-container-white {
        background-color: white;
        color: black;
        padding: 3px 10px;
        border: 1px solid black;
    }
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="center-align">
    <form>
        <h1>BT 사용자신청</h1>
        <div class="form-container">
            <div class="table-container">
                <table>
                    <tr>
                        <td class="custom-cell">회원ID</td>
                        <td><input type="text" class="input_text" id="user_id" value="" placeholder="" maxlength="10">
                         <button id="checkDuplicateBtn">중복 체크</button>
                    </tr>
                    <tr>
                        <td class="custom-cell">이름*</td>
                        <td><input type="text" class="input_text" id="user_name" maxlength="10"></td>
                    </tr>
                    <tr>
                        <td class="custom-cell">패스워드*</td>
                        <td><input type="password" class="input_text" id="user_pw" maxlength="10"></td>
                    </tr>
                    <tr>
                        <td class="custom-cell">패스워드 확인*</td>
                        <td><input type="password" class="input_text" id="user_pw1" maxlength="10"></td>
                    </tr>
                    <tr>
                        <td class="custom-cell">연락처*</td>
                        <td><input type="text" class="input_text" id="user_phone" maxlength="13"></td>
                    </tr>
                    <tr>
                        <td class="custom-cell">주소*</td>
                        <td><input type="text" class="input_text" id="user_address" maxlength="30"></td>
                    </tr>
                </table>
            </div>
            <div class="button-container">
                <button type="button" class="button-container-black" id="btn_signup">신청</button>
            	<button type="button" class="button-container-white" id="btn_exit">취소</button>
            </div>
        </div>
    </form>
</div>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
    	
    	$(document).ready(function() {
    	    // 이름 입력창
    	    $("#user_name").on("input", function() {
    	        // 입력 중 공백이 있으면 제거
    	        var inputText = $(this).val();
    	        // 숫자인 경우 숫자를 제거
    	        var sanitizedText = inputText.replace(/\s/g, '').replace(/\d/g, ''); // 공백과 숫자 제거
    	        $(this).val(sanitizedText);
    	    });

    	    // 휴대폰 번호 입력창
    	    $("#user_phone").on("input", function() {
    	        var inputText = $(this).val();
    	        // 숫자와 하이픈만 남기고 모든 문자 제거
    	        var sanitizedText = inputText.replace(/[^\d-]/g, '');

    	        // 하이픈이 자동으로 추가되도록 처리
    	        if (sanitizedText.length > 3 && sanitizedText.charAt(3) !== '-') {
    	            sanitizedText = sanitizedText.slice(0, 3) + '-' + sanitizedText.slice(3);
    	        }
    	        if (sanitizedText.length > 8 && sanitizedText.charAt(8) !== '-') {
    	            sanitizedText = sanitizedText.slice(0, 8) + '-' + sanitizedText.slice(8);
    	        }

    	        // 입력 창에 반영
    	        $(this).val(sanitizedText);
    	    });
    	    
    	});
    	

		
        $(document).ready(function () {
        	var isIdChecked = false;
        	var finalUserId = ""; // 변수 추가
            // 중복 체크 버튼 클릭 시
            $("#checkDuplicateBtn").on("click", function (e) {
            	e.preventDefault();
                var user_id = $("#user_id").val();
                if (!user_id) {
                    alert("아이디를 입력하세요.");
                    return;
                }

                // 서버에 중복 체크 요청
                $.ajax({
                    url: "http://localhost:80/signupCheck",
                    type: "get",
                    data: { "user_id": user_id },
                    contentType: 'application/json; charset=UTF-8',
                    success: function (data) {
                        if (data) {
                            alert("허용 가능한 ID입니다.");
                            isIdChecked = true; // 중복 체크 성공 시 변수를 true로 설정
                            finalUserId = user_id;
                        } else {
                            alert("중복되는 ID입니다.");
                            isIdChecked = false; // 중복 체크 실패 시 변수를 false로 설정
                        }
                    },
                    fail: function (data) {
                        console.log("fail, " + data);
                    },
                    complete: function (data) {
                        console.log("comp", data);
                    }
                });
            });

            // 회원가입 버튼 클릭 시
            $("#btn_signup").on("click", function () {
                // 회원가입 정보를 가져오는 코드 추가
                let user_id = $("#user_id").val();
                let user_pw = $("#user_pw").val();
                let user_pwdConfirm = $("#user_pw1").val();
                let user_name = $("#user_name").val();
                let user_phone = $("#user_phone").val();
                let user_address = $("#user_address").val();

                if (!isIdChecked) {
                    alert("ID중복체크를 해주시기 바랍니다.");
                    return;
                }else if(user_id == ""){
    				alert("아이디를 입력해주세요.")
    				return;
    			}else if(user_pw == ""){
    				alert("패스워드를 입력해주세요.")
    				return;
    			}else if(user_pwdConfirm == ""){
    				alert("패스워드확인을 입력해주세요.")
    				return;
    			}else if(user_name == ""){
    				alert("이름을 입력해주세요.")
    				return;
    			}else if(user_phone == ""){
    				alert("연락처를 입력해주세요.")
    				return;
    			}else if(user_address == ""){
    				alert("주소를 입력해주세요.")
    				return;
    			}
    	        if (user_pw !== user_pwdConfirm) {
    	            alert("패스워드가 일치하지 않습니다.");
    	            return;
    	        }
                
                // 서버에 회원가입 요청
                $.ajax({
                    url: "http://localhost:80/postsignup",
                    type: "get",
                    data: {
                        "user_id": finalUserId,
                        "user_pw": user_pw,
                        "user_name": user_name,
                        "user_phone": user_phone,
                        "user_address": user_address
                    },
                    contentType: 'application/json; charset=UTF-8',
                    success: function (data) {
                        if (data) {
                            alert("신청되었습니다.");
                            window.location.href = "login";
                        } else {
                            alert("회원가입에 실패했습니다.");
                        }
                    },
                    fail: function (data) {
                        console.log("fail, " + data);
                    },
                    complete: function (data) {
                        console.log("comp", data);
                    }
                });
            });
        });
        
        $(document).ready(function () {
            // 취소 버튼 클릭 시
            $("#btn_exit").on("click", function () {
                // 로그인 페이지로 이동
                window.location.href = "login"; // 로그인 페이지의 URL로 변경해야 합니다.
            });
        });
    </script>

</body>
</html>