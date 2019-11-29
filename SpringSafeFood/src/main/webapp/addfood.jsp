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
<body id="addfood">
	<jsp:include page="nav.jsp" />
	<jsp:include page="shortTop.jsp"/>

	<!-- 본문 내용 -->
	<section class="bg-white page-section" id="portfolio">
		<div class="container box">
			<h2>상품 추가</h2>
			<form method="post" action="addfood.do" enctype="multipart/form-data">
				<div class="register-form">
					<table id='rtable'>
						<c:if test="${ not empty msg }">
							<tr>
								<td colspan='2' class="errorMsg" style="color: red">${msg}</td>
							</tr>
						</c:if>
						<tr>
							<td>상품코드</td>
							<td><input readonly="readonly" class="form-control mr-sm-2" type="text" name="code" id="add_code" placeholder="${code}" value="${code}"></td>
						</tr>
						<tr>
							<td>상품명</td>
							<td><input class="form-control mr-sm-2" type="text" name="name" id="add_name" placeholder="상품명"></td>
						</tr>
						<tr>
							<td>일일 제공량</td>
							<td><input class="form-control mr-sm-2" type="text" name="supportpereat" id="add_supportpereat" placeholder="소수점 2째짜리까지 입력하세요."></td>
						</tr>
						<tr>
							<td>칼로리</td>
							<td><input class="form-control mr-sm-2" type="text" name="calory" id="add_calory" placeholder="소수점 2째짜리까지 입력하세요."></td>
						</tr>
						<tr>
							<td>탄수화물</td>
							<td><input class="form-control mr-sm-2" type="text" name="carbo" id="add_carbo" placeholder="소수점 2째짜리까지 입력하세요."></td>
						</tr>
						<tr>
							<td>단백질</td>
							<td><input class="form-control mr-sm-2" type="text" name="protein" id="add_protein" placeholder="소수점 2째짜리까지 입력하세요."></td>
						</tr>
						<tr>
							<td>지방</td>
							<td><input class="form-control mr-sm-2" type="text" name="fat" id="add_fat" placeholder="소수점 2째짜리까지 입력하세요."></td>
						</tr>
						<tr>
							<td>당류</td>
							<td><input class="form-control mr-sm-2" type="text" name="sugar" id="add_sugar" placeholder="소수점 2째짜리까지 입력하세요."></td>
						</tr>
						<tr>
							<td>나트륨</td>
							<td><input class="form-control mr-sm-2" type="text" name="natrium" id="add_natrium" placeholder="소수점 2째짜리까지 입력하세요."></td>
						</tr>
						<tr>
							<td>콜레스테롤</td>
							<td><input class="form-control mr-sm-2" type="text" name="chole" id="add_chole" placeholder="소수점 2째짜리까지 입력하세요."></td>
						</tr>
						<tr>
							<td>포화지방산</td>
							<td><input class="form-control mr-sm-2" type="text" name="fattyacid" id="add_fattyacid" placeholder="소수점 2째짜리까지 입력하세요."></td>
						</tr>
						<tr>
							<td>트랜스지방</td>
							<td><input class="form-control mr-sm-2" type="text" name="transfat" id="add_transfat" placeholder="소수점 2째짜리까지 입력하세요."></td>
						</tr>
						<tr>
							<td>제조사</td>
							<td><input class="form-control mr-sm-2" type="text" name="maker" id="add_maker" placeholder="제조사"></td>
						</tr>
						<tr>
							<td>재료명</td>
							<td><input class="form-control mr-sm-2" type="text" name="material" id="add_material" placeholder="원재료명을 입력하세요. 구분자:','"></td>
						</tr>
						<tr>
							<td>이미지</td>
							<td><input class="form-control mr-sm-2" type="file" name="fileup" id="add_img"></td>
						</tr>
					</table>
				</div>
				<div style="text-align: center">
					<input type="submit" id="add_food" value="상품 추가">
				</div>
			</form>
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

</body>
</html>