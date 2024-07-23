<%@page import="util.StringUtils"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width", initial-scale="1.0">
    <title>Add Product Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet/AddProduct.css">
</head>

<body>
    <div class="container">
        <header>Add Product</header>

        <form action="/MySecondProject/AddProductServlet" method="post" enctype ="multipart/form-data">
            <div class="form-first">
                <div class="details-personal" style="margin-top: 80px;">
                   <!--  <span class="title">Product Details</span> -->

                    <div class="fields" style="margin-top: 20px;">
                        <div class="input-field">
                            <label>Product Name</label>
                            <input type="text" name="productName" placeholder="Enter product name" required>
                        </div>

                        <div class="input-field">
                            <label>Product Price</label>
                            <input type="text" name="productPrice" placeholder="Enter product price" required>
                        </div>

                        <div class="input-field">
                            <label>Product Description</label>
                            <input type="text" name="productDescription" placeholder="Enter product description" required>
                        </div>

                        <div class="input-field">
                            <label>Product Category</label>
                            <input type="text" name="productCategory" placeholder="Enter product category" required>
                        </div>

                        <div class="input-field">
                            <label>Stock Quantity</label>
                            <input type="number" name="stockQuantity" placeholder="Enter stock quantity" required>
                        </div>

                        <div class="input-field">
                            <label for="image">Product Image</label>
                            <input type="file" id="productImage" name="productImage" style="padding-top: 8px;">
                        </div>


                        </div>

                </div>

              <div class="details-ID">

                    <button class="submitBtn">
                        <span class="btnText">Add</span>
                    </button>

                </div>
            </div>
        </form>
    </div>
</body>
</html>