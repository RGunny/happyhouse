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

$('#carouselExample').on('slide.bs.carousel', function (e){
    var $e = $(e.relatedTarget);
    var idx = $e.index();
    var itemsPerSlide = 3;
    var totalItems = $('.carousel-item').length;
    
    if (idx >= totalItems-(itemsPerSlide-1)) {
        var it = itemsPerSlide - (totalItems - idx);
        for (var i=0; i<it; i++) {
            // append slides to end
            if (e.direction=="left") {
                $('.carousel-item').eq(i).appendTo('.carousel-inner');
            }
            else {
                $('.carousel-item').eq(0).appendTo('.carousel-inner');
            }
        }
    }
});

  $(function() {
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
	
	
	$("#loginBtn").click(function(){
		if (!$("#userid").val()) { //$(""#userId").val.length>0
			alert("아이디를 입력하세요.");
			return false;
		} else if (!$("#userpw").val()) {
			alert("비밀번호를 입력하세요.");
			return false;
		} else {
			$("#loginform").submit();
		}
	})
	
	$("#join-submit").click(function(){
		if (!$("#inputID").val()) { //$(""#userId").val.length>0
			alert("아이디를 입력하세요.");
			return false;
		} else if (!$("#inputPassword").val()) {
			alert("비밀번호를 입력하세요.");
			return false;
		} else if (!$("#inputPasswordCheck").val()) {
			alert("비밀번호를 한 번 더 입력하세요.");
			return false;
		} else if (!$("#inputName").val()) {
			alert("이름을 입력하세요.");
			return false;
		} else if (!$("#inputEmail").val()) {
			alert("email을 입력하세요.");
			return false;
		} else if (!$("#inputBTD").val()) {
			alert("생년월일을 입력하세요.");
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
		} else if($("input[type='checkbox']").is(":checked") == false){
			alert("이용약관에 체크하세요.");
			return false;
		} else {
			$("#signupform").submit();
		}
	})
	
	
	<c:if test="${not empty insertedMember}">
		alert("${insertedMember}");
	</c:if>
	
	$("#write").click(function(){
		<c:if test="${loginInfo.userId eq 'admin'}">
			location.href = "writeForm";
		</c:if>
	});
	
	$("#searchBtn").click(function() {
		$("#searchform").submit();
	});
  });
</script>
<style>
	h2{
		text-align: center;
		margin: 20px 0;
	}
	
	#boardMain{
		margin-top: 5em;
	}
	
	
	.content-center{
		margin: auto;
	}
	
	.center{
		display: inline-block;
		margin: 30px 0;
	}
	
	div.navbar-align.col-2{
		display: inline-block;
		margin-left: 77%;
	}
	
	.btn-search{
		background-color: #F2F2F2;
		border: 1px solid #ced4da;
	}
	
	.input-group{
		width:105%;
	}
	
	.loginBtn{
		margin-right: 10px;
	}
</style>
</head>
<body>
	<div class="container-fluid">
	<%@ include file="./include/header.jsp"%>
		<div class="row" id="boardMain">
			<div class="col-12">
				<div class="card">
					<c:if test="${empty loginInfo or loginInfo.userId ne 'admin'}">
					<div class="card-header col-md-12">
						<div class="navbar-align col-2" style="margin-left:80% !important">
							<form id="searchform" method="post" action="searchList">
								<div class="input-group">
									<select id="inputState" name="selectValue" class="form-control">
										<option value="title" selected>제목</option>
										<option value="bnum">글번호</option>
									</select> 
									<input type="text" class="form-control text-form" aria-label="Search">
									<div class="input-group-append">
										<button id="searchBtn" class="btn btn-search noticeBtn" type="button">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search align-middle">
												<circle cx="11" cy="11" r="8"></circle>
												<line x1="21" y1="21" x2="16.65" y2="16.65"></line>
											</svg>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					</c:if>
					<c:if test="${loginInfo.userId eq 'admin'}">
					<div class="card-header col-md-12">
						<button id="write" class="btn btn-primary">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"  stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit align-middle mr-2">
								<path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
								<path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
							</svg>글쓰기
						</button>
						<div class="navbar-align col-2" style="margin-left:75% !important">
							<form id="searchform" method="post" action="searchList">
								<div class="input-group">
									<select id="inputState" name="selectValue" class="form-control">
										<option value="title" selected>제목</option>
										<option value="bnum">글번호</option>
									</select> 
									<input type="text" class="form-control text-form" aria-label="Search">
									<div class="input-group-append">
										<button id="searchBtn" class="btn btn-search noticeBtn" type="button">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search align-middle">
												<circle cx="11" cy="11" r="8"></circle>
												<line x1="21" y1="21" x2="16.65" y2="16.65"></line>
											</svg>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					</c:if>
					<table class="table">
						<thead>
							<tr>
								<th style="width: 5%;">No.</th>
								<th style="width: 40%; text-align: center;">Title</th>
								<th style="width: 15%">Writer</th>
								<th style="width: 15%">Date</th>
								<th style="width: 15%">View</th>
								<c:if test="${loginInfo.userId eq 'admin'}">
									<th class="d-none d-md-table-cell" style="width: 20%">Actions</th>
								</c:if>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty pageDto or empty pageDto.boardList}">
									<tr>
										<td colspan="5">작성된 게시글이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${pageDto.boardList}" var="dto">
										<tr>
											<td>${dto.bnum}</td>
											<td><a href="board.do?act=read&bnum=${dto.bnum}">${dto.btitle}</a></td>
											<td>${dto.bwriter}</td>
											<td class="d-none d-md-table-cell">${dto.bwriteDate}</td>
											<td>${dto.breadCnt}</td>
											<c:if test="${loginInfo.userId eq 'admin'}">
												<td class="table-action">
													<a href="mContent"> 
														<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 align-middle">
															<path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
														</svg>
													</a> 
													<a href="delete"> 
														<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash align-middle">
															<polyline points="3 6 5 6 21 6"></polyline>
															<path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
														</svg>
													</a>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<div class="content-center">
						<nav aria-label="Page navigation example" class="center">
							<ul class="pagination pagination-sm">
							<c:if test="${pageDto.startPage>1}">
								<li class="page-item"><a href="board.do?act=boardList&page=${pageDto.startPage-1}" name="page" class="page-link"><i class="fas fa-angle-left"></i></a></li>
							</c:if>
							<c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}" var="i">
								<c:if test="${i eq pageDto.curPage}">
									<li class="page-item active"><a href="boardList" name="page" class="page-link"><b>${i}</b></a></li>
								</c:if> 
								<c:if test="${i ne pageDto.curPage}">
									<li class="page-item"><a href="board.do?act=boardList&page=${i}" name="page" class="page-link">${i}</a></li>
								</c:if>
								
							</c:forEach>
							<c:if test="${pageDto.endPage < pageDto.totalPage}">
								<li class="page-item"><a href="board.do?act=boardList&page=${pageDto.endPage+1}" name="page" class="page-link"><i class="fas fa-angle-right"></i></a></li>
							</c:if>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	<%@ include file="./include/footer.jsp"%>

	</div>
</body>
</html>