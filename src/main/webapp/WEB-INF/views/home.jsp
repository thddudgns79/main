<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board" />

<!DOCTYPE html>
<html>
<head>
<title>Song Young HighSchool</title>
<meta charset="utf-8">
<link rel="icon" type="image/png" href="<c:url value='/img/favicon.png'/>">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value='/login/css/style.css'/>">

</head>
<body class="img js-fullheight" style="background-image: url('./img/login.png');">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center">
					<img src="<c:url value='/img/songyoung.png'/>" width="40%">
				</div>
			</div>
			<div class="row justify-content-center mt-4">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
						<form action="<c:url value='/attend'/>" method="post" class="signin-form">
							<div class="form-group">
								<input type="text" class="form-control" name="stdId" placeholder="Username" required>
							</div>
							<div class="form-group">
								<input id="password-field" type="password" class="form-control" placeholder="Password" name="password" required> 
									<span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password" ></span>
									<small style="color:red;">${message}</small>
							</div>
							<div class="form-group">
								<button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
							</div>

							<div class="form-group d-md-flex">
								<div class="w-50">
									<label class="checkbox-wrap checkbox-primary">Remember Me <input type="checkbox" checked> 
									<span class="checkmark"></span>
									</label>
								</div>
								<div class="w-50 text-md-right">
									<a href="#" style="color: #fff">Forgot Password</a>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="<c:url value='/login/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/login/js/popper.js'/>"></script>
	<script src="<c:url value='/login/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/login/js/main.js'/>"></script>

</body>

</html>