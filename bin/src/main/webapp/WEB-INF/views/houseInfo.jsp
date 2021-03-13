<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happy House</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="manifest" href="https://mdbootstrap.com/manifest.json">
<script async="" src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/insight.beta.min.js.다운로드"></script><script type="text/javascript" async="" src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/ec.js.다운로드"></script><script src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/289867067833087" async=""></script><script async="" src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/fbevents.js.다운로드"></script><script type="text/javascript" async="" src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/insight.min.js.다운로드"></script><script type="text/javascript" async="" src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/9165eec4-fcd5-4c79-aa25-5d2d8d5eee4d.js.다운로드"></script><script type="text/javascript" async="" src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/f.txt"></script><script type="text/javascript" async="" src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/analytics.js.다운로드"></script><script async="" src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/gtm.js.다운로드"></script><script>(function(html){html.className = html.className.replace(/\bno-js\b/,'js')})(document.documentElement);</script>
<script type="text/javascript">var ajax_url = 'https://mdbootstrap.com/wp-load.php';</script><script>(function(html){html.className = html.className.replace(/\bno-js\b/,'js')})(document.documentElement);</script>
<script type="text/javascript">var ajax_url = 'https://mdbootstrap.com/wp-load.php';</script><script>(function(html){html.className = html.className.replace(/\bno-js\b/,'js')})(document.documentElement);</script>
<script type="text/javascript">var ajax_url = 'https://mdbootstrap.com/wp-load.php';</script>
<link rel="stylesheet" href="${root }/resources/css/happyhouseCss.css?version=0.0.1">
<link rel="stylesheet" href="${root }/resources/css/myCss.css?version=0.0.8">
<style type="text/css">
 table{
	float: left;
    width: 500px;
    margin: 80px;
 }
</style>
<script type="text/javascript">
  $(document).ready(function() {
/* show lightbox when clicking a thumbnail */
    $('a.thumb').click(function(event){
      event.preventDefault();
      var content = $('.modal-body');
      content.empty();
        var title = $(this).attr("title");
        $('.modal-title').html(title);        
        content.html($(this).html());
        $(".modal-profile").modal({show:true});
    });

  });
  function geocode(jsonData) {
		let idx = 0;
		$.each(jsonData, function(index, vo) {
			let tmpLat;
			let tmpLng;
			$.get("https://maps.googleapis.com/maps/api/geocode/json"
					,{	key:'AIzaSyDcc74Gpy-fPJWEqX7OYHWOQoXq6ATSRDY'
						, address:vo.dong+"+"+vo.aptName+"+"+vo.jibun
					}
					, function(data, status) {
						//alert(data.results[0].geometry.location.lat);
						tmpLat = data.results[0].geometry.location.lat;
						tmpLng = data.results[0].geometry.location.lng;
						$("#lat_"+index).text(tmpLat);
						$("#lng_"+index).text(tmpLng);
						addMarker(tmpLat, tmpLng, vo.aptName);
					}
					, "json"
			);//get
		});//each
	}
</script>
</head>
<body>
<%@ include file="./include/header.jsp" %>
	<div id="main-content">
			<div id="result-content">
				<aside id="result-map">
					<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>
					<script defer
						src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDcc74Gpy-fPJWEqX7OYHWOQoXq6ATSRDY&callback=initMap"></script>
					<script>
					var multi = {lat: 37.5665734, lng: 126.978179};
					var map;
					function initMap() {
						map = new google.maps.Map(document.getElementById('map'), {
							center: multi, zoom: 12
						});
					}
					function addMarker(tmpLat, tmpLng, aptName) {
						var marker = new google.maps.Marker({
							position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
							label: aptName,
							title: aptName
						});
						marker.addListener('click', function() {
							map.setZoom(17);
							map.setCenter(marker.getPosition());
							callHouseDealInfo(marker.label);
						});
						marker.setMap(map);
					}
					function callHouseDealInfo(aptName) {
						$('#houseinfo').toggle();
						//alert("you can call HouseDealInfo");
					}
				</script>
				</aside>
				<section id="result-houseinfo">
					<div id="houseinfo">
						<table class="table" id="houseinfo-table">
							<tr>
								<th>매물 번호</th>
								<td>${houseinfo.no }</td>
							</tr>
							<tr>
								<th>건물 이름</th>
								<td>${houseinfo.aptName }</td>
							</tr>
							<tr>
								<th>건물 위치</th>
								<td>${houseinfo.jibun }</td>
							</tr>
							<tr>
								<th>실거래가</th>
								<td>${houseinfo.dealAmount }</td>
							</tr>
							<tr>
								<th>준공년도</th>
								<td>${houseinfo.buildYear }</td>
							</tr>
							<tr>
								<th>거래일</th>
								<td></td>
							</tr>
							<tr>
								<th>평 수(m^2)</th>
								<td></td>
							</tr>
							<tr>
								<th>층 수</th>
								<td></td>
							</tr>
						</table>
					</div>
				</section>
			</div>
		</div>
		<%@ include file="./include/footer.jsp"%>

</body>
</html>