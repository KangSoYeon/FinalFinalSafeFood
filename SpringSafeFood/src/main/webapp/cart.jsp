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

#nutriTb tr {
	border-bottom: 1px solid;
	border-top: 1px solid;
	border-color: #d3d3d3;
}

#nutriTb th {
	background-color:#FED136; 
	color:black; 
	line-height:1.7em; 
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
<link rel="stylesheet" type="text/css" href="https://pagination.js.org/dist/2.1.4/pagination.css">
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

	am4core.ready(function() {

		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end
		
		// Create chart instance
		var chart = am4core.create("chartdiv", am4charts.XYChart);
		
		// Add data
		chart.data = [ {
		  "nutri": "칼로리",
		  "expect": ${n1[1]},
		  "myeat": ${e1[1]}
		  
		},{
		  "nutri": "탄수화물",
		  "expect": ${n1[2]},
		  "myeat": ${e1[2]}
			  
		},{
		  "nutri": "단백질",
		  "expect": ${n1[3]},
		  "myeat": ${e1[3]}
			  
		}, {
		  "nutri": "지방",
		  "expect": ${n1[4]},
		  "myeat": ${e1[4]}
		  
		},{
		  "nutri": "당류",
		  "expect": ${n1[5]},
		  "myeat": ${e1[5]}
			  
		},{
		  "nutri": "나트륨",
		  "expect": ${n1[6]},
		  "myeat": ${e1[6]}
			  
		}, {
		  "nutri": "콜레..",
		  "expect": ${n1[7]},
		  "myeat": ${e1[7]}
		  
		},{
		  "nutri": "포화..",
		  "expect": ${n1[8]},
		  "myeat": ${e1[8]}
			  
		},{
		  "nutri": "트랜스..",
		  "expect": ${n1[9]},
		  "myeat": ${e1[9]}
			  
		} ];
		
		// Create axes
		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "nutri";
		categoryAxis.renderer.grid.template.location = 0;
		categoryAxis.renderer.minGridDistance = 55;
		categoryAxis.renderer.cellStartLocation = 0.1;
		categoryAxis.renderer.cellEndLocation = 0.9;
		
		var  valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.min = 0;
		
		// Create series
		function createSeries(field, name, stacked) {
		  var series = chart.series.push(new am4charts.ColumnSeries());
		  series.dataFields.valueY = field;
		  series.dataFields.categoryX = "nutri";
		  series.name = name;
		  series.columns.template.tooltipText = "{name}: [bold]{valueY}[/]";
		  series.stacked = stacked;
		  series.columns.template.width = am4core.percent(40);
		}
		
		createSeries("myeat", "섭취 정보", false);
		createSeries("expect", "예상 섭취 정보", true);
		
		// Add legend
		chart.legend = new am4charts.Legend();
		
	}); // end am4core.ready()
	function deletecart(cno) {
		var pageNo = document.getElementById('pageNumber');
		console.log(Number(pageNo.value));
		pageNo = Number(pageNo.value);
		window.location.href="deletecart.do?cno="+cno+"&pageNumber="+pageNo+"&day="+${day};
	}
	function pagelist(cpage) {
		var pageNo = document.getElementById('pageNumber');
		pageNo.value = cpage;
		cpage = Number(cpage);
		window.location.href="expect.do?pageNumber="+cpage+"&day="+${day};
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
						<script>alert("${msg }")</script>
						<script>location.href="expect.do?pageNumber=${pageNumber}&day=${day}" </script>
					</c:if>
						<h1 style="text-align: center;">예상 섭취 정보</h1>
						<hr>
						<div id="daypart">
							<div id="all"><span style="color:#fec503">※&nbsp;</span><a href="expect.do?pageNumber=1&day=0">전체 내역 &nbsp;</a></div> <br/>
							<div id="week"><span style="color:#fec503">★&nbsp;</span><a href="expect.do?pageNumber=1&day=1">이번주 &nbsp;</a></div>
							<div id="month"><span style="color:#fec503">♥&nbsp;</span><a href="expect.do?pageNumber=1&day=2">이번달 &nbsp;</a></div>
							<div id="year"><span style="color:#fec503">♣&nbsp;</span><a href="expect.do?pageNumber=1&day=3">올해 &nbsp;</a></div> <br/>
						</div>
						<hr>
						<div id="chartwrapper">
							<div id="chartdiv" ></div>
							<div id="chartinfo">
								<table id="nutriTb">
									<thead>
										<tr>
											<th >영양정보</th>
											<th >섭취 내역</th>
											<th >예상 섭취 내역</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>총 용량</td>
											<td>${e1[0]}</td>
											<td>${n1[0]}</td>
										</tr>
										<tr>
											<td>칼로리</td>
											<td>${e1[1]}</td>
											<td>${n1[1]}</td>
										</tr>
										<tr>
											<td>탄수화물</td>
											<td>${e1[2]}</td>
											<td>${n1[2]}</td>
										</tr>
										<tr>
											<td>단백질</td>
											<td>${e1[3]}</td>
											<td>${n1[3]}</td>
										</tr>
										<tr>
											<td>지방</td>
											<td>${e1[4]}</td>
											<td>${n1[4]}</td>
										</tr>
										<tr>
											<td>당류</td>
											<td>${e1[5]}</td>
											<td>${n1[5]}</td>
										</tr>
										<tr>
											<td>나트륨</td>
											<td>${e1[6]}</td>
											<td>${n1[6]}</td>
										</tr>
										<tr>
											<td>콜레스테롤</td>
											<td>${e1[7]}</td>
											<td>${n1[7]}</td>
										</tr>
										<tr>
											<td>포화 지방산</td>
											<td>${e1[8]}</td>
											<td>${n1[8]}</td>
										</tr>
										<tr>
											<td>트랜스지방</td>
											<td>${e1[9]}</td>
											<td>${n1[9]}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					<div>
					<table id="nutriTb">
						<tr>
						<br/>
							<h1 style="text-align: center;">섭취 내역</h1>	<hr>
						</tr>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">상품명<input type="hidden" id="pageNumber" name="pageNumber"/></th>
								<th scope="col">수량</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ n2}" var="cart" varStatus="cnt">
								<tr>
									<td>${cnt.count }</td>
									<td>${cart[0]}</td>
									<td>${cart[1]}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
					<div id="pagination-container">${bean.pageLink}</div>
					<div>
					<table id="nutriTb">
						<tr>
							<br/>
							<h1 style="text-align: center;">예상 섭취 내역</h1>
							<hr>
						</tr>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">상품명</th>
								<th scope="col">수량</th>
								<th scope="col">삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${n3}" var="excart">
								<tr>
									<td>${excart.getFood().getCode() }</td>
									<td>${excart.getFood().getName()}</td>
									<td>${excart.getAmount()}</td>
									<td><button id="delete_cart" onclick="deletecart(${excart.getCno()})" >삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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

</body>
</html>