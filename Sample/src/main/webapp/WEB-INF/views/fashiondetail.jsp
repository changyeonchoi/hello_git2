<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>HTML5</title>
<style type="text/css">
	body {
		text-align: center;
		width: 1500px;
	}
	div#wapper {
		width: 100%;
		text-align: left;
		min-height: 300px;
		margin: 0 auto;
	}
	header, footer, nav, aside, section {
		margin: 5px;
		padding: 10px;
	}
	header {
		height: 50px;
	}
	nav, section, aside { 
		float: left;
		height: 700px;
	}
	nav {
		width: 180px;
		display: inline-block;
		border-right: 5px solid red;
	}
	section {
		width: 1200px; 
	}
	aside {
		background-color: goldenrod;
		width: 100px; 
	}
	footer {
		height: 50px;
		background-color: blue;
		position: relatiev;
		clear: both;
	}
	article {
		width: 90%;
		margin: 20px;
		background-color: #999;
	}
	.red-text{
		color: red;
	}
    header p {
        display: inline-block;
        margin-right: 10px; 	
    }
    header .right-align {
        float: right;
    }    
    .product-container {
    	display: flex;
    	align-items: center;
    }

    .product-container img {
    	max-width: 100%;
    	height: auto;
    	margin-right: 10px;
    }
</style>
 
</head>
<body>
	<div id="wapper">
		<!--헤더시작-->
		<header>
			<p class="red-text">BT</p>
			<p>Fashion</p>
			<p>Make Up</p>
			<p>Accessory</p>
			<p>검색</p>
			
			<p class="right-align"><a href="login">Login</a></p>
			<p class="right-align">MY</p>
		</header>
		<!--네비게이션-->
		<nav>
			<a href="" class="red-text">계절 유행STYLE</a><br><br>
			<a href="">게시판</a>
		</nav>
		<!--콘텐츠부분-->
		<section>
		<div class="product-container">
				<img src="data:image/jpeg;base64,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" alt="Image 1"/>
				<strong>가을용 가디건</strong><br>
				정상가 3,100원<br>
				쿠폰적용가 2,790원<br>
				
				배송비 2000원<br>
				판매업체 무신사<br>
				<button>주문하기</button>
<!-- 			<article> -->
<!-- 				<p>article</p> -->
<!-- 			</article> -->
			</div>
		</section>
	</div>
</body>
</html>