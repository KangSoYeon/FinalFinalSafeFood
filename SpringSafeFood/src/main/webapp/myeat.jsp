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
#chartdiv {
	width: 60%;
	height: 500px;
	display: table-cell;
	vertical-align: middle;
}

.errormsg {
	font-size: 14px;
	color: red;
}

#nutriTb {
	width: 100%;
	height: auto;
	text-align: center;
}
#exercise {
	width: 100%;
	height: auto;
	text-align: center;
}
#exercise th {
	background-color: #FED136;
	color: black;
	line-height: 1.7em;
}
#exercise tr {
	border-bottom: 1px solid;
	border-top: 1px solid;
	border-color: #d3d3d3;
}
#nutriTb tr {
	border-bottom: 1px solid;
	border-top: 1px solid;
	border-color: #d3d3d3;
}


#nutriTb th {
	background-color: #FED136;
	color: black;
	line-height: 1.7em;
}

#chartwrapper {
	width: 100%;
	display: table;
}

#chartinfo {
	display: table-cell;
	/* vertical-align: middle; */
}

#daypart {
	display: table;
}

#daypart * {
	display: table-cell;
}
</style>
<!-- 페이징 처리 위한 CSS -->
<link rel="stylesheet" type="text/css"
	href="https://pagination.js.org/dist/2.1.4/pagination.css">
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
<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<script type="text/javascript">
				//칼로리,탄수화물,단백질,지방,당류,나트륨,콜레스테롤,포화지방산,트랜스지방
	var basic = [${recomend[0]/2},${recomend[1]/2},${recomend[2]/2}
				,${recomend[3]/2},${recomend[4]/2},${recomend[5]/2}
				,${recomend[6]/2},${recomend[7]/2},${recomend[8]/2}];
	var nut = ['칼로리','탄수화물','단백질','지방','당류','나트륨','콜레스테롤','포화 지방산','트랜스지방'];
	var bn = [];
	$(function(){
		
		<c:if test="${not empty e1}">
			<c:forEach items="${e1}" var="item" varStatus="index">
				bn[${index.count-1}] = ${item};
			</c:forEach>
			
			$(".disnutri tr:nth-child(1)").append("<th style='color:red'>일일 권장량 초과</th>");
			for (var i = 0; i < basic.length; i++) {
				var howfar = bn[i+1]/(basic[i]*2);
				if(bn[i+1]>=basic[i]){
					$(".disnutri tr:nth-child("+(i+3)+")").append("<td style='color:red'>"+ Math.round(howfar)+"배 초과 </td>");
				}else {
					$(".disnutri tr:nth-child("+(i+3)+")").append("<td></td>");
				}
			}
		</c:if>			
		
	});
	am4core.ready(function() {

		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end
		
		// Create chart instance
		var chart = am4core.create("chartdiv", am4charts.XYChart3D);
		
		// Add data
		chart.data = [ {
		  "nutri": "칼로리",
		  "myeat": ${e1[1]},
		  "color": chart.colors.next()
		},{
		  "nutri": "탄수화물",
		  "myeat": ${e1[2]},
		  "color": chart.colors.next()
		},{
		  "nutri": "단백질",
		  "myeat": ${e1[3]},
		  "color": chart.colors.next()
		}, {
		  "nutri": "지방",
		  "myeat": ${e1[4]},
		  "color": chart.colors.next()
		},{
		  "nutri": "당류",
		  "myeat": ${e1[5]},
		  "color": chart.colors.next()
		},{
		  "nutri": "나트륨",
		  "myeat": ${e1[6]},
		  "color": chart.colors.next()
		}, {
		  "nutri": "콜레스테롤",
		  "myeat": ${e1[7]},
		  "color": chart.colors.next()
		},{
		  "nutri": "포화 지방산",
		  "myeat": ${e1[8]},
		  "color": chart.colors.next()
		},{
		  "nutri": "트랜스지방",
		  "myeat": ${e1[9]},
		  "color": chart.colors.next()
		} ];
		
		// Create axes
		var categoryAxis = chart.yAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "nutri";
		categoryAxis.numberFormatter.numberFormat = "#";
		categoryAxis.renderer.inversed = true;
		
		var  valueAxis = chart.xAxes.push(new am4charts.ValueAxis());
		
		// Create series
		var series = chart.series.push(new am4charts.ColumnSeries3D());
		series.dataFields.valueX = "myeat";
		series.dataFields.categoryY = "nutri";
		series.name = "myeat";
		series.columns.template.propertyFields.fill = "color";
		series.columns.template.tooltipText = "{valueX}";
		series.columns.template.column3D.stroke = am4core.color("#fff");
		series.columns.template.column3D.strokeOpacity = 0.2;

		}); // end am4core.ready()
		
		
	function deletediet(dno) {
		var pageNo = document.getElementById('pageNumber');
		console.log(Number(pageNo.value));
		pageNo = Number(pageNo.value);
		window.location.href="deletediet.do?dno="+dno+"&pageNumber="+pageNo+"&day="+${day};
	}
		
	function pagelist(cpage) {
		var pageNo = document.getElementById('pageNumber');
		pageNo.value = cpage;
		cpage = Number(cpage);
		window.location.href="myeat.do?pageNumber="+cpage+"&day="+${day};
	}
</script>

</head>

<body id="page-top">
	<jsp:include page="nav.jsp" />
	<jsp:include page="shortTop.jsp" />
	<section class="bg-white page-section" id="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 mx-auto">
					<c:if test="${not empty msg}">
						<script>alert("${msg }")</script>
						<script>location.href="myeat.do?pageNumber=${pageNumber}&day=${day}" </script>
					</c:if>
					<h1 style="text-align: center;">내 섭취 정보</h1>
					<hr>
					<div id="daypart">
						<div id="all">
							<span style="color: #fec503">※&nbsp;</span><a
								href="myeat.do?pageNumber=1&day=0">전체 내역 &nbsp;</a>
						</div>
						<br />
						<div id="week">
							<span style="color: #fec503">★&nbsp;</span><a
								href="myeat.do?pageNumber=1&day=1">이번주 &nbsp;</a>
						</div>
						<div id="month">
							<span style="color: #fec503">♥&nbsp;</span><a
								href="myeat.do?pageNumber=1&day=2">이번달 &nbsp;</a>
						</div>
						<div id="year">
							<span style="color: #fec503">♣&nbsp;</span><a
								href="myeat.do?pageNumber=1&day=3">올해 &nbsp;</a>
						</div>
						<br />
					</div>
					<hr>
					<div id="chartwrapper">
						<div id="chartdiv"></div>
						<div id="chartinfo">
							<table id="nutriTb" class="disnutri">
								<tbody>
									<tr>
										<th>분류</th>
										<th>수치</th>
									</tr>
									<tr>
										<td>총 용량</td>
										<td>${e1[0]}</td>
									</tr>
									<tr>
										<td>칼로리</td>
										<td>${e1[1]}</td>
									</tr>
									<tr>
										<td>탄수화물</td>
										<td>${e1[2]}</td>
									</tr>
									<tr>
										<td>단백질</td>
										<td>${e1[3]}</td>
									</tr>
									<tr>
										<td>지방</td>
										<td>${e1[4]}</td>
									</tr>
									<tr>
										<td>당류</td>
										<td>${e1[5]}</td>
									</tr>
									<tr>
										<td>나트륨</td>
										<td>${e1[6]}</td>
									</tr>
									<tr>
										<td>콜레스테롤</td>
										<td>${e1[7]}</td>
									</tr>
									<tr>
										<td>포화 지방산</td>
										<td>${e1[8]}</td>
									</tr>
									<tr>
										<td>트랜스지방</td>
										<td>${e1[9]}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div id="recomend">
						<br />
						<h3 style="text-align: center;">영양소별 권장 섭취량</h3>
						<hr>
						<table class="table" id="exercise">
								<tr class="table-warning">
									<th>성별</th>
									<th>칼로리</th>
									<th>탄수화물</th>
									<th>단백질</th>
									<th>지방</th>
									<th>당류</th>
									<th>나트륨</th>
									<th>콜레스테롤</th>
									<th>포화지방산</th>
									<th>트랜스지방</th>
								</tr>
								<tr>
									<c:choose>
										<c:when test="${member.gender eq 1}">
											<td>남성</td>
										</c:when>
										<c:otherwise>
											<td>여성</td>
										</c:otherwise>
									</c:choose>
									<td>${recomend[0]}</td>
									<td>${recomend[1]}</td>
									<td>${recomend[2]}</td>
									<td>${recomend[3]}</td>
									<td>${recomend[4]}</td>
									<td>${recomend[5]}</td>
									<td>${recomend[6]}</td>
									<td>${recomend[7]}</td>
									<td>${recomend[8]}</td>
								</tr>
						</table>
					</div>
					<div>
						<table id="nutriTb">
							<tr>
								<br />
								<h1 style="text-align: center;">섭취 내역</h1>
								<hr>
							</tr>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">상품명</th>
									<th scope="col">수량</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ n2}" var="myeat" varStatus="cnt">
									<tr>
										<td>${cnt.count }</td>
										<td>${myeat[0]}</td>
										<td>${myeat[1]}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<div>
						<table id="nutriTb">
							<tr>
								<br />
								<h1 style="text-align: center;">섭취 목록</h1>
								<hr>
							</tr>
							<thead>
								<tr>
									<th scope="col">날짜</th>
									<th scope="col">상품명 <input type="hidden" id="pageNumber"
										name="pageNumber" /></th>
									<th scope="col">수량</th>
									<th scope="col">삭제</th>

								</tr>
							</thead>
							<tbody>

								<c:forEach items="${n3}" var="mydiet">
									<tr>
										<td>${mydiet.getRegdate() }</td>
										<td>${mydiet.getFood().getName()}</td>
										<td>${mydiet.getAmount()}</td>
										<td><button id="delete_cart"
												onclick="deletediet(${mydiet.getDno()})">삭제</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div id="pagination-container">${bean.pageLink}</div>
					<div id="exercise">
						<br />
						<h1 style="text-align: center;">섭취 칼로리 계산기</h1>
						<span style="color:blue">현재 몸무게 : &nbsp;${member.weight}</span>
						<hr>
						<table id="exercise">
								<tr>
									<th>해당범위</th>
									<th>달리기</th>
									<th>계단오르기</th>
									<th>자전거</th>
									<th>배드민턴</th>
									<th>빨리 걷기</th>
								</tr>
								<tr>
									<c:choose>
										<c:when test="${mw eq 0}"><td>65kg미만</td></c:when>
										<c:when test="${mw eq 1}"><td>65~75kg</td></c:when>
										<c:when test="${mw eq 2}"><td>75~85kg</td></c:when>
										<c:otherwise><td>85kg이상</td></c:otherwise>
									</c:choose>
									<td>${exer[0]}분</td>
									<td>${exer[1]}분</td>
									<td>${exer[2]}분</td>
									<td>${exer[3]}분</td>
									<td>${exer[4]}분</td>
								</tr>
						</table>
					</div><!-- 운동 끝 -->
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

</body>
</html>