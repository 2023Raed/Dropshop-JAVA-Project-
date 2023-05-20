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
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" type="text/css" href="/css/footer.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Style -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" type="text/css" href="/css/admindashboard.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

<title>Website Menu #4</title>
</head>
<body>
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
												<a href="index.html"><img src="images/logo.png"
													alt="logo"
													style="width: 50px; height: 50px; margin-right: 150px"></a>
											</div>
											<!--/ End Logo -->
											<ul class="nav main-menu menu navbar-nav">
													<li class="active"><a href="/welcome">Home</a></li>												
													<li><a href="/delivery/new">need a delivery ?</a></li>
													<li><a href="#">Category<i class="ti-angle-down"></i><span class="new">New</span></a>
														<ul class="dropdown" >
														<c:forEach items="${category}" var="category">
														<li><a href="http://localhost:8080/productbycat/${category.id}">${category.nametype}</a></li>
														</c:forEach>
															
															
														</ul>
													</li>
													<li><a href="/user/${user_id}">Profile</a></li>									
													
													
													
													<li><a href="/seller">ADD product</a></li>
													<li id="bb"><a href="/logout"><button type="button" class="btn btn-light"> Log Out</button></a><li/>
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




			

	
	<!-- ================ Order Details List ================= -->
	<div class="details">
		<div class="recentOrders">
			<div class="cardHeader">
				<h2>Delivery information</h2>
				
			</div>

			<table>
				<thead>
					<tr>
						<td>User Name</td>
						<td>Product Description</td>
						<td>Departure address</td>
						<td>Final address</td>
						<td>Action</td>
					</tr>
				</thead>

				<tbody>
				<c:forEach var="delivery" items="${deliverys}">
					<tr>
						
   	            <td>${delivery.user.getUsername()}</td>
						<td>${ delivery.productdescription}</td>
						<td>${delivery.adressedepart }</td>
                 		<td>${delivery.adressefinale }</td>
						<td><button type="button" class="btn btn-success">Accept</button>
							<button type="button" class="btn btn-danger">Delay</button></td>
						<td><p></p></td>
					</tr>
          </c:forEach>
				</tbody>
				
			</table>
		</div>

		<!-- ================= New Customers ================ -->
		<div class="recentCustomers">
			<div class="cardHeader">
				<h2>Users in the site</h2>
			</div>

			<table>

				<c:forEach var="user" items="${users}">
					<tr>

						<td><c:out value="${user.getUsername()}" /> </td>

						<%--  <td> <div class="imgBx"><c:out<img src=" ${user.getImage()}" alt="" />> </c:out></div> </td> --%>
						<td>
							<div class="imgBx">
								<img src="${user.getImage()}" alt="User Image"
									 />
							</div>
							<div>
								
								
										<br> <span><button type="button"
												class="btn btn-success">
												<a href="/user/${user.id}" class="btn btn-success">view</a>
											</button></span><span><form action="/user/${user.id}" method="post"
												style="display: inline;">
												<input type="hidden" name="_method" value="delete">
												<input type="submit" value="Delete" class="btn btn-danger">
											</form></span>
									
								
							</div>
						</td>



					</tr>
				</c:forEach>


			</table>
		</div>
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
								<a href="index.html"><img src="images/logo.png" alt="#"></a>
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
						<div class="col-lg-6 col-12">
							<div class="right">
								<img src="images/payments.png" alt="#">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
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