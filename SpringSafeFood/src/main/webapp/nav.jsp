<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>SAFE FOOD</title>

</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="index.do">Balance</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase">
					<!-- ml-auto -->
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="notice.do">공지 사항</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="index.do#portfolio">상품 정보</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="best.do">베스트 섭취 정보</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="qna.do">Q&A 게시판</a></li>
				<c:choose>
					<c:when test="${not empty id && id!='admin'}">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="myeat.do?pageNumber=1&day=0" id='myfunction1'>내 섭취 정보</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="expect.do?pageNumber=1&day=0" id='myfunction2'>예상 섭취 정보</a></li>
					</c:when>
					<c:when test="${not empty id && id=='admin'}">
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="addfoodform.do" id='addfood'>상품 추가</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="adminmem.do" id='admin_mem'>회원 관리</a></li>
					</c:when>
				</c:choose>
				</ul>
				<ul class="navbar-nav text-uppercase ml-auto">
					<c:choose>
						<c:when test="${ empty id }">
							<c:if test="${not empty cookie.id}">
								<c:set var="idSave" value="value='${cookie.id.value}'" />
								<c:set var="checked" value="checked='checked'" />
							</c:if>
							<li class="nav-item member" id="login_li"><a
								class="nav-link js-scroll-trigger" href="loginform.do#portfolio"
								id="login">log-in</a></li>
							<li class="nav-item member"><a
								class="nav-link js-scroll-trigger" href="signUpform.do#portfolio" id="signup">sign-up</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item member" id="login_li"><a
								class="nav-link js-scroll-trigger" href="logout.do" id="logout">log-out</a></li>
							<li class="nav-item member" id="meminfo_li"><a
								class="nav-link js-scroll-trigger" href="meminfo.do#portfolio"
								id="meminfo">mem-info</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div></div>
		</div>
	</nav>
</body>
</html>