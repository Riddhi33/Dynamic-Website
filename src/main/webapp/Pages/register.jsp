<%@page import="util.StringUtils"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

    

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/register.css" />

</head>

<body>

	<div class="container">
	
		

		<%-- Display error message if it exists --%>

		<%

		String errorMessage = (String) request.getAttribute("errorMessage");

		if (errorMessage != null && !errorMessage.isEmpty()){

		%>

		<p class = "errorMessage"><%=errorMessage %></p>

		<%

		}

		%> 
    	<div class="container">
        <header>Register Here</header>

        <form action="/MySecondProject/RegisterServlet" method="post" enctype ="multipart/form-data">
            <div class="form-first">
                <div class="details-personal">
                    <span class="title">Personal Details</span>

                    <div class="fields">
                        <div class="input-field">
                            <label for="firstName">First Name</label>
                            <input type="text" placeholder="Enter your first name" id="firstName" name="firstName" required>
                        </div>

                        <div class="input-field">
                            <label for="lastName">Last Name</label>
                            <input type="text" placeholder="Enter your last name" id="lastName" name="lastName" required>
                        </div>

                        <div class="input-field">
                            <label for="birthday">Date of Birth</label>
                            <input type="date" placeholder="Enter birth date" id="birthday" name="birthday" required>
                        </div>

                        <div class="input-field">
                            <label for="phoneNumber">Phone Number</label>
                            <input type="number" placeholder="Enter your phone number" id="phoneNumber" name="phoneNumber" required>
                        </div>

                        <div class="input-field">
                            <label for="address">Address</label>
                            <input type="text" placeholder="Enter your address" id="address" name="address" required>
                        </div>

                        <div class="input-field">
                            <label for="gender">Gender</label>
                            <div class="radio-button">
                                <label for="male">
                                    <input type="radio" id="male" name="gender" value="male">
                                    Male
                                </label>
                                <label for="female">
                                    <input type="radio" id="female" name="gender" value="female">
                                    Female
                                </label>
                            </div>
                        </div>
						</div>
                    </div>
                </div>

                <div class="details-ID">
                    <span class="title">User Details</span>

                    <div class="fields">
                        <!-- <div class="input-field">
                            <label for="userID">User ID</label>
                            <input type="text" placeholder="Enter your user ID" id="userID" name="userID" required>
                        </div> -->

                        <div class="input-field">
                            <label for="userName">Username</label>
                            <input type="text" placeholder="Enter your user name" id="userName" name="userName" required>
                        </div>
                        
                         <div class="input-field">
                            <label for="email">Email</label>
                            <input type="email" placeholder="Enter your email" id="email" name="email" required>
                        </div>

                        
                         <div class="input-field">
                            <label for="password">Password</label>
                            <input type="password" placeholder="Enter password" id="password" name="password" required>
                        </div>
                        
                        <div class="input-field">
                         <label for="retypePassword">Retype Password:</label> <input

						  type="password" placeholder="Retype password" id="retypePassword" name="retypePassword" required>

				</div>

                        <div class="input-field">
				
					<label for="image">Profile Picture</label> <input type="file"
						id="image" name="image">
				</div>
                    

                    <button class="submitBtn" type="submit">
                        <span class="btnText">Submit</span>
                    </button>
                    <p> Already have an account? <a href="${pageContext.request.contextPath}/Pages/login.jsp"
                        class="register-link"><u>LogIn Here</u></a></p>
                    
                </div>
            </div>
        </form>
    </div>
  </div>
</body>

</html>