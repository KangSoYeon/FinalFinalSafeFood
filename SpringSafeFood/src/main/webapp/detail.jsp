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

#nutriTb {
	height: 100%;
	width: 100%;
	text-align: center;
}

#nutriTb tr {
	border: 1px solid;
	border-color: #d3d3d3;
}

#foodTb td {
	border: 1px solid;
	border-color: #d3d3d3;
	text-align: center;
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
<script type="text/javascript">
	var bar;
	var opt;
	var total = 0, cal = 0, tan = 0, dan = 0, gi = 0, dang = 0, na = 0, cal2 = 0, po = 0, trans = 0, material=0;
	var options;
	var alergy = ['대두', '땅콩', '우유', '게', '새우', '참치', '연어', '쑥', '소고기', '닭고기', '돼지고기', '복숭아', '민들레', '계란흰자'];
	var alergyString =0;
	$(function() {
		//mydiet에 추가, 추가버튼
		$('#addBt').click(function(event){
			
			var frm = $('#frm');
			if(dangerStr!="") {
				var result = confirm("알레르기 위험도가 있습니다. 그래도 추가하시겠습니까?");
				if(result) {
					event.stopPropagation();
					frm.attr("action","addmydiet.do");
					frm.submit();
				}
				else {
					alert("추가가 취소되었습니다.");
					event.preventDefault();
				}
			}else {
				frm.attr("action","addmydiet.do");
				frm.submit();
			}
			
		})
		
		//cart에 추가 , 찜버튼
		$('#like').click(function(event){
			var frm = $('#frm');
			if(dangerStr!="") {
				var result = confirm("알레르기 위험도가 있습니다. 그래도 찜하시겠습니까?");
				if(result) {
					event.stopPropagation();
					frm.attr("action","addcart.do");
					frm.submit();
				}else {
					alert("찜이 취소되었습니다.");
					event.preventDefault();
				}
			}else {
				frm.attr("action","addcart.do");
				frm.submit();
			}
		})
		
		$('#buy').click(function(){
			location.href="http://www.ssg.com/search.ssg?target=all&query=${food.name}";
		})
		
		$('#del').click(function(){
			var frm = $('#frm');
			frm.attr("action","deletefood.do");
			frm.submit();
		}) 
		
		$.ajax({
			url : 'foodNutritionInfo/' + ${food.code},
			dataType : 'json',
			success : nutritionResult,
			error : function(err) {
				console.log(err);
			}
		})
	})

	function nutritionResult(pdata, status, xhr) {
		var data = pdata.data
		total = data.supportpereat;
		cal = data.calory;
		tan = data.carbo;
		dan = data.protein;
		gi = data.fat;
		dang = data.sugar;
		na = data.natrium;
		cal2 = data.chole;
		po = data.fattyacid;
		trans = data.transfat;
		material = data.material;
		
		//alergy정보 넣기 
		alergyString="";
		dangerStr="";
		var danger = [];
		<c:if test="${not empty al}">
			dangetStr="";
			<c:forEach items="${al}" var="item" varStatus="index">
				danger[${index.count-1}] = ${item};
			</c:forEach>
		</c:if>
		
		for(var i=0; i<alergy.length; i++){
			console.log(material);
			if(material.includes(alergy[i])){
				var tmp = alergy[i];
				alergyString += tmp+" ";
				<c:if test="${not empty al}">
				if(danger[i]==1) {
					dangerStr+= tmp+" ";
				}
				</c:if>
			}
		}
		$('.alergy_list').html(alergyString);
		$('.alergy_den').html(dangerStr);
		options = {
			animationEnabled : true,
			title : {
				text : "영양 정보"
			},
			data : [ {
				type : "doughnut",
				innerRadius : "40%",
				showInLegend : true,
				legendText : "{label}",
				indexLabel : "{label}: #percent%",

				dataPoints : [ 
					{	label : "칼로리",	y : cal	}, 
					{	label : "탄수화물",y : tan }, 
					{	label : "단백질",	y : dan	}, 
					{	label : "지방",	y : gi	}, 
					{	label : "당류",y : dang	}, 
					{	label : "나트륨",	y : na	}, 
					{   label : "콜레스테롤",	y : cal2}, 
					{	label : "포화 지방산",	y : po}, 
					{	label : "트랜스지방",	y : trans} 
					]
			} ]
		};

		$("#chartContainer").CanvasJSChart(options);
		$("#supportpereat").text(total);
		$("#calory").text(cal);
		$("#carbo").text(tan);
		$("#protein").text(dan);
		$("#fat").text(gi);
		$("#sugar").text(dang);
		$("#natrium").text(na);
		$("#chole").text(cal2);
		$("#fattyacid").text(po);
		$("#transfat").text(trans);
				
	}
	
</script>

</head>

<body id="page-top">
	<jsp:include page="nav.jsp" />
	<jsp:include page="shortTop.jsp"/>
	<section class="bg-white page-section" id="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 mx-auto">
					<c:if test="${not empty msg}">
						<script>alert("${msg}")</script>
					</c:if>
					<form id="frm" method="post">
						<input type="hidden" name="Fcode" value="${food.code}"></input>
						<table id="foodTb">
							<tr>
								<h1 align="center">제품 정보</h1>
							</tr>
							<hr/>
							<tr>
								<td rowspan="6"><img src="${food.img}"
									style="width: 300px; height: 400px;" /></td>
								<td style="width: 125px;">
									<h5>제품명</h5>
								</td>
								<td style="width: 55%;">${food.name}</td>
							</tr>
							<tr>
								<td><h5>제조사</h5></td>
								<td>${food.maker}</td>
							</tr>
							<tr>
								<td><h5>원재료</h5></td>
								<td>${food.material}</td>
							</tr>
							<tr>
								<td><h5>
										알레르기<br />성분
									</h5></td>
								<td><ul class="alergy_list" style="margin-bottom: 5px;"></ul></td>
							</tr>
							<c:if test="${not empty id}">
								<tr>
									<td><h5>위험도</h5></td>
									<td><ul class="alergy_den"
											style="margin-bottom: 5px; color: red"></ul></td>
								</tr>
							</c:if>
							<tr>
								<td align="center">수량</td>
								<td><input type="number" min="1" name="cnt" id="cnt"
									value="1"> 
									<c:if test="${not empty id && id!='admin'}">
										<!-- Mydiet, 추가버튼 -->
										<input type="submit" id="addBt" name="addBt"
											class="fas fa-times btn btn-primary" value="추가">
										<!-- Cart, 찜버튼  -->
										<input type="submit" id="like" name="like"
											class="fas fa-times btn btn-primary" value="찜">
										<input type="button" id="buy" name="buy"
											class="fas fa-times btn btn-primary" value="구매">
									</c:if> <c:if test="${not empty id && id=='admin'}">
										<input type="submit" id="del" name="del_info"
											class="fas fa-times btn btn-primary" value="삭제">
										<input type="button" id="modify"
											onclick="location.href='modifyform.do?code=${food.code}'"
											name="modify_info" class="fas fa-times btn btn-primary"
											value="수정">
									</c:if></td>
							</tr>
						</table>
					</form>
					<hr class="my-4">

					<div class="row content" id="sorts">
						<div class="col-lg-8 content_desc">
							<div id="chartContainer" style="height: 400px; margin-top: 30px;"></div>

						</div>
						<div class="col-lg-4 content_desc">
							<table id="nutriTb">
								<thead>
									<tr>
										<th scope="col">영양소</th>
										<th scope="col">영양정보</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>일일제공량</th>
										<td>${food.supportpereat}</td>
									</tr>
									<tr>
										<th>칼로리</th>
										<td>${food.calory}</td>
									</tr>
									<tr>
										<th>탄수화물</th>
										<td>${food.carbo}</td>
									</tr>
									<tr>
										<th>단백질</th>
										<td>${food.protein}</td>
									</tr>
									<tr>
										<th>지방</th>
										<td>${food.fat}</td>
									</tr>
									<tr>
										<th>당류</th>
										<td>${food.sugar}</td>
									</tr>
									<tr>
										<th>나트륨</th>
										<td>${food.natrium}</td>
									</tr>
									<tr>
										<th>콜레스테롤</th>
										<td>${food.chole}</td>
									</tr>
									<tr>
										<th>포화 지방산</th>
										<td>${food.fattyacid}</td>
									</tr>
									<tr>
										<th>트랜스지방</th>
										<td>${food.transfat}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>


				</div>
			</div>
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