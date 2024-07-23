<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile</title>
<link  rel= "stylesheet" href="${pageContext.request.contextPath}/stylesheet/adminproduct.css">
<style>
  body, html {
    margin: 0;
    padding: 0;
    height: 100%;
    font-family: Arial, sans-serif;
  }

  .full-screen {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #fff;
  }

  .profile-container {
    margin: 400px;
    border: 2px solid black;
    padding: 20px;
    text-align: center;
    border-radius: 10px;
    background-color: #d9d9d9;
  }

  .profile-image {
    border-radius: 50%;
    width: 150px;
    height: 150px;
    object-fit: cover;
    margin-bottom: 10px;
  }

  .profile-container h1 {
    margin-top: 0;
    font-weight: bold;
  }

  p {
    margin: 5px 0;
  }
</style>
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
    
    
  <div class="full-screen">
    <div class="profile-container">
      <h1>Admin Profile</h1>
      <img class="profile-image" src="${pageContext.request.contextPath}/resources/images/admin/Riddhi.jpg" alt="Admin Profile Image">
      <p style="font-weight: bold;">Admin</p>
      <p style="margin-top: 20px;">First Name: Riddhi</p>
      <p>Last Name: Khanal</p>
      <p>Contact: 9824065980</p>
      <p>Gender: Female</p>
      <p>Email: khanal@admin.com</p>
    </div>
  </div>
</body>
</html>
