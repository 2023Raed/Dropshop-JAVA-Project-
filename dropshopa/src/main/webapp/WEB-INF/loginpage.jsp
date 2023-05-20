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
<link rel="stylesheet" type="text/css" href="/css/login.css">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
    <header>Login Form</header>
    <form:form action="/" method="post" modelAttribute="newLogin">
      <div class="field email">
        <div class="input-area">
          <form:input path="email" type="text" placeholder="Email Address"/>
          <i class="icon fas fa-envelope"></i>
          <i class="error error-icon fas fa-exclamation-circle"></i>
        </div>
        <div class="error error-txt">Email can't be blank</div>
      </div>
      <div class="field password">
        <div class="input-area">
          <form:input path="password" type="password" placeholder="Password"/>
          <i class="icon fas fa-lock"></i>
          <i class="error error-icon fas fa-exclamation-circle"></i>
        </div>
        <div class="error error-txt">Password can't be blank</div>
      </div>
      <div class="pass-txt"><a href="#">Forgot password?</a></div>
      <input type="submit" value="Login">
    </form:form>
    <div class="sign-txt">Not yet member? <a href="/register">Signup now</a></div>
  </div>
  <script src="script.js"></script>
</body>
</html>