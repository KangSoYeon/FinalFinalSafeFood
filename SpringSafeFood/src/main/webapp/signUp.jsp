<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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


	<!-- 본문 내용 -->
	<section class="bg-white page-section" id="portfolio">
		<div class="container box">
			<h2>회원가입</h2>
			<form method="post" action="sign.do">
				<div class="register-form">
					<table id='rtable'>
						<c:if test="${ not empty msg }">
							<tr>
								<td colspan='2' class="errorMsg" style="color: red">${msg}</td>
							</tr>
						</c:if>
						<tr>
							<td>아이디</td>
							<td><input class="form-control mr-sm-2" type="text" name="id" id="regi_id" placeholder="ID"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input class="form-control mr-sm-2" type="password" name="password" id="regi_password" placeholder="Password"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input class="form-control mr-sm-2" type="text" name="name" id="regi_name" placeholder="이름"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input class="form-control mr-sm-2" type="text" name="email" id="regi_email" placeholder="Email"></td>
						</tr>
						<tr>
							<td>성별</td>
							<td><input  id="mem_gender" type="radio" name="gender" value="1" />남자
								<input  id="mem_gender" type="radio" name="gender" value="2" />여자</td>
						</tr>
						<tr>
							<td>체중</td>
							<td><input class="form-control mr-sm-2" type="text" name="weight" id="regi_weight" placeholder="체중 kg을 제외한 숫자만 입력하세요."></td>
						</tr>

						<tr>
							<td>알레르기</td>
							<td>
								<fieldset>
									<legend>Check</legend>
									<div>
										대두 <input type="checkbox" id="allergy" name="du"
											value="1" /> 땅콩 <input type="checkbox" 
											id="allergy" name="cong" value="1" /> 우유 <input
											type="checkbox"  id="allergy" name="milk"
											value="1" /> 게 <input type="checkbox" 
											id="allergy" name="crab" value="1" />
									</div>
									<div>
										새우 <input type="checkbox" id="allergy" name="shi"
											value="1" /> 참치 <input type="checkbox" 
											id="allergy" name="tu" value="1" /> 연어 <input
											type="checkbox"  id="allergy" name="sal"
											value="1" /> 쑥 <input type="checkbox" 
											id="allergy" name="suk" value="1" />
									</div>
									<div>
										소고기 <input type="checkbox"  id="allergy"
											name="cow" value="1" /> 닭고기 <input type="checkbox"
											 id="allergy" name="chi" value="1" /> 돼지고기 <input
											type="checkbox"  id="allergy" name="pig"
											value="1" />
									</div>
									<div>
										복숭아 <input type="checkbox"  id="allergy"
											name="peach" value="1" /> 민들레 <input type="checkbox"
											 id="allergy" name="mind" value="1" /> 계란흰자 <input
											type="checkbox"  id="allergy" name="egg"
											value="1" />
									</div>
								</fieldset>
							</td>
						</tr>
					</table>
				</div>
				<div style="text-align: center">
					<input type="submit" id="register_sub" value="회원가입">
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

