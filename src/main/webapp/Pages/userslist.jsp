

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

	<header>
    </header>
    
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
            <h3 class="main-title" id="studentList"> Users List</h3>
          	
            <div class="table-container">
                <table border="1">
	<thead>
          <tr>
            <!-- <th>Product ID</th> -->
          
            <th>First Name</th>
            <th>Last Name</th>
            <th>User Name</th>
            <th>Birthday</th>
            <th>Address </th>
            <th>Phone Number</th>
            <th>Gender</th>
            <th>Email</th>
                    
          </tr>
        </thead>
        

		<tbody>
			<c:forEach var="student" items="${studentList}">
						
						<tr>
						
							<td>${student.firstName}</td>
							<td>${student.lastName} </td>
							<td>${student.userName }</td>
							<td>${student.birthday}</td>
							<td>${student.address}</td>
							<td>${student.phoneNumber}</td>
							<td>${student.gender}</td>
							<td>${student.email}</td>
						
						
							
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









