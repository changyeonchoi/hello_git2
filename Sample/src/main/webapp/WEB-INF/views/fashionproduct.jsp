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
 * {
  box-sizing: border-box;
}

.carousel-wrapper {
  width: 500px;
  height: 300px;
  overflow: hidden;
}

.carousel-wrapper > .carousel {
  display: flex;
  transform: translate3d(0, 0, 0);
  transition: transform 0.2s;
}

.carousel-wrapper > .carousel > img {
  width: 500px;
  height: 300px;
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
		  <div class="carousel-wrapper">
      <div class="carousel">
        <img
          src="https://images.unsplash.com/photo-1602808180309-2e0c62986635?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
          alt=""
        />
        <img
          src="https://images.unsplash.com/photo-1583434987437-1b9dcbe44c9e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
          alt=""
        />
        <img
          src="https://images.unsplash.com/photo-1603052227529-e8ed43c7af99?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
          alt=""
        />
      </div>
    </div>
    <button class="prev" type="button">prev</button>
    <button class="next" type="button">next</button>
		</section>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
    const prevButton = document.querySelector('.prev');
    const nextButton = document.querySelector('.next');
    const carousel = document.querySelector('.carousel');

    let index = 0;

    prevButton.addEventListener('click', () => {
       if (index === 0) return;
       index -= 1;
       
       carousel.style.transform = `translate3d(-${500 * index}px, 0, 0)`;
    });

    nextButton.addEventListener('click', () => {
       if (index === 2) return;
       index += 1;
       
       carousel.style.transform = `translate3d(-${500 * index}px, 0, 0)`;
    });
    </script>

</body>
</html>