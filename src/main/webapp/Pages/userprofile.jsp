

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
    
    

	
    
	<div class="products-wrapper">
            <h3 class="main-title" id="studentList"> My Profile</h3>
          	
            <div class="table-container">
                <table border="1">
	<thead>
          <tr>
            <!-- <th>Product ID</th> -->
          
            <th>First Name</th>
            <th>Last Name</th>
            
            <th>Phone Number</th>
            <th>Address </th>
            
            
            <th>Email</th>
            <th>User Name</th>     
          </tr>
        </thead>
        

		<tbody>
			<c:forEach var="student" items="${studentList}">
						
						<tr>
						
							<td>${student.firstName}</td>
							<td>${student.lastName} </td>
							
							<td>${student.phoneNumber}</td>
							<td>${student.address}</td>
							
							
							<td>${student.email}</td>
							<td>${student.userName }</td>
						
							
						</tr>
			</c:forEach>
			</tbody>
	</table>	
	</div>
	</div>
</body>
</html>









