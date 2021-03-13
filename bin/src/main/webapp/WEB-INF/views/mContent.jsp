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
	
	
	$("#loginBtn").click(function(){
		if (!$("#userid").val()) { //$(""#userId").val.length>0
			alert("아이디를 입력하세요.");
			return false;
		} else if (!$("#userpw").val()) {
			alert("비밀번호를 입력하세요.");
			return false;
		} else {
			$("#loginform").attr("action", "${root}/login.do").submit();
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
			$("#signupform").attr("action", "${root}/member.do").submit();
		}
	})
	
	<c:if test="${not empty insertedMember}">
		alert("${insertedMember}");
	</c:if>
	
	$("#modify-submit").click(function(){
		$("#modifyform").attr("action", "${root}/board.do").submit();
	})
  });
</script>
<style type="text/css">
	#non-deco{
		text-decoration: none;
		outline: none;
		border: none;
		background: none;
		font-weight: 700;
		text-align: center;
	}
</style>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="./include/header.jsp" %>
		<div class="container-fluid">
		<nav class="navbar navbar-expand navbar-light navbar-bg">
			<h1 class="h3 mb-1">Happy House 공지사항 작성</h1>
		</nav>
		<div class="container-fluid">
			<div class="card">
				<form id="modifyform" name="modify" method="post" action="" role="form">
					<input type="hidden" name="act" value="modify">
					<table class="table table-bordered">
						<tr>
							<td><b><input type="text" id="non-deco" name="num" value="${dto.bnum}" readonly></b></td>
							<td><b>제목</b></td>
							<td colspan="3">
								<input type="text" name="title" class="form-control" value="${dto.btitle}">
							</td>
						</tr>
						<tr>
							<td style="width:15%"><b>작성자</b></td>
							<td style="width:20%">${dto.bwriter}</td>
							<td style="width:15%"><b>작성일</b></td>
							<td style="width:20%">${dto.bwriteDate}</td>
						</tr>
						<tr>
							<td colspan="6" rowspan="2" style="height:300px;"><textarea rows="11" name="content" class="form-control">${dto.bcontent}</textarea></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="card-body">
				<button id="modify-submit" class="btn btn-primary">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" 
					stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit align-middle mr-2">
						<path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
						<path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
					</svg>수정하기
				</button>
			</div>
		</div>
	</div>
	<%@ include file="./include/footer.jsp"%>

	</div>
</body>
</html>