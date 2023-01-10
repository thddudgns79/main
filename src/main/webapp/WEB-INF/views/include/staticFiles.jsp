<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/header" />

<!-- BootStrap5.1 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

 <!--   Core JS Files   -->
 <script src="<c:url value='/js/core/jquery.min.js'/>"></script>
 <script src="<c:url value='/js/core/popper.min.js'/>"></script>
 <script src="<c:url value='/js/core/bootstrap.min.js'/>"></script>
 <script src="<c:url value='/js/plugins/perfect-scrollbar.jquery.min.js'/>"></script>
 
 <!--  Google Maps Plugin    -->
 <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
 
 <!-- Chart JS -->
 <script src="<c:url value='/js/plugins/chartjs.min.js'/>"></script>
 
 <!--  Notifications Plugin    -->
 <script src="<c:url value='/js/plugins/bootstrap-notify.js'/>"></script>
 
 <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
 <script src="<c:url value='/js/now-ui-dashboard.min.js?v=1.5.0' />" ></script>
 <script src="<c:url value='/demo/demo.js'/>"></script>
 <script>
   $(document).ready(function() {
     // Javascript method's body can be found in assets/js/demos.js
     demo.initDashboardPageCharts();

   });
 </script>



<!-- <head> -->
<!-- 	<meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
<!-- 	<meta http-equiv="X-UA-Compatible" content="ie=edge" /> -->
	
<!-- 	<title>Dream Pulse TemplateMo</title> -->
<!-- 	<!--DREAM PULSE https://templatemo.com/tm-536-dream-pulse--> -->
<!-- 	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" /> -->
<%-- 	<link rel="stylesheet" href="<c:url value='/css/all.min.css'/>"> --%>
<%-- 	<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>"> --%>
<%-- 	<link rel="stylesheet" href="<c:url value='/slick/slick.css'/>"> --%>
<%-- 	<link rel="stylesheet" href="<c:url value='/slick/slick-theme.css'/>"> --%>
<%-- 	<link rel="stylesheet" href="<c:url value='/css/magnific-popup.css'/>"> --%>
<%-- 	<link rel="stylesheet" href="<c:url value='/css/templatemo-dream-pulse.css'/>"> --%>
<!-- 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"> -->
<!-- </head> -->