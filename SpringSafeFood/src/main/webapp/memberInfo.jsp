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

	<!-- 본문 내용 -->
	<section class="bg-white page-section" id="portfolio">
		<div class="container box">
			<h2>회원 정보</h2>
			<form method="post" name='frm'>
				<div class="register-form">
					<table id='mem_rtable'>
						<tr>
							<td>아이디</td>
							<td><input type="text" readonly="readonly" name="id"
								id="mem_id" value='${member.id}'></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="password" id="mem_password"
								value="${member.password}"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" readonly="readonly" name="name"
								id="mem_name" value="${member.name}"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" id="mem_email"
								value="${member.email }"></td>
						</tr>
						<tr>
							<td>성별</td>
							<td><c:choose>
									<c:when test="${member.gender eq 1 }">
										<c:set var='man' value='checked="checked"'/>
									</c:when>
									<c:otherwise>
										<c:set var='women' value='checked="checked"'/>
									</c:otherwise>
								</c:choose>
								<input type="radio" id="mem_gender" name="gender" value="1" ${man}/>남자
								<input type="radio" id="mem_gender" name="gender" value="2" ${women}/>여자</td>
						</tr>
						<tr>
							<td>체중</td>
							<td><input type="text" name="weight" id="mem_weight"
								value="${member.weight }"></td>
						</tr>

						<tr>
							<td>알레르기</td>
							<td>
								<fieldset>
									<legend>Check</legend>
									<c:if test="${member.du eq 1}">
										<c:set var='du' value='checked="checked"' />
									</c:if>
									<div>
										대두 <input type="checkbox"  id="allergy"
											name="du" value="1" ${du} />
										<c:if test="${member.cong eq 1}">
											<c:set var='cong' value='checked="checked"'></c:set>
										</c:if>
										땅콩 <input type="checkbox"  id="allergy"
											name="cong" value="1" ${cong} />
										<c:if test="${member.milk eq 1}">
											<c:set var='milk' value='checked="checked"'></c:set>
										</c:if>
										우유 <input type="checkbox"  id="allergy"
											name="milk" value="1" ${milk} />
										<c:if test="${member.crab eq 1}">
											<c:set var='crab' value='checked="checked"'></c:set>
										</c:if>
										게 <input type="checkbox"  id="allergy"
											name="crab" value="1" ${crab} />
									</div>
									<div>
										<c:if test="${member.shi eq 1}">
											<c:set var='shi' value='checked="checked"'></c:set>
										</c:if>
										새우 <input type="checkbox"  id="allergy"
											name="shi" value="1" ${shi} />
										<c:if test="${member.tu eq 1}">
											<c:set var='tu' value='checked="checked"'></c:set>
										</c:if>
										참치 <input type="checkbox"  id="allergy"
											name="tu" value="1" ${tu} />
										<c:if test="${member.sal eq 1}">
											<c:set var='sal' value='checked="checked"'></c:set>
										</c:if>
										연어 <input type="checkbox"  id="allergy"
											name="sal" value="1" ${sal} />
										<c:if test="${member.suk eq 1}">
											<c:set var='suk' value='checked="checked"'></c:set>
										</c:if>
										쑥 <input type="checkbox"  id="allergy"
											name="suk" value="1" ${suk} />
									</div>
									<div>
										<c:if test="${member.cow eq 1}">
											<c:set var='cow' value='checked="checked"'></c:set>
										</c:if>
										소고기 <input type="checkbox"  id="allergy"
											name="cow" value="1" ${cow} />
										<c:if test="${member.chi eq 1}">
											<c:set var='chi' value='checked="checked"'></c:set>
										</c:if>
										닭고기 <input type="checkbox"  id="allergy"
											name="chi" value="1" ${chi} />
										<c:if test="${member.pig eq 1}">
											<c:set var='pig' value='checked="checked"'></c:set>
										</c:if>
										돼지고기 <input type="checkbox"  id="allergy"
											name="pig" value="1" ${pig} />
									</div>
									<div>
										<c:if test="${member.peach eq 1}">
											<c:set var='peach' value='checked="checked"'></c:set>
										</c:if>
										복숭아 <input type="checkbox"  id="allergy"
											name="peach" value="1" ${peach} />
										<c:if test="${member.mind eq 1}">
											<c:set var='mind' value='checked="checked"'></c:set>
										</c:if>
										민들레 <input type="checkbox"  id="allergy"
											name="mind" value="1" ${mind} />
										<c:if test="${member.egg eq 1}">
											<c:set var='egg' value='checked="checked"' />
										</c:if>
										계란흰자 <input type="checkbox"  id="allergy"
											name="egg" value="1" ${egg} />
									</div>
								</fieldset>
							</td>
						</tr>
					</table>
				</div>
				<div style="text-align: center">
					<input type="submit" id="mem_update" value="수정"
						onclick="javascript: form.action='update.do';"> <input
						type="submit" id="mem_delete" value="회원탈퇴"
						onclick="javascript: form.action='delete.do';">
				</div>
			</form>
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

	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>

</body>

</html>
