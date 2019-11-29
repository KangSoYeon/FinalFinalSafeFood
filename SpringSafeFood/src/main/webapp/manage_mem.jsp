<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
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
<body id="manage">
	<jsp:include page="nav.jsp" />
	<jsp:include page="shortTop.jsp"/>

	<!-- 본문 내용 -->
	<section class="bg-white page-section" id="portfolio">
		<div class="container manage">
			<h1 align="center">회원 관리 목록</h1><hr>
			<table id="mem_rtable" style="width: 100%">
				<tr>
					<td>아이디</td>
					<td>이름</td>
					<td>이메일</td>
					<td>주소</td>
					<td>전화번호</td>
					<td>삭제</td>
				</tr>
				<c:forEach items="${list}" var="info" varStatus="index">
					<tr>
						<td >${info.id} </td>
						<td>${info.name}</td>
						<td>${info.email}</td>
						<td>${info.gender}</td>
						<td>${info.weight}</td>
						<td><button class="manage_btn" id="manage_del" onclick="location.href='delmem.do?id=${info.id}'">삭제</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>
	<!-- -->

	<!-- Footer -->
	<jsp:include page="copyright.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>


	<!-- Custom scripts for this template -->
	<script src="js/agency.min.js"></script>
</body>
</html>