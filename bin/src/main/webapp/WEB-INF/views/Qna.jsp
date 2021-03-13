<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<script>
	(function(html) {
		html.className = html.className.replace(/\bno-js\b/, 'js')
	})(document.documentElement);
</script>
<script type="text/javascript">
	var ajax_url = 'https://mdbootstrap.com/wp-load.php';
</script>
<script>
	(function(html) {
		html.className = html.className.replace(/\bno-js\b/, 'js')
	})(document.documentElement);
</script>
<script type="text/javascript">
	var ajax_url = 'https://mdbootstrap.com/wp-load.php';
</script>
<script>
	(function(html) {
		html.className = html.className.replace(/\bno-js\b/, 'js')
	})(document.documentElement);
</script>
<script type="text/javascript">
	var ajax_url = 'https://mdbootstrap.com/wp-load.php';
</script>
<link rel="stylesheet"
	href="${root }/resources/css/happyhouseCss.css?version=0.0.1">
<link rel="stylesheet"
	href="${root }/resources/css/myCss.css?version=0.0.8">

<!-- Vue -->
<link href="css/app.112cd1e1.css" rel="preload" as="style">
<link href="js/app.e78a1a08.js" rel="preload" as="script">
<link href="js/chunk-vendors.8744f4d7.js" rel="preload" as="script">
<link href="css/app.112cd1e1.css" rel="stylesheet">


</body>
</html>
</head>
<body>
	<%@ include file="./include/header.jsp"%>


	<section class="main-container">
		<div class="container">
			<div id="app"></div>
		</div>
	</section>


	<%@ include file="./include/footer.jsp"%>

	<script src="js/chunk-vendors.8744f4d7.js"></script>
	<script src="js/app.e78a1a08.js"></script>

</body>
</html>