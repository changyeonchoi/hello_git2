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
		border: 1px solid #999;
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
		background-color: goldenrod;
		width: 100px;
	}
	section {
		background-color: green;	
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
        margin-right: 10px; /* Optional: Add some space between the <p> elements */
    }
    header .right-align {
        float: right;
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
			<p>nav</p>
			<ul>
				<li><a href="">link</a></li>
				<li><a href="">link</a></li>
				<li><a href="">link</a></li>
			</ul>
		</nav>
		<!--콘텐츠부분-->
		<section>
			<p>section</p>
			<article>
				<p>article</p>
			</article>
		</section>
		<!--사이드바-->
		<aside>
			<p>aside</p>
		</aside>
		<!--풋터-->
		<footer>footer</footer>
	</div>
</body>
</html>