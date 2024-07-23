<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product Page</title>
 <link  rel= "stylesheet" href="${pageContext.request.contextPath}/stylesheet/updateproduct.css">
</head>
<body>

	<div class="container">
        <header>Update Product</header>

    <form action="/MySecondProject/UpdateProductServlet" method="post" enctype="multipart/form-data">
         <div class="form-first">
                <div class="details-personal" style="margin-top: 80px;">

                    <div class="fields" style="margin-top: 20px;">
                        <div class="input-field">
                            <label>Product Name</label>
                            <input type="text" id="productName" name="productName" value="${product.productName}"/>
                        </div>

                        <div class="input-field">
                            <label>Product Price</label>
                            <input type="text" id="productPrice" name="productPrice" value="${product.productPrice}"/> 
                        </div>

                        <div class="input-field">
                            <label>Product Description</label>
                            <input type="text" id="productDescription" name="productDescription" value="${product.productDescription}"/> 
                        </div>

                        <div class="input-field">
                            <label>Product Category</label>
                            <input type="text" id="productCategory" name="productCategory" value="${product.productCategory}"/> 
                        </div>

                        <div class="input-field">
                            <label>Stock Quantity</label>
                            <input type="number" id="stockQuantity" name="stockQuantity" value="${product.stockQuantity}"/>
                            <input type="hidden" name="productID" value="${product.productID }">
                        </div>

                        <div class="input-field">
                            <label for="image">Product Image</label>
                            <input type="file" id="product-image" name="product-image" value=""/>
                        </div>


                       
                    <button class="submitBtn">
                        <span class="btnText">Update</span>
                    </button>

                </div>
            </div>
            </div>
        
    </form>
  </div>
</body>
</html>