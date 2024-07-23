<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to Melody Mart</title>


	<link rel="stylesheet" type="text/css"

	href="${pageContext.request.contextPath}/stylesheet/homepage.css" />
	
</head>
<body>
<%
		String userSession = (String) session.getAttribute("userName");
		String cookieUsername  = null;
		String cookieSessionID = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie: cookies){
				if(cookie.getName().equals("user")) cookieUsername = cookie.getValue();
				if(cookie.getName().equals("JSESSIONID")) cookieSessionID = cookie.getValue();
			}
		}
	%>
 <header>
        <a href="#" class="logo"><img src="${pageContext.request.contextPath}/resources/images/home/logo.png" alt="Logo"></a>
        <ul class="navmenu">
            <li><a href="#">Home</a></li>
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

    <section class="main-home" style="background-image: url(${pageContext.request.contextPath}/resources/images/home/back44.png);">
        <div class="main-text">
            <h1>Melody Mart</h1>
            <p>"Break the Silence, Break the Mold"</p>

            <a href="${pageContext.request.contextPath}/UserProductServlet" class="main-btn">Shop Now <i class='bx bx-right-arrow-alt' style="background-color: #fff;"></i></a>
        </div>

    
    </section>

    <div class="center-text" style="margin-top: 120px;">
        <h2>Why <span>Choose Us?</span></h2>
    </div>

    <div class="service">
        <div class="section">
            <div class="Slogo"><i class='bx bxs-truck'></i></div>
            <div class="stext">
            <h3>Free Delivery</h3>
            <p>On Checkout Via Esewa or Khalti</p>
            </div>
        </div>

        <div class="section">
            <div class="Slogo"><i class='bx bx-recycle'></i></div>
            <div class="stext">
            <h3>Easy Exchange</h3>
            <p>7 Days Easy Exchange Policy</p>
            </div>
        </div>

        <div class="section">
            <div class="Slogo"><i class='bx bxs-credit-card'></i></div>
            <div class="stext">
            <h3>Secure Payment</h3>
            <p>100% Encrypted Transaction</p>
            </div>
        </div>

        <div class="section">
            <div class="Slogo"><i class='bx bx-message-rounded-dots'></i></div>
            <div class="stext">
            <h3>24/7 Support</h3>
            <p>Dedicated Support</p>
            </div>
        </div>
    </div>



 
    <section class="trending-product" id="trending" style="margin-top: 80px;">
        <div class="center-text">
            <h2>Our Trending <span>products</span></h2>
        </div>

        <div class="products">
            <div class="row">
                <img src="${pageContext.request.contextPath}/resources/images/home/1.png" alt="Image">
                <div class="product-text">
                    <h5>Sale</h5>
                </div>
                <div class="heart-icon">
                    <i class='bx bx-heart'></i>
                </div>
                <div class="rating">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star-half'></i>
                </div>

                <div class="price">
                    <h4>boAt Stone 180 5W Bluetooth Speaker</h4>
                    <p>Rs. 1,299</p>
                </div>
            </div>

            <div class="row">
                <img src="${pageContext.request.contextPath}/resources/images/home/2.png" alt="Image">
                <div class="product-text">
                    <h5>New</h5>
                </div>
                <div class="heart-icon">
                    <i class='bx bx-heart'></i>
                </div>
                <div class="rating">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star-half'></i>
                    <i class='bx bx-star'></i>    
                </div>

                <div class="price">
                    <h4>boAt Stone 650 10W Bluetooth Speaker</h4>
                    <p>Rs. 1,999</p>
                </div>
            </div>

            <div class="row">
                <img src="${pageContext.request.contextPath}/resources/images/home/3.png" alt="Image">

                <div class="heart-icon">
                    <i class='bx bx-heart'></i>
                </div>
                <div class="rating">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star-half'></i>
                </div>

                <div class="price">
                    <h4>JBL Go 3, Wireless Ultra Portable Bluetooth Speaker</h4>
                    <p>Rs. 2,799</p>
                </div>
            </div>

            <div class="row">
                <img src="${pageContext.request.contextPath}/resources/images/home/4.png" alt="Image">
                <div class="product-text">
                    <h5>Hot</h5>
                </div>
                <div class="heart-icon">
                    <i class='bx bx-heart'></i>
                </div>
                <div class="rating">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star-half'></i>
                </div>

                <div class="price">
                    <h4>Tribit[Upgraded Version]Bluetooth Speaker</h4>
                    <p>Rs. 2,199</p>
                </div>
            </div>

            <div class="row">
                <img src="${pageContext.request.contextPath}/resources/images/home/5.png" alt="Image">

                <div class="heart-icon">
                    <i class='bx bx-heart'></i>
                </div>
                <div class="rating">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star-half'></i>
                </div>

                <div class="price">
                    <h4>ZEBRONICS New Launch Pixie Portable Speaker</h4>
                    <p>Rs. 699</p>
                </div>
            </div>

            <div class="row">
                <img src="${pageContext.request.contextPath}/resources/images/home/6.png" alt="Image">
                <div class="product-text">
                    <h5>Hot</h5>
                </div>
                <div class="heart-icon">
                    <i class='bx bx-heart'></i>
                </div>
                <div class="rating">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                </div>

                <div class="price">
                    <h4>Portronics SoundDrum 1 10W TWS Portable Bluetooth 5.3 Speaker</h4>
                    <p>Rs. 999</p>
                </div>
            </div>

            <div class="row">
                <img src="${pageContext.request.contextPath}/resources/images/home/7.png" alt="Image">
                <div class="product-text">
                    <h5>Sale</h5>
                </div>
                <div class="heart-icon">
                    <i class='bx bx-heart'></i>
                </div>
                <div class="rating">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star-half'></i>
                    <i class='bx bx-star'></i>    
                </div>

                <div class="price">
                    <h4>Marshall Willen 10 W Portable Bluetooth Speaker</h4>
                    <p>Rs. 9,999</p>
                </div>
            </div>

            <div class="row">
                <img src="${pageContext.request.contextPath}/resources/images/home/8.png" alt="Image">
                <div class="product-text">
                    <h5>Sale</h5>
                </div>
                <div class="heart-icon">
                    <i class='bx bx-heart'></i>
                </div>
                <div class="rating">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star-half'></i>
                </div>

                <div class="price">
                    <h4>ZEBRONICS Hammer Dual Tower Speaker</h4>
                    <p>Rs. 8,999</p>
                </div>
            </div>
        </div>
    </section>



    <div class="container2">
        <div class="left-side">
            <h2 class="heading">Deal of the Day !!!</h2>
            <p class="text">Best speakers at Unbeatable Prices Everyday</p>
            <div class="box-container">
                <div class="box">
                    <span>1</span>
                    <p>Days</p>
                </div>

                <div class="box">
                    <span>4</span>
                    <p>Hrs</p>
                </div>

                <div class="box">
                    <span>24</span>
                    <p>Mins</p>
                </div>
            </div>
            <div class="button-container">
                <button class="shop-button"><a href="${pageContext.request.contextPath}/UserProductServlet">Shop Now</a></button>
            </div>
        </div>

        <div class="right-side">
            <img src="${pageContext.request.contextPath}/resources/images/home/8.png" alt="Image" style="width: 100%; height: auto;">
        </div>
    </div>



    <section class="category-product" style="margin-top: 80px;">
        <div class="center-text">
            <h2>Our <span>categories</span></h2>
        </div>

        <sectio class="products">
            <div class="row">
                <img src="${pageContext.request.contextPath}/resources/images/home/prod9.png" alt="Image">
                <div class="heart-icon">
                    <i class='bx bx-heart'></i>
                </div>
                <div class="rating">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star-half'></i>
                </div>

                <div class="price">
                    <h4 style="font-weight: 600;">Floorstanding Speakers</h4>
                </div>
            </div>

            <div class="row">
                <img src="${pageContext.request.contextPath}/resources/images/home/prod7.png" alt="Image">
                <div class="product-text">
                    <h5>New</h5>
                </div>
                <div class="heart-icon">
                    <i class='bx bx-heart'></i>
                </div>
                <div class="rating">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star-half'></i>
                    <i class='bx bx-star'></i>    
                </div>

                <div class="price">
                    <h4 style="font-weight: 600;">Outdoor Speakers</h4>
                </div>
            </div>

            <div class="row">
                <img src="${pageContext.request.contextPath}/resources/images/home/prod18.png" alt="Image">

                <div class="heart-icon">
                    <i class='bx bx-heart'></i>
                </div>
                <div class="rating">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star-half'></i>
                </div>

                <div class="price">
                    <h4 style="font-weight: 600;">Bookshelf Speakers</h4>
                </div>
            </div>

            <div class="row">
                <img src="${pageContext.request.contextPath}/resources/images/home/prod14.png" alt="Image">
                <div class="product-text">
                    <h5>Hot</h5>
                </div>
                <div class="heart-icon">
                    <i class='bx bx-heart'></i>
                </div>
                <div class="rating">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star-half'></i>
                </div>

                <div class="price">
                    <h4 style="font-weight: 600;">Soundbars</h4>
                </div>

            </div>    
        </div>
    </section>      

    

    <section class="cleint-reviews" style="margin-top: 50px;">
        <div class="reviews">
            <h3>Client Review</h3>
            <img src="${pageContext.request.contextPath}/resources/images/home/client1.jpg" alt="Image">
            <p>"Exceptional clarity and depth define the speaker's performance, immersing listeners in a rich audio experience that captivates from the first note to the last."</p>
            <h2>Aman Gupta</h2>
            <p>Founder of bOAt</p>
        </div>
    </section>

    <section class="full-section" style="background-image: url(${pageContext.request.contextPath}/resources/images/home/final.png);">
        <div class="overlay-content">
            <h1>Click here to Get yourself a speaker now</h1>
            <button class="last-btn"><a href="${pageContext.request.contextPath}/UserProductServlet">Shop Now</a></button>
        </div>
        
    </section>



    <section class="contact">
        <div class="contact-info">
            <div class="first-info">
                <img src="${pageContext.request.contextPath}/resources/images/home/logo.png" alt="logo">

                <p>Kamalpokhari, <br> Kathmandu</p>
                <p>9827557766</p>
                <p>speakers@melodymart.com</p>

                <div class="social-icons">
                    <a href="#"><i class='bx bxl-facebook' ></i></a>
                    <a href="#"><i class='bx bxl-instagram-alt'></i></a>
                    <a href="#"><i class='bx bxl-linkedin'></i></a>
                    <a href="#"><i class='bx bxl-twitter'></i></a>
                </div>
            </div>

            <div class="second-info">
                <h4>Support</h4>
                <p>Contact Us</p>
                <p>About Us</p>
                <!-- <p>Speaker Guide</p> -->
            </div>
            
            <div class="third-info">
                <h4>Shop</h4>
                <p>See Products</p>
                <p>View Cart</p>
                <!-- <p>About Us</p> -->
            </div>

            <div class="fourth-info">
                <h4>Subscribe</h4>
                <p>Receive Updates, Hot Delas, Disocunts Sent Straight In Your Inbox Daily</p>
            </div>

        </div>
    </section>

    <div class="end-text">
        <p>Copyright©  By Melody Mart. All Rights Reserved.</p>
    </div>
</body>

</body>
</html>