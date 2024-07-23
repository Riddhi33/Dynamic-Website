<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" type="text/css"

	href="${pageContext.request.contextPath}/stylesheet/homepage.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f2f2f2;
        }

        .contact-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        .button-bar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            margin-top: 10px;
        }

        .button-bar button {
            padding: 10px 15px;
            margin-right: 45px;
            margin-left: 10px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        .button-bar button:hover {
            background-color: #45a049;
        }

        input[type="text"],
        textarea,
        input[type="email"],
        input[type="tel"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>

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
            <!-- <a href="#"><i class='bx bx-search'></i></a> -->
            <a href="#"><i class='bx bx-user'></i></a>
            <a href="cart.html"><i class='bx bx-cart'></i></a>
            <a href="${pageContext.request.contextPath}/LogoutServlet" class="login-btn">Logout</a>
             <a href="${pageContext.request.contextPath}/UserProfileServlet" class="login-btn">View Profile</a>
        </div>
    </header>
    
    <body>
    <div class="contact-form" style="margin-top: 110px">
        <h2>Contact Us</h2>
        <div class="button-bar">
            <button id="support-btn">Support</button>
            <button id="sales-btn">Sales</button>
            <button id="general-btn">General</button>
        </div>
        <form id="contact-form">
            <input type="text" name="first-name" placeholder="First Name" required><br>
            <input type="text" name="last-name" placeholder="Last Name" required><br>
            <textarea name="message" placeholder="Message" rows="4" required></textarea><br>
            <input type="tel" name="phone" placeholder="Mobile Phone Number" required><br>
            <input type="email" name="email" placeholder="Email" required><br>
            <input type="submit" value="Send it">
        </form>
    </div>

    <script src="https://cdn.emailjs.com/dist/email.min.js"></script>
    <script>
        (function () {
            emailjs.init("ylzjWcevjoQ98qraf");
        })();

        document.getElementById('contact-form').addEventListener('submit', function (event) {
            event.preventDefault();
            emailjs.sendForm('service_e02fhgj', 'template_thggg2i', this)
                .then(function () {
                    alert('Your message has been sent successfully!');
                }, function (error) {
                    alert('Oops... ' + JSON.stringify(error));
                });
        });
    </script>
</body>
</body>
</html>