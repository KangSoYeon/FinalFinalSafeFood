<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SAFE FOOD</title>
<style type="text/css">
.errormsg {
	font-size: 14px;
	color: red;
}
</style>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/member.css" rel="stylesheet">
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


	<%-- <jsp:include page="modal.jsp"></jsp:include> --%>
	<!-- 내용 들어가는곳  -->
	<section class="bg-white page-section" id="portfolio">
		<div class="container box">
			<c:choose>
				<c:when test="${ empty id }">
					<c:if test="${not empty cookie.id}">
						<c:set var="idSave" value="value='${cookie.id.value}'" />
						<c:set var="checked" value="checked='checked'" />
					</c:if>
					<h2>로그인</h2>
					<form method="post" action="login.do">
						<table style="width: 100%">
							<c:if test="${ not empty msg }">
								<tr>
									<td colspan='2' class="errorMsg" style="color: red">${msg}</td>
								</tr>
							</c:if>
							<c:if test="${not empty referer}">
								<input type="hidden" name="referer" value='${referer}' />
							</c:if>
							<tr>
								<td><input class="form-control mr-sm-2" type="text" placeholder="ID"
									${idSave} id="id" name="id"></td>
							</tr>
							<tr>
								<td><input class="form-control mr-sm-2" type="password"
									placeholder="password" id="password" name="pw"></td>
							</tr>
							<tr>
								<td colspan="2">
								<input type="checkbox" name='idsave' value='t' ${checked}> 아이디 저장
								<input type="button" class="fas fa-times btn btn-primary"
									onclick="location.href='findpasswordForm.do'" id="forget"
									value="비밀번호 찾기" >
								</td>
								
							</tr>
							<tr>
								<td>
								<input type="submit" value="로그인"
									class="fas fa-times btn btn-primary">
								
								</td>
							</tr>
						</table>
					</form>
				</c:when>
			</c:choose>
		</div>
	</section>
	<!--  -->

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
