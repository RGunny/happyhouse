<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happy House</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<link rel="manifest" href="https://mdbootstrap.com/manifest.json">
<script async=""
	src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/insight.beta.min.js.다운로드"></script>
<script type="text/javascript" async=""
	src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/ec.js.다운로드"></script>
<script
	src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/289867067833087"
	async=""></script>
<script async=""
	src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/fbevents.js.다운로드"></script>
<script type="text/javascript" async=""
	src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/insight.min.js.다운로드"></script>
<script type="text/javascript" async=""
	src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/9165eec4-fcd5-4c79-aa25-5d2d8d5eee4d.js.다운로드"></script>
<script type="text/javascript" async=""
	src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/f.txt"></script>
<script type="text/javascript" async=""
	src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/analytics.js.다운로드"></script>
<script async=""
	src="./Bootstrap Modal Form - examples &amp; tutorial. Basic &amp; advanced usage - Material Design for Bootstrap_files/gtm.js.다운로드"></script>
<script>(function(html){html.className = html.className.replace(/\bno-js\b/,'js')})(document.documentElement);</script>
<script type="text/javascript">var ajax_url = 'https://mdbootstrap.com/wp-load.php';</script>
<script>(function(html){html.className = html.className.replace(/\bno-js\b/,'js')})(document.documentElement);</script>
<script type="text/javascript">var ajax_url = 'https://mdbootstrap.com/wp-load.php';</script>
<script>(function(html){html.className = html.className.replace(/\bno-js\b/,'js')})(document.documentElement);</script>
<script type="text/javascript">var ajax_url = 'https://mdbootstrap.com/wp-load.php';</script>
<link rel="stylesheet"
	href="${root }/resources/css/happyhouseCss.css?version=0.0.1">
<link rel="stylesheet"
	href="${root }/resources/css/myCss.css?version=0.0.8">
<script type="text/javascript">
  $(document).ready(function() {
/* show lightbox when clicking a thumbnail? */
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
<style type="text/css">
.detail {
	cursor: pointer;
	width: 30px;
	height: 30px;
}

#searchResult tr:hover {
	background-color: rgb(247, 247, 247);
}
</style>
</head>
<body>
	<%@ include file="./include/header.jsp"%>
	<div id="main-content">
		<section id="section-input">
			<script>
		var resultList = {};
		var reverse = false;
		let colorArr = ['table-primary','table-success','table-danger'];
		$(document).ready(function(){
			  $.ajax({
				  url:'sido',
					data:{},
					method : 'get',
					dataType : "json",
					success : function(result){
						for(var i=0;i<result.length;i++){
							$("#sido").append("<option value='"+result[i]["sidoCode"]+"'>"+result[i]["sidoName"]+"</option>");
						}
					},
					error:function(result){
						alert('ajax error');
					}
			  });
			});//ready
			$(document).ready(function(){
				$("#sido").change(function() {
					$.ajax({
						  url:'gugun',
							data:{'sidoCode' : $("#sido").val()},
							method : 'get',
							dataType : "json",
							success : function(result){
								for(var i=0;i<result.length;i++){
									$("#gugun").append("<option value='"+result[i]["gugunCode"]+"'>"+result[i]["gugunName"]+"</option>");
								}
							},
							error:function(result){
								alert('ajax error');
							}
					  });
				});//change
				$("#gugun").change(function() {
					$.ajax({
						  	url:'dong',
							data:{'gugunCode' : $("#gugun").val()},
							method : 'get',
							dataType : "json",
							success : function(result){
								for(var i=0;i<result.length;i++){
									$("#dong").append("<option value='"+result[i]["dong"]+"'>"+result[i]["dong"]+"</option>");
								}
							},
							error:function(result){
								alert('ajax error');
							}
					  });
				});//change
				$("#btnSubmit").click(function() {
					var sido = $('#sido').val();
					var gugun = $('#gugun').val();
					var dong = $('#dong').val();
					$.get("${pageContext.request.contextPath}/apt"
							,{
							act:"apt", 
							dong:$("#dong").val(),
							gugun: $("#gugun").val(),
							sido: $("#sido").val()
							}
							,function(data, status){
								$("#columnName").empty();
								$("#searchResult").empty();
								
								let str = 
			                        "<th>번호</th>"
			                        +"<th>법정동</th>"
			                        +"<th>아파트 이름</th>"
			                        +"<th>매매 가격</th>"
			                        +"<th>지번</th>"
// 			                        +"<th>건축 년도</th>"
// 			                        +"<th>면적</th>"
// 			                        +"<th>층</th>";
			                        $("tr").append(str);
// 			                        $("#columnName").append(str);
			                        
								$.each(data, function(index, dto) {
									let str = "<tr class="+colorArr[index%3]+">"
									+ "<td>" + dto.houseId + "</td>"
									+ "<td>" + dto.dong + "</td>"
									+ "<td>" + dto.aptName + "</td>"
									+ "<td>" + dto.dealAmount +"</td>"
									+ "<td>" + dto.jibun + "</td>"
// 									+ "<td>" + dto.buildyear +"</td>"
// 									+ "<td>" + dto.area + "</td>"
// 									+ "<td>" + dto.floor + "</td></tr>";
									+ "</td><td id='lat_"+index+"'></td><td id='lng_"+index+"'></td></tr>";
									$("tbody").append(str);
									$("#searchResult")//.append(vo.dong+" "+vo.aptName+" "+vo.jibun+"<br>");
								});//each
								geocode(data);
							}//function
							, "json"
					);//get
					/*$.get("${pageContext.request.contextPath}/map"
							,{act:"apt", dong:$("#dong").val()}
							,function(data, status){
								resultList = data;
								drawTable(data);
								initMap();
								geocode(data);
								$("#result-content").show();
							}
							, "json"
					);//get
					$("#sortType").val(0);
					$("#sort").val(0);*/
				});//click
				///////////////////////////////////////////////////////////////////////////
				$("#btnHospital").click(function(){
						var sido = $('#sido').val();
						var gugun = $('#gugun').val();
						var dong = $('#dong').val();
// 						var searchString = $('#search').val();
						$.ajax({
							url : '${pageContext.request.contextPath}/searchHos',
									method : 'GET',
									data:{
										'act' : 'searchHos',
// 										'search' : searchString,
										'sido' : sido,
										'gugun' : gugun,
										'dong' : dong
									},
									//dataType : json,
									success : function(data){
										var jsonData = JSON.parse(data)
										alert(jsonData);
										$("#columnName").empty();
										$("#searchResult").empty();
										
										let str = 
					                        "<th>병원이름</th>"
					                        +"<th>시/도</th>"
					                        +"<th>군/구</th>"
					                        +"<th>동</th>"
					                        +"<th>외래/입원</th>"
					                        +"<th>대표 번호</th>";
					                        $("tr").append(str);
// 					                        $("#columnName").append(str);

										$.each(jsonData, function(index, vo) {
											let str = "<tr class="+colorArr[index%3]+">"
											+ "<td>" + vo.hospital_name + "</td>"
											+ "<td>" + vo.sido + "</td>"
											+ "<td>" + vo.gugun + "</td>"
											+ "<td>" + vo.dong + "</td>"
											+ "<td>" + vo.hospital_type + "</td>"
											+ "<td>" + vo.hospital_tel + "</td>"
											+ "</td><td id='lat_"+index+"'></td><td id='lng_"+index+"'></td></tr>";
											$("tbody").append(str);
											$("#searchResult")//.append(vo.dong+" "+vo.aptName+" "+vo.jibun+"<br>");
										});//each
										geocode(jsonData);
									},
									error : function(data){
										alert('검색 오류');
									}
						})
					})
					$("#btnCorona").click(function(){
						var sido = $('#sido').val();
						var gugun = $('#gugun').val();
						var dong = $('#dong').val();
// 						var searchString = $('#search').val();
						$.ajax({
							url : '${pageContext.request.contextPath}/searchCor',
									method : 'GET',
									data:{
										'act' : 'searchCor',
// 										'search' : searchString,
										'sido' : sido,
										'gugun' : gugun,
										'dong' : dong
									},
									//dataType : json,
									success : function(data){
										var jsonData = JSON.parse(data)
										alert(jsonData);
										$("#columnName").empty();
										$("#searchResult").empty();

										let str = 
					                        "<th>검사가능여부</th>"
					                        +"<th>진료소 이름</th>"
					                        +"<th>시/도</th>"
					                        +"<th>군/구</th>"
					                        +"<th>동</th>"
					                        +"<th>월-금 이용시간</th>"
					                        +"<th>토요일 이용시간</th>"
					                        +"<th>일요일 이용시간</th>"
					                        +"<th>대표 번호</th>";
					                        $("tr").append(str);
// 					                        $("#colmunName").append(str);										
										
										$.each(jsonData, function(index, vo) {
											let str = "<tr class="+colorArr[index%3]+">"
											+ "<td>" + vo.treatment_available + "</td>"
											+ "<td>" + vo.corona_name + "</td>"
											+ "<td>" + vo.sido + "</td>"
											+ "<td>" + vo.gugun + "</td>"
											+ "<td>" + vo.dong + "</td>"
											+ "<td>" + vo.monTofri_time + "</td>"
											+ "<td>" + vo.sat_time + "</td>"
											+ "<td>" + vo.sun_time + "</td>"
											+ "<td>" + vo.corona_tel + "</td>"
											+ "</td><td id='lat_"+index+"'></td><td id='lng_"+index+"'></td></tr>";
											$("tbody").append(str);
											$("#searchResult")//.append(vo.dong+" "+vo.aptName+" "+vo.jibun+"<br>");
										});//each
										geocode(jsonData);
									},
									error : function(data){
										alert('검색 오류');
									}
						})
					})						
					
				
				///////////////////////////////////////////////////////////////////////////
				//
				$("#sortType").change(function(){
					$("#sort").val(0);
				});
				$("#sort").change(function(){
					var sortType = $("#sortType").val();
					if(sortType == 0){
						alert("정렬 기준을 선택해주세요.");
						$("#sort").val(0);
						return;
					}else{
						var sort = $("#sort").val();
						if(sort == 1) reverse = false; //오름차순
						else reverse = true; //내림차순
						if(sortType == 1){ //매물 번호순 정렬
							resultList.sort(sortId);
						}else if(sortType == 2){ //건물 이름순 정렬
							resultList.sort(sortName);
						}else{ //실거래가 정렬
							resultList.sort(sortAmount);
						}
						drawTable(resultList);
					}
				});
				//상세정보 입력하기..
				$(".detail").click(function(){
					var no = this.id;
					consol.log("%%");
				});
			});//ready
			function drawTable(data){
				const member = data.list;
				
				$("#searchResult").empty();
				$("#resultNum").text(data.length);
				$.each(data, function(index, vo) {
					$("#searchResult").append($('<tr id="'+vo.no+'">')
						.append($('<td>').append(vo.no))
						.append($('<td>').append(vo.dong))
						.append($('<td>').append(vo.aptName))
						.append($('<td>').append(vo.jibun))
						.append($('<td>').append(vo.dealAmount))
						.append($('<td>').append($('<a href="${root}/detail.do?act=detail&no='+vo.no.trim()+'">')
								.append('<img class="detail" src="./img/detail.png">')))
					);
				});//each
				page();
			}
			function sortId(a,b){
				if(Number(a.no) == Number(b.no)) return 0;
				if(!reverse){
					return Number(a.no) > Number(b.no)? 1:-1;
				}else{
					return Number(a.no) < Number(b.no)? 1:-1;
				}
			}
			function sortAmount(a,b){
				if(Number(a.dealAmount.trim().replace(',','')) == Number(b.dealAmount.trim().replace(',',''))) return 0;
				if(!reverse){
					return Number(a.dealAmount.trim().replace(',','')) > Number(b.dealAmount.trim().replace(',',''))? 1:-1;
				}else{
					return Number(a.dealAmount.trim().replace(',','')) < Number(b.dealAmount.trim().replace(',',''))? 1:-1;
				}
			}
			function sortName(a,b){
				if(a.aptName == b.aptName) return sortId(a,b);
				if(!reverse){
					return a.aptName > b.aptName? 1:-1;
				}else{
					return a.aptName < b.aptName? 1:-1;
				}
				
			}
			function page(){ 

				$('table.paginated').each(function() {
					
					var pagesu = 10;  //페이지 번호 갯수
					var currentPage = 0;
					var numPerPage = 9;  //목록의 수
					var $table = $(this);    
					var pagination = $("#pagination");
				
					//length로 원래 리스트의 전체길이구함
					var numRows = $table.find('tbody tr').length;
				
					//Math.ceil를 이용하여 반올림
					var numPages = Math.ceil(numRows / numPerPage);
				
					//리스트가 없으면 종료
					if (numPages==0) return;
				
					//pager라는 클래스의 div엘리먼트 작성
					var $pager = $('<div class="pager"></div>');
					var nowp = currentPage;
					var endp = nowp+10;
				
					//페이지를 클릭하면 다시 셋팅
					$table.bind('repaginate', function() {
				
					//기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
					$table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
					$("#pagination").html("");
				
				
					if (numPages > 1) {     // 한페이지 이상이면
					if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
						nowp = 0;     // 1부터 
						endp = pagesu;    // 10까지
					}else{
						nowp = currentPage -5;  // 6넘어가면 2부터 찍고
						endp = nowp+pagesu;   // 10까지
						pi = 1;
					}
				
					if (numPages < endp) {   // 10페이지가 안되면
						endp = numPages;   // 마지막페이지를 갯수 만큼
						nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
					}
				
					if (nowp < 1) {     // 시작이 음수 or 0 이면
						nowp = 0;     // 1페이지부터 시작
					}
				
					}else{       // 한페이지 이하이면
						nowp = 0;      // 한번만 페이징 생성
						endp = numPages;
					}
				
				
					// [처음]
					$('<button class="btn btn-outline-primary btn-sm pageNum first">처음</button>').bind('click', {newPage: page},function(event) {
						currentPage = 0;   
						$table.trigger('repaginate');  
						$($(".pageNum")[2]).addClass('active').siblings().removeClass('active');
					}).appendTo(pagination).addClass('clickable');
				
				
					// [이전]
					$('<button class="btn btn-outline-primary btn-sm pageNum back">이전</button>').bind('click', {newPage: page},function(event) {
						if(currentPage == 0) return; 
						currentPage = currentPage-1;
						$table.trigger('repaginate'); 
						$($(".pageNum")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
					}).appendTo(pagination).addClass('clickable');
				
				
					// [1,2,3,4,5,6,7,8]
					for (var page = nowp ; page < endp; page++) {
						$('<button class="btn btn-outline-primary btn-sm pageNum"></button>').text(page + 1).bind('click', {newPage: page}, function(event) {
							currentPage = event.data['newPage'];
							$table.trigger('repaginate');
							$($(".pageNum")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
						}).appendTo(pagination).addClass('clickable');
					} 
				
				
				
					// [다음]
					$('<button class="btn btn-outline-primary btn-sm pageNum next">다음</button>').bind('click', {newPage: page},function(event) {
						if(currentPage == numPages-1) return;
						currentPage = currentPage+1;
						$table.trigger('repaginate'); 
						$($(".pageNum")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
					}).appendTo(pagination).addClass('clickable');
				
				
					// [끝]
					$('<button class="btn btn-outline-primary btn-sm pageNum last">끝</button>').bind('click', {newPage: page},function(event) {
						currentPage = numPages-1;
						$table.trigger('repaginate');
						$($(".pageNum")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
					}).appendTo(pagination).addClass('clickable');
				
						$($(".pageNum")[2]).addClass('active');
					});
				
				
					$pager.insertAfter($table).find('button.pageNum:first').next().next().addClass('active');   
				
					$pager.appendTo(pagination);
				
					$table.trigger('repaginate');

				});

			}
			function geocode(jsonData) {
				clearMarker();
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
			<div id="test"></div>
			<div>
				시, 도 : <select id="sido" class="form-control option-control">
					<option value="0" selected disabled>선택해주세요.</option>
				</select> 구, 군 : <select id="gugun" class="form-control option-control">
					<option value="0" selected disabled>선택해주세요.</option>
				</select> 읍, 면, 동 : <select id="dong" class="form-control option-control">
					<option value="0" selected disabled>선택해주세요.</option>
				</select>
				<button id="btnSubmit" class="btn btn-primary btn-lg">검색</button>
				<button id="btnHospital" class="btn btn-primary btn-lg">안전병원</button>
				<button id="btnCorona" class="btn btn-primary btn-lg">코로나진료소</button>
			</div>

		</section>
		<section id="section-result">
			<div id="result-content">
				<!-- 모달 // 집 상세보기 -->
				<div class="modal fade" id="houseInfo" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="houseInfoLabel"></h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" id="houseInfoBody">
								<table class="table">
									<tr>
										<img src="./img/house1.jpg" width="300px" height="300px"
											id="imgHouse">
									</tr>
									<tr>
										<th>매물 번호</th>
										<td id="infoNum"></td>
									</tr>
									<tr>
										<th>법정동</th>
										<td id="infoDong"></td>
									</tr>
									<tr>
										<th>건물 이름</th>
										<td id="infoName"></td>
									</tr>
									<tr>
										<th>거래가</th>
										<td id="infoDeal"></td>
									</tr>
									<tr>
										<th>준공년도</th>
										<td id="infoYear"></td>
									</tr>
									<tr>
										<th>지번</th>
										<td id="infoJibum"></td>
									</tr>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<aside id="result-map">
					<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>
					<script defer
						src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDcc74Gpy-fPJWEqX7OYHWOQoXq6ATSRDY&callback=initMap"></script>
					<script>
					var multi = {lat: 37.5665734, lng: 126.978179};
					var map;
					var markers = [];
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
							callHouseDealInfo();
						});
						marker.setMap(map);
						markers.push(marker);
					}
					function clearMarker(){
						for(var i=0;i<markers.length;i++){
							markers[i].setMap(null);
						}
						
						markers=[];
					}
					function callHouseDealInfo(aptName) {
						$('#houseinfo').toggle();
						//alert("you can call HouseDealInfo");
					}
				</script>
				</aside>
				<div id="result-houses">
					<div id="result-nav">
						<div class="result-form">
							검색 결과<span style="font-size: 15px;">(총 <span
								id="resultNum">0</span>건)
							</span>
						</div>
						<select id="sortType" class="form-control option-control">
							<option value="0" selected disabled>정렬 기준</option>
							<option value="1">매물 번호</option>
							<option value="2">건물 이름</option>
							<option value="3">실거래가</option>
						</select> <select id="sort" class="form-control option-control">
							<option value="0" selected disabled>정렬</option>
							<option value="1">오름차순</option>
							<option value="2">내림차순</option>
						</select>

					</div>
					<div id="tableResult" class="table">
						<table class="tbList paginated">
							<thead>
								<tr id="columnName"></tr>
							</thead>
							<tbody id="searchResult">
							</tbody>
						</table>
					</div>
					<div class="btnContent">
						<div clss="pagination" id="pagination"></div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="./include/footer.jsp"%>

</body>
</html>
