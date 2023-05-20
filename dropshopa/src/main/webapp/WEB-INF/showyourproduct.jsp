<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- Meta Tag -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name='copyright' content=''>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Title Tag  -->
<title>Eshop - eCommerce HTML5 Template.</title>
<!-- Favicon -->
<link rel="icon" type="image/png" href="images/favicon.png">
<!-- Web Font -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
	type="text/css" rel="stylesheet">

<!-- StyleSheet -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<!-- Magnific Popup -->
<link type="text/css" rel="stylesheet" href="css/magnific-popup.min.css">
<!-- Font Awesome -->
<link type="text/css" rel="stylesheet" href="css/font-awesome.css">
<!-- Fancybox -->
<link type="text/css" rel="stylesheet"
	href="css/jquery.fancybox.min.css">
<!-- Themify Icons -->
<link type="text/css" rel="stylesheet" href="css/themify-icons.css">
<!-- Nice Select CSS -->
<link type="text/css" rel="stylesheet" href="css/niceselect.css">
<!-- Animate CSS -->
<link type="text/css" rel="stylesheet" href="css/animate.css">
<!-- Flex Slider CSS -->
<link type="text/css" rel="stylesheet" href="css/flex-slider.min.css">
<!-- Owl Carousel -->
<link type="text/css" rel="stylesheet" href="css/owl-carousel.css">
<!-- Slicknav -->
<link type="text/css" rel="stylesheet" href="css/slicknav.min.css">

<!-- Eshop StyleSheet -->
<link type="text/css" rel="stylesheet" href="css/reset.css">
<link type="text/css" href="/css/style.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/responsive.css">
<link type="text/css" rel="stylesheet" href="css/show-one-product.css">






</head>
<body class="js" style="height: auto">

	<!-- Header -->
	<header class="header shop">

		<!-- Header Inner -->
		<div class="header-inner">
			<div class="container">
				<div class="cat-nav-head">
					<div class="row">
						<div class="col-12">
							<div class="menu-area">
								<!-- Main Menu -->
								<nav class="navbar navbar-expand-lg">
									<div class="navbar-collapse">
										<div class="nav-inner">
											<!-- Logo -->
											<div class="logo">
												<a href="index.html"><img
													src="https://dropshop.network/assets/img/logo.png"
													alt="logo"
													style="width: 50px; height: 50px; margin-right: 150px"></a>
											</div>
											<!--/ End Logo -->
											<ul class="nav main-menu menu navbar-nav">
												<li class="active"><a href="/welcome">Home</a></li>
												<li><a href="/delivery/new">need a delivery ?</a></li>
												<li><a href="#">Category<i class="ti-angle-down"></i><span
														class="new">New</span></a>
													<ul class="dropdown">
														<c:forEach items="${category}" var="category">
															<li><a
																href="http://localhost:8080/productbycat/${category.id}">${category.nametype}</a></li>
														</c:forEach>


													</ul></li>
												<li><a href="/user/${user_id}">Profile</a></li>



												<li><a href="/seller">ADD product</a></li>
												<li id="bb"><a href="/logout"><button type="button"
															class="btn btn-light">Log Out</button></a>
												<li />
											</ul>

										</div>
									</div>
								</nav>
								<!--/ End Main Menu -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ End Header Inner -->
	</header>


	<div class="d-flex p-2">
		<c:forEach var="product" items="${products}">
			<div class="container">
				<div class="row card-deck">
					<div class="col-lg-4" style="width: 400px">
						<div class="card" class="p-2">
							<img src="${product.picture }" class="card-img-top" style="height:400px"
								alt="Product 1">
							<div class="card-body">
								<h3 class="card-title">
									<c:out value="${product.getNameofproduct()}" />
								</h3>
								<h5 class="card-text">${product.getDescription()}</h5>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a href="/products/show/${product.id }"><button
												type="button" class="btn btn-sm">View</button></a>
										<button type="button" class="btn btn-sm">contact
											buyer</button>
											<form action="/productsdelete/${product.id }" method="post">
                 <input type="hidden" name="_method" value="delete">
               <input type="submit" value="Delete" class="btn btn-danger">
              </form>
									</div>
									<h6 class="price">${product.getPrice()} dt</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		
	</div>




	<footer class="footer">
		<!-- Footer Top -->
		<div class="footer-top section">
			<div class="container">
				<div class="row">
					<div class="col-lg-5 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer about">
							<div class="logo">
								<a href="index.html"><img
									src="https://dropshop.network/assets/img/logo.png"
									style="width: 100px; height: 100px"></a>
							</div>
							<p class="text">Praesent dapibus, neque id cursus ucibus,
								tortor neque egestas augue, magna eros eu erat. Aliquam erat
								volutpat. Nam dui mi, tincidunt quis, accumsan porttitor,
								facilisis luctus, metus.</p>
							<p class="call">
								Got Question? Call us 24/7<span><a href="tel:123456789">+216
										55 678 678</a></span>
							</p>
						</div>
						<!-- End Single Widget -->
					</div>
					<div class="col-lg-2 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer links">
							<h4>Information</h4>
							<ul>
								<li><a href="#">About Us</a></li>
								<li><a href="#">Faq</a></li>
								<li><a href="#">Terms & Conditions</a></li>
								<li><a href="#">Contact Us</a></li>
								<li><a href="#">Help</a></li>
							</ul>
						</div>
						<!-- End Single Widget -->
					</div>

					<div class="col-lg-3 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer social">
							<h4>Get In Tuch</h4>
							<!-- Single Widget -->
							<div class="contact">
								<ul>
									<li>mourouj 6.</li>
									<li>216 tunisia.</li>
									<li>info@eshop.com</li>
									<li>+216 55 678 678</li>
								</ul>
							</div>
							<!-- End Single Widget -->
							<ul>
								<li><a href="#"><i class="ti-facebook"></i></a></li>
								<li><a href="#"><i class="ti-twitter"></i></a></li>
								<li><a href="#"><i class="ti-flickr"></i></a></li>
								<li><a href="#"><i class="ti-instagram"></i></a></li>
							</ul>
						</div>
						<!-- End Single Widget -->
					</div>
				</div>
			</div>
		</div>
		<!-- End Footer Top -->
		<div class="copyright">
			<div class="container">
				<div class="inner">
					<div class="row">
						<div class="col-lg-6 col-12">
							<div class="left">
								<p>
									Copyright © 2020 <a href="http://www.wpthemesgrid.com"
										target="_blank">Wpthemesgrid</a> - All Rights Reserved.
								</p>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- /End Footer Area -->



	<!-- Jquery -->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.0.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<!-- Popper JS -->
	<script src="js/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Color JS -->
	<script src="js/colors.js"></script>
	<!-- Slicknav JS -->
	<script src="js/slicknav.min.js"></script>
	<!-- Owl Carousel JS -->
	<script src="js/owl-carousel.js"></script>
	<!-- Magnific Popup JS -->
	<script src="js/magnific-popup.js"></script>
	<!-- Fancybox JS -->
	<script src="js/facnybox.min.js"></script>
	<!-- Waypoints JS -->
	<script src="js/waypoints.min.js"></script>
	<!-- Jquery Counterup JS -->
	<script src="js/jquery-counterup.min.js"></script>
	<!-- Countdown JS -->
	<script src="js/finalcountdown.min.js"></script>
	<!-- Nice Select JS -->
	<script src="js/nicesellect.js"></script>
	<!-- Ytplayer JS -->
	<script src="js/ytplayer.min.js"></script>
	<!-- Flex Slider JS -->
	<script src="js/flex-slider.js"></script>
	<!-- ScrollUp JS -->
	<script src="js/scrollup.js"></script>
	<!-- Onepage Nav JS -->
	<script src="js/onepage-nav.min.js"></script>
	<!-- Easing JS -->
	<script src="js/easing.js"></script>
	<!-- Google Map JS -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnhgNBg6jrSuqhTeKKEFDWI0_5fZLx0vM"></script>
	<script src="js/gmap.min.js"></script>
	<script src="js/map-script.js"></script>
	<!-- Active JS -->
	<script src="js/active.js"></script>
</body>
</html>

