<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Sign In Page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/login.css" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>

    <div class="container">
        <div class="content">
            <img src="${pageContext.request.contextPath}/resources/images/home/logo.png" alt="Logo">
            <div class="text-sci">  
                <h2>Welcome To Melody Mart</h2>
                <p>"Break the Silence, Break the Mold"</p>
                <div class="social-icons">
                    <a href="#"><i class='bx bxl-linkedin'></i></a>
                    <a href="#"><i class='bx bxl-facebook-circle' ></i></a>
                    <a href="#"><i class='bx bxl-instagram-alt' ></i></a>
                    <a href="#"><i class='bx bxl-twitter'></i></a>
                </div>
            </div>
        </div>

        <div class="logreg-box">
            <div class="form-box login">
                <form action="/MySecondProject/LoginServlet" method="post">
                    <h2>Log In</h2>

                    <div class="input-box">
                        <span class="icon"><i class='bx bxs-envelope'></i></span>
                        <input type="text" id="userName" name="userName" required>
                        <label for="userName">Username</label>
                    </div>
 
                    <div class="input-box">
                        <span class="icon"><i class='bx bxs-lock-alt'></i></span>
                        <input type="password" id="password" name="password" required>
                        <label for="password">Password</label>
                    </div>

                    <div class="remember-forgot">
                        <label><input type="checkbox">Remember Me</label>
                        <a href="#">Forgot Password?</a>
                    </div>

                    <button type="submit" class="btn">LogIn</button>

                    <div class="login-register">
                        <p>Don't have an account? <a href="${pageContext.request.contextPath}/Pages/register.jsp"
                        class="register-link"><u>Sign Up Here</u></a></p>
                    </div>
                </form>
            </div>
        </div>

    </div>

</body>
</html>