<%@page import="model.ProductModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Product Page</title>
	<link rel="stylesheet" type="text/css"
		href="/MySecondProject/stylesheet/userproduct.css" />
</head>
<body>
	
<header>
        <a href="#" class="logo"><img src="${pageContext.request.contextPath}/resources/images/home/logo.png" alt="Logo"></a>
        <ul class="navmenu">
            <li><a href="${pageContext.request.contextPath}/Pages/homepage.jsp">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/UserProductServlet">Product</a></li>
            <li><a href="${pageContext.request.contextPath}/Pages/AboutUs.jsp">About Us</a></li>
            <li><a href="${pageContext.request.contextPath}/Pages/ContactUs.jsp">Contact Us</a></li>
        </ul>

        <div class="nav-icon">
            <a href="#"><i class='bx bx-user'></i></a>
            <a href="cart.html"><i class='bx bx-cart'></i></a>
            <form action="#" method="GET">
        <input type="text" name="query" placeholder="Search for products...">
        <button type="submit">Search</button>
    		</form>
            <a href="${pageContext.request.contextPath}/LogoutServlet" class="login-btn">Logout</a>
             <a href="${pageContext.request.contextPath}/UserProfileServlet" class="login-btn">View Profile</a>
        </div>
    </header>


	<div class="product-info">
		<div class="prod">

			<c:if test="${empty productList}">
				<p>No products found.</p>
			</c:if>

			<c:if test="${not empty productList}">
				<c:forEach var="product" items="${productList}">
					<div class="card">
						<img src="resources/images/product/${product.imageUrlFromPart}"
							class="card-img-top" alt="product image">
							<br>
							<br>
						<div class="card-body">
							<h1 class="card-title">${product.productName}</h1>
							<br>
								<h4 class="availability"><span style="font-size: 16px;">Description:</span> ${product.productDescription}</h4>
								<br>
							<h5 class="price"><span class="card-text">Price: Rs </span>${product.productPrice}</h5>
							<br>
							<form class = "purchase-info" action="/MySecondProject/AddtoCartServlet" method="post">
    						<input type="number" name="cartQuantity" min="1" value="1" max="${product.stockQuantity}">
    						<input type="hidden" name="productID" value="${product.productID}"/>
    					
    						<button class="btn">
        					Add to cart <i class="fas fa-shopping-cart"></i>
    						</button>
							</form>
							
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>

</body>
</html>