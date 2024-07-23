<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet/AboutUs.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet/homepage.css">
    <style>
        /* CSS styles here */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        h1, h2, h3 {
            color: #333;
            /* text-align: center; */
        }

        .section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .subsection {
            flex: 1;
            margin-right: 5px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .photo-detail-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .photo-detail {
            flex-basis: calc(50% - 10px);
            margin-bottom: 20px;
            display: flex;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .photo {
            flex: 1;
            margin-right: 10px;
        }

        .photo img {
            max-width: 100%;
            border-radius: 50%;
        }

        .detail {
            flex: 1;
            margin-left: 10px;
            padding: 20px;
        }

        .thank-you {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* New class for centering */
        .center {
            margin: 0 auto;
        }
    </style>
</head>
<body>

	<header>
        <a href="#" class="logo"><img src="${pageContext.request.contextPath}/resources/images/home/logo.png" alt="Logo"></a>
        <ul class="navmenu">
            <li><a href="${pageContext.request.contextPath}/Pages/homepage.jsp">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/UserProductServlet">Product</a></li>
            <!-- <li><a href="#">Blogs</a></li> -->
            <li><a href="${pageContext.request.contextPath}/Pages/AboutUs.jsp">About Us</a></li>
            <li><a href="${pageContext.request.contextPath}/Pages/ContactUs.jsp">Contact Us</a></li>
        </ul>

        <div class="nav-icon">
            <!-- <a href="#"><i class='bx bx-search'></i></a> -->
            <a href="#"><i class='bx bx-user'></i></a>
            <a href="cart.html"><i class='bx bx-cart'></i></a>
            <a href="${pageContext.request.contextPath}/LogoutServlet" class="login-btn">Logout</a>
            <a href="${pageContext.request.contextPath}/UserProfileServlet" class="login-btn">View Profile</a>
            <!-- <a href="#" class="login-btn">Register</a>     -->

            <!-- <div class="bx bx-menu" id="menu-icon"></div> -->
        </div>
    </header>


    <div class="container5" style="margin-top: 70px">
        
        <!-- Photo and Detail sections -->
        <div class="photo-detail-grid" style="margin-top: 100px">
            <div class="photo-detail">
                <div class="photo">
                    <img src="${pageContext.request.contextPath}/resources/images/aboutus/Riddhi.jpg" alt="Photo 1">
                </div>
                <div class="detail">
                    <h3>Name: Riddhi Khanal</h3>
                    <p>Address: Kamalpokhari, Kathmandu</p>
                    <p>Email: khanal.riddhi@gmail.com</p>
                    <p>Phone NO: 9843011723</p>
                </div>
            </div>
            <div class="photo-detail">
                <div class="detail">
                    <h3>Name: Ajay Bhujel</h3>
                    <p>Address: Chabahil, Kathmandu</p>
                    <p>Email: ajaybhujel71@gmail.com</p>
                    <p>Phone NO: 9841525050</p>
                </div>
                <div class="photo">
                    <img src="${pageContext.request.contextPath}/resources/images/aboutus/AJay.png" alt="Photo 2">
                </div>
            </div>
            <div class="photo-detail">
                <div class="photo">
                    <img src="${pageContext.request.contextPath}/resources/images/aboutus/Nikant.jpeg" alt="Photo 3">
                </div>
                <div class="detail" style="margin-top: 70px">
                    <h3>Name: Nikant Gharti Magar</h3>
                    <p>Address: Kapan, Kathmandu</p>
                    <p>Email: nikantmagar@gmail.com</p>
                    <p>Phone NO: 9809598299</p>
                </div>
            </div>
            <div class="photo-detail">
                <div class="detail" style="margin-top: 70px">
                    <h3>Name: Ankit Karna</h3>
                    <p>Address: Balwatar, Kathmandu</p>
                    <p>Email: karnaankit064@gmail.com</p>
                    <p>Phone NO: 9827557766</p>
                </div>
                <div class="photo">
                    <img src="${pageContext.request.contextPath}/resources/images/aboutus/Ankit.jpeg" alt="Photo 4">
                </div>
            </div>
            <div class="photo-detail center"> <!-- Modified class here -->
                <div class="photo">
                    <img src="${pageContext.request.contextPath}/resources/images/aboutus/Bishal.jpg" alt="Photo 5">
                </div>
                <div class="detail" style="margin-top: 90px">
                    <h3>Name: Bishal Prasai</h3>
                    <p>Address: Balwakhani, Kathmandu</p>
                    <p>Email: bishalprasain18@gmail.com</p>
                    <p>Phone NO: 9817994959</p>
                </div>
            </div>
        </div>
        
        <div class="thank-you">
            <p>Thank You</p>
        </div>
    </div>
</body>
</html>
