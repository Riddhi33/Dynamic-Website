<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link  rel= "stylesheet" href="${pageContext.request.contextPath}/stylesheet/adminproduct.css">
</head>
<body>

	

	<nav class="menu">
      <ul>
        <li><a href="${pageContext.request.contextPath}/AddProductlistServlet" id="dashboard-link"><b>Dashboard</b></a></li>
         <li><a href="${pageContext.request.contextPath}/AddProductlistServlet" id="products-link"><b>Products</b></a></li>
        <li><a href="${pageContext.request.contextPath}/StudentlistServlet" id="users-link"><b>Users</b></a></li>
        <li><a href="${pageContext.request.contextPath}/Pages/Adminprofile.jsp" id="users-link"><b>Profile</b></a></li>
        <li><a href="${pageContext.request.contextPath}/LogoutServlet" id="users-link"><b>Log Out</b></a></li>
        
      </ul>
    </nav>
    
	<div class="products-wrapper">
            <h3 class="main-title" id="productList"> Product List</h3>
          	<a href="${pageContext.request.contextPath}/Pages/AddProduct.jsp" ><button type="submit" >Add Product</button></a>
            <br>
            <br>
            <div class="table-container">
                <table border="1">
	<thead>
          <tr>
            
            <th>Product Name</th>
            <th>Product Price</th>
            <th>Product Description</th>
            <th>Product Category</th>
            <th>Stock Quantity</th>
        
            <th><span class="purple">Actions</span></th>
          </tr>
        </thead>
        

		<tbody>
			<c:forEach var="product" items="${productList}">
						
						<tr>
							<td>${product.productName}</td>
							<td>${product.productPrice} </td>
							<td>${product.productDescription }</td>
							<td>${product.productCategory}</td>
							<td>${product.stockQuantity }</td>
						
							<td class="action-buttons">
								<form method="post"
									action="${pageContext.request.contextPath}/ModifyServlet">
									<input type="hidden" name="updateId" value="${product.productID}" />
									<button type="submit">Update</button>
								</form>
								<form style="margin-left: 20px;" id="deleteForm-${product.productName}" method="post"
									action="${pageContext.request.contextPath}/DeleteProductServlet">
									<input type="hidden" name="deleteId" value="${product.productName}" />
									<button type="button"
										onclick="confirmDelete('${product.productName}')">Delete</button>
								</form>
							</td>
						</tr>
			</c:forEach>
			</tbody>
	</table>	
	</div>
	</div>
</body>
<script>
	function confirmDelete(productName) {
		if (confirm("Are you sure you want to delete this product: " + productName
				+ "?")) {
			document.getElementById("deleteForm-" + productName).submit();
		}
	}

</script>
</html>