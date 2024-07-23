

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Cart</title>
    <link rel="stylesheet" type="text/css"

	href="${pageContext.request.contextPath}/stylesheet/homepage.css" />
	
</head>

    <style>

        table {

            border-collapse: collapse;

            width: 100%;

        }

        th, td {

            border: 1px solid black;

            padding: 8px;

            text-align: left;

        }

    </style>



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
            <a href="${pageContext.request.contextPath}/LogoutServlet" class="login-btn">Logout</a>
             <a href="${pageContext.request.contextPath}/UserProfileServlet" class="login-btn">View Profile</a>
        </div>
    </header>

<body style="margin-top: 200px">

    <h1 style="color: green">Cart Products</h1>

    <table style="margin-top:20px">

        <thead>

            <tr>

                <th>Product ID</th>

                <th>Cart Quantity</th>

               

            </tr>

        </thead>

        <tbody>

            <c:forEach var="item" items="${cartItems}">

                <tr>

                    <td>${item.productID}</td>
                    
                    

                    <td>${item.cartQuantity}</td>


                </tr>

            </c:forEach>

        </tbody>

    </table>

    <br><br>

</body>

</html>