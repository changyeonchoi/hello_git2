<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.main.vo.ProductVo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- productList는 서버에서 전달받은 상품 목록이라 가정 -->
<c:forEach var="product" items="${productList}">
    <a href="${product.jspPage}">
        <img src="${product.file_img}" alt="${product.banner_title}">
    </a>
</c:forEach>
</body>
</html>