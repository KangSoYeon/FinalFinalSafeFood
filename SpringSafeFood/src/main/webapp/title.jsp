<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(function() {
		
		$.ajax({
			url : 'searchInfo',
			dataType : 'json',
			success : function(data) {
				$.each(data.data, function(index, data){
					var b ="<li><a href=javascript:addbar(\'"+data.skey+"\',"+data.soption+")>"
					+"<span>"+(index+1)+".&nbsp;</span>"
					+data.skey+"</a></li>";
					$('#ticker').append(b);
				});
			},
			error : function(err){
				console.log(err);
			}
		})
		
		<c:if test="${not empty droplist}">
		$('#droplist').val("${droplist}");
		</c:if>
		$('#searchbar').val("${searchbar}")

		var ticker = function() {
			timer = setTimeout(function() {
				$('#ticker li:first').animate({
					marginTop : '-20px'
				}, 400, function() {
					$(this).detach().appendTo('ul#ticker').removeAttr('style');
				});
				ticker();
			}, 2000);
		};

		//4 마우스를 올렸을 때 기능 정지
		var tickerover = function() {
			$('#ticker').mouseover(function() {
				clearTimeout(timer);
			});
			$('#ticker').mouseout(function() {
				ticker();
			});
		};
		tickerover();
		// 4 끝
		ticker();

	})
	function addbar(bar,op) {
		var drop = $("#droplist");
		drop.val(op);
		var search = $("#searchbar");
		search.val(bar);
		var frm = $("#frmbar");
		frm.submit();
	}
</script>
<style type="text/css">
header.masthead {
	text-align: center;
	color: #fff;
	background-repeat: no-repeat;
	background-attachment: scroll;
	background-position: center center;
	background-size: cover
}

.none {
	display: none
}

#ticker {
	float: left;
	width: 100px;
}

.block {
	padding: 0 5px;
	height: 30px;
	overflow: hidden;
	background: #fff;
	width: 350px;
	font-size: 1rem;
	font-weight:400;
	float: left;
	border-radius: 10px;
	margin-left: 10px;
}

.block ul, .block li {
	margin: 0;
	padding: 0;
	list-style: none;
}

.block li a {
	display: block;
	float:left;
	height: 30px;
	line-height: 20px;
	color: #555;
	text-decoration: none;
	margin-top: 5px;
	white-space: nowrap;
	padding-left: 10px;
}
#ticker span{
	color:#fed136;
	font-weight: bolder;
}
.ps{
	padding-left: 10px;
	text-align: left;
	font-size: 20px;
}
</style>
</head>
<body>

	<header class="masthead">
		<div class="container">
			<div>
				<div class="intro-text">
					<div class="intro-heading text-uppercase">WHAT WE PROVIDE</div>
					<div class="intro-lead-in">건강한 삶을 위한 먹거리 프로젝트</div>
					<div  class="ps">실시간 인기 검색어</div>
					<div class="block">
						<ul id="ticker">
							<%-- <c:forEach items="${slist}" var="b" varStatus="index">
								<c:if test="${index.count < 11}">
									<li><a href="javascript:addbar('${b.getSkey()}',${b.getSoption()})"><span>${index.count}.&nbsp;</span> ${b.getSkey()}</a></li>
								</c:if>
							</c:forEach> --%>
						</ul>
					</div>
					<!-- ======================================== 검색 창 추가 =========================================================== -->
					<form action="search.do" method="post" id="frmbar">
						<div class="search-header">
							<!-- ======================================== 검색 dropdown 추가 =========================================================== -->
							<select class="dropbtn form-control mr-sm-2" id="droplist"
								name="droplist">
								<option value="0">Select</option>
								<option value="1">상품명</option>
								<option value="2">제조사</option>
								<option value="3">영양정보</option>
							</select>

							<!-- ======================================== 검색 dropdown 추가 =========================================================== -->
							<input class="form-control mr-sm-2" type="text"
								placeholder="Search" id="searchbar" name="searchbar">
							<button type="submit" class="btn btn-secondary my-2 my-sm-0"
								id="searchbtn">Search</button>
						</div>
					</form>
					<!-- ======================================== 검색 창 추가 =========================================================== -->
				</div>
			</div>
		</div>
	</header>

</body>
</html>