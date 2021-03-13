<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="css/app.css" rel="stylesheet">
<style type="text/css">
	.container{
		margin-top: 10px;	
	}
	
	.card{
		padding: 10px 0;
		margin-left: 100px;
	}
	
	.text-center{
		margin-top: 30px;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="card col-8">
			<div class="row">
				<div class="col text-center">
					<h3>로그인 ERROR!</h3>
					<h5>${failLogin}</h5>
					<a href="index" id="replay" class="btn btn-primary">로그인 재시도</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>