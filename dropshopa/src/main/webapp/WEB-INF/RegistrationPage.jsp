<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/style1.css">
<title>Register Page</title>
</head>
<body>
<div class="wrapper">
    <h2>Registration</h2>
    <form:form action="/register" method="post" modelAttribute="newUser">
    <div>
      <form:errors path="*" class="error" style="color:red"/>
        </div>
      <div class="input-box">
      
        <form:input  placeholder="Full name" path="username"/>
      </div>
      <div class="input-box">
        <form:input type="email" placeholder="Email Address"  path="email"/>
      </div>
      <div class="input-box">
        <form:input type="password" placeholder="Password"  path="password"/>
      </div>
      <div class="input-box">
        <form:input type="password" placeholder="Confirm Password" path="confirm"/>
      </div>
      <div class="input-box">
        <form:input  placeholder="Adress"  path="adress"/>
      </div>
      <div class="input-box">
        <form:input  placeholder="Phone Number"  path="phonenumber"/>
      </div>
       <div class="input-box">
			        <form:input  class="form-control" path="image" placeholder="picture link"/>
				         
		          	</div>
			     
     
      <div class="input-box button">
        <input type="Submit" value="Register Now">
      </div>
      </form:form>
      <div class="text">
        <h3>Already have an account? <a href="/">Login now</a></h3>
      </div>
    
  </div>
</body>
</html>