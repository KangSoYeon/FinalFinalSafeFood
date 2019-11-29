<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/login.css" rel="stylesheet">
<title>비밀 번호 찾기</title>
<style type="text/css">
.errormsg {
	font-size: 14px;
	color: red;
}
</style>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="css/agency.min.css" rel="stylesheet">
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>
</head>
<body id="page-top">
	<jsp:include page="nav.jsp" />
	<jsp:include page="shortTop.jsp"/>
	
	<section class="bg-white page-section" id="portfolio" style="height: 462px;">
	<div class="box container">
		<c:choose>
			<c:when test="${not empty findpw}">
				<div class="login-form">
					<h2>아이디 : ${findpw.getId()}에 해당하는 비밀번호입니다.</h2>
					<br /> <input type="text" name="id" id="username"
						readonly="readonly" value='${findpw.getPassword()}'>
						<input type="button" id="submit" onclick="location.href='index.do'" value="돌아가기">
				</div>
				
			</c:when>
			<c:otherwise>
				<form method="post" action="findpassword.do">
					<c:if test="${ not empty msg }">
						<div>
							<p class="errorMsg">${msg}</p>
						</div>
					</c:if>
					<!-- Login -->
					<div class="login-form">
						<h2>비밀번호를 찾을 아이디를 입력해 주세요</h2>
						<br /> <input type="text" name="id" id="username" placeholder="ID">
					</div>
					<!-- Submit -->
					<input type="button" id="submit" onclick="location.href='index.do'" value="돌아가기">
					<input type="submit" id="submit" value="찾기" /> 
				</form>
			</c:otherwise>
		</c:choose>
	</div>
	</section>
	<!-- Footer -->
	<jsp:include page="copyright.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>


	<!-- Custom scripts for this template -->
	<script src="js/agency.min.js"></script>

	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
</body>
</html>