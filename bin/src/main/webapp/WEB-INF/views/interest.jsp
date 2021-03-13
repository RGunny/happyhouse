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
<link rel="stylesheet" href="${root }/resources/css/myCss.css?version=0.0.8">s/css/myCss.css?version=0.0.8"/>'>
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
</script>
</head>
<body>
	<c:if test="${empty loginInfo }">
		<script type="text/javascript">
			alert("해당 서비스는 로그인 후 이용할 수 있습니다.");
			location.href = "index";
		</script>
	</c:if>
	<c:if test="${not empty loginInfo }">
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
				<section id="result-interest">
					<div id="interest-loc">
						<div style = "font-size : 30px; font-weight : bold;">관심 지역 목록</div>
						<c:if test="${interestList eq null}">
							<div class="interest-box">
								<div>등록된 관심지역이 없습니다.</div>
							</div>
						</c:if>
						<c:if test="${interestList ne null }">
							<c:forEach items="${interestList }" var="loc">
								<div>${loc.dong } / ${interest.gugun }</div>
								<div type="button" id = "btnChange0" class="btn-form">메인으로 변경</div>
								<div type="button" id = "btnDelete0" class="btn-form">삭제</div>
							</c:forEach>
						</c:if>
					</div>
				</section>
				<section id="result-surround">
					<div style = "font-size : 30px; font-weight : bold;">근처 상가 정보</div>
					<div id="result-nav">
						<select id="foodType" class="form-control option-control">
							<option value="0" selected disabled>음식</option>
							<c:if test="${interestList ne null }">
							<option value="1">한식</option>
							<option value="2">중식</option>
							<option value="3">일식</option>
							<option value="4">양식</option>
							</c:if>
						</select>
						<select id="cafeType" class="form-control option-control">
							<option value="0" selected disabled>커피점/카페</option>
							<c:if test="${interestList ne null }">
							<option value="1">스타벅스</option>
							<option value="2">할리스</option>
							<option value="3">투썸플레이스</option>
							<option value="4">빽다방</option>
							</c:if>
						</select>
					</div>
					<div id="result-store">
						<table class="table" id="result-table">
							<thead>
								<tr>
									<th>상가 이름</th>
									<th>상가 종류</th>
									<th>상가 위치 (지번 주소)</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
					</div>
				</section>
			</div>
		</div>
		<%@ include file="./include/footer.jsp"%>

	</c:if>
</body>
</html>