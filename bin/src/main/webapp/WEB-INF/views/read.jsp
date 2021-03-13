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
	$(function(){
		$("#bList").click(function(){
			location.href = "${root}/board.do";
		});
		
		$("#modifyBtn").click(function(){
			location.href = "${root}/board.do?act=mContent&bnum=${dto.bnum}";
		})
		
		$("#deleteBtn").click(function(){
			location.href = "${root}/board.do?act=delete&bnum=${dto.bnum}";
		})
	})
</script>
<style>
	h2{
		text-align: center;
		margin: 20px 0;
	}
	
	.card{
		margin: 50px 0;
	}
	
	.loginBtn{
		margin-right: 10px;
	}
</style>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="./include/header.jsp" %>
		<div class="container-fluid">
			<div class="card">
				<table class="table table-bordered">
					<tr>
						<td><b>${dto.bnum}</b></td>
						<td><b>제목</b></td>
						<td colspan="4">${dto.btitle}</td>
					</tr>
					<tr>
						<td style="width:15%"><b>작성자</b></td>
						<td style="width:20%">${dto.bwriter}</td>
						<td style="width:15%"><b>조회수</b></td>
						<td style="width:15%">${dto.breadCnt}</td>
						<td style="width:15%"><b>작성일</b></td>
						<td style="width:20%">${dto.bwriteDate}</td>
					</tr>
					<tr>
						<td colspan="6" rowspan="2" style="height:300px;">${dto.bcontent}</td>
					</tr>
				</table>
			</div>
			<div class="card-body">
				<button id="bList" class="btn btn-primary">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit align-middle mr-2">
						<path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
						<path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
					</svg>목록으로
				</button>
				<c:if test="${loginInfo.userid eq 'admin'}">
				<button id="modifyBtn" class="btn btn-warning"><i class="fas fa-globe-americas"></i> 수정</button>
				<button id="deleteBtn" class="btn btn-danger"><i class="fas fa-times"></i> 삭제</button>
				</c:if>
			</div>
		</div>
		<%@ include file="./include/footer.jsp"%>
		
	</div>
</body>
</html>