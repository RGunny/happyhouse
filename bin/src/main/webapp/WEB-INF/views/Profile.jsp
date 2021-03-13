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
<script type="text/javascript">

	$('#carouselExample').on('slide.bs.carousel', function(e) {
		var $e = $(e.relatedTarget);
		var idx = $e.index();
		var itemsPerSlide = 3;
		var totalItems = $('.carousel-item').length;

		if (idx >= totalItems - (itemsPerSlide - 1)) {
			var it = itemsPerSlide - (totalItems - idx);
			for (var i = 0; i < it; i++) {
				// append slides to end
				if (e.direction == "left") {
					$('.carousel-item').eq(i).appendTo('.carousel-inner');
				} else {
					$('.carousel-item').eq(0).appendTo('.carousel-inner');
				}
			}
		}
	});

	$(document).ready(function() {
		<c:if test="${empty loginInfo}">
		alert("로그인이 필요한 기능입니다.");
		location.href = "${root}/index.jsp";
		</c:if>
		<c:if test="${not empty insertedMember}">
		alert("${insertedMember}");
		</c:if>
		
		$('a.thumb').click(function(event) {
			event.preventDefault();
			var content = $('.modal-body');
			content.empty();
			var title = $(this).attr("title");
			$('.modal-title').html(title);
			content.html($(this).html());
			$(".modal-profile").modal({
				show : true
			});
		});
		
		$("#modify-submit").click(function(){
			if (!$("#inputPassword").val()) {
				alert("비밀번호를 입력하세요.");
				return false;
			} else if (!$("#inputPasswordCheck").val()) {
				alert("비밀번호를 한 번 더 입력하세요.");
				return false;
			} else if (!$("#inputEmail").val()) {
				alert("email을 입력하세요.");
				return false;
			} else if (!$("#inputMobile").val()) {
				alert("휴대폰 번호를 입력하세요.");
				return false;
			} else if (!$("#inputAddr").val()) {
				alert("주소를 입력하세요.");
				return false;
			} else if ($("#inputPassword").val() != $("#inputPasswordCheck").val()) {
				alert("비밀번호를 확인하세요.");
				return false;
			} else {
				return true;
			}
		})
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="./include/header.jsp" %>
		<section class="container">
			<div class="row">
				<article class="card col-md-12">
					<div class="card-body">
				      <h4>회원 정보</h4>
				      <hr>
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td style="width:10%"><b>이름</b></td>
									<td>${detail.userName}</td>
								</tr>
								<tr>
									<td><b>아이디</b></td>
									<td>${detail.userId}</td>
								</tr>
								<tr>
									<td><b>이메일</b></td>
									<td>${detail.userEmail}</td>
								</tr>
								<tr>
									<td><b>휴대폰번호</b></td>
									<td>${detail.userPhone}</td>
								</tr>
								<tr>
									<td><b>생년월일</b></td>
									<td>${detail.userBirthday}</td>
								</tr>
								<tr>
									<td><b>주소</b></td>
									<td>${detail.userAddress}</td>
								</tr>
							</tbody>
						</table>
						<button id="modifyInfo" class="btn btn-primary" data-toggle="modal" data-target="#modiInfo">정보 수정</button>
						<div class="modal fade" id="modiInfo">
						<div class="modal-dialog modal-l">
							<div class="modal-content">
								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">회원 정보 수정</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									<div class="col-sm-11 col-md-offset-3">
										<form id="modifyform" method="post" action="modify">
											<div class="form-group">
												<label for="inputName">성명</label>
												<input type="text" class="form-control" id="inputName" name="userName" value="${detail.userName}" readonly> 
											</div>
											<div class="form-group">
												<label for="InputId">ID</label>
												<input type="text" class="form-control" id="inputID" name="userId" value="${detail.userId}" readonly>
											</div>
											<div class="form-group">
												<label for="InputBTD">생년월일</label> <input type="text"
													class="form-control" id="inputBTD" name="userBirthday" value="${detail.userBirthday}" readonly>
											</div>
											<div class="form-group">
												<label for="InputEmail">이메일 주소</label>
												<input type="email" class="form-control" id="inputEmail" name="userEmail" value="${detail.userEmail}">
											</div>
											<div class="form-group">
												<label for="inputPassword">비밀번호</label> <input
													type="password" class="form-control" id="inputPassword" name="userPw" value="${detail.userPw}">
											</div>
											<div class="form-group">
												<label for="inputPasswordCheck">비밀번호 확인</label>
												<input type="password" class="form-control" id="inputPasswordCheck">
											</div>
											<div class="form-group">
												<label for="inputMobile">휴대폰 번호</label>
												<input type="tel" class="form-control" id="inputMobile" name="userPhone" value="${detail.userPhone}">
											</div>
											<div class="form-group">
												<label for="inputAddr">주소</label>
												<input type="text" class="form-control" id="inputAddr" name="userAddress" value="${detail.userAddress}">
											</div>

											<div class="form-group text-center">
												<button id="modify-submit" class="btn btn-primary">수정 완료<i class="fa fa-check spaceLeft"></i></button>
												<button type="reset" class="btn btn-warning">작성 취소<i class="fa fa-times spaceLeft"></i></button>
											</div>
										</form>
									</div>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>

							</div>
						</div>
					</div>
					</div>	
				</article>
			</div>
		</section>
		<%@ include file="./include/footer.jsp"%>

	</div>
</body>
</html>