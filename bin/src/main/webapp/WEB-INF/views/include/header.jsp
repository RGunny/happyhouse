<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<header>
	<nav class="navbar navbar-expand-sm row">
		<a href="${root}">
		<c:if test="${empty loginInfo}">
			<img src="${root}/resources/img/logo.png" id="logo" class="navbar-brand col-md-1" style="max-width: 100%">
		</c:if>
		<c:if test="${not empty loginInfo}">
			<img src="${root}/resources/img/logo.png" id="logo" class="navbar-brand col-md-1" style="width: 85%">
		</c:if>
		</a>
		<ul id="naviBar" class="navbar-nav col-md-9">
			<li class="nav-item active">
				<a href="searchHouse" class="nav-link font-black">집찾기</a>
			</li>
			<li class="nav-item active">
				<a href="goQna" class="nav-link font-black">게시판</a>
			</li>
			<li class="nav-item">
				<a href="interest"class="nav-link font-black">관심 목록</a>
			</li>
			<li class="nav-item">우리집 점수는?</li>
			<li class="nav-item">
				<a href="boardList" class="nav-link font-black">공지사항</a>
			</li>
		</ul>
		
		<c:if test="${empty loginInfo}">
			<div id="loginSignup" class="col-md-2">
				<span data-toggle="modal" data-target="#signup" class="modalSpan">회원가입</span>
				<div class="modal fade" id="signup">
					<div class="modal-dialog modal-l">
						<div class="modal-content">
							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">회원가입</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<div class="col-sm-11 col-md-offset-3">
									<form id="signupform" method="post" action="signUp">
										<div class="form-group">
											<label for="inputName">성명</label> 
											<input type="text" id="inputName" name="userName" class="form-control" placeholder="이름을 입력해 주세요">
										</div>
										<div class="form-group">
											<label for="inputID">ID</label>
											<input type="text" id="inputID" name="userId" class="form-control" placeholder="아이디를 입력해 주세요">
										</div>
										<div class="form-group">
											<label for="inputPassword">비밀번호</label>
											<input type="password" id="inputPassword" name="userPw" class="form-control" placeholder="비밀번호를 입력해주세요">
										</div>
										<div class="form-group">
											<label for="inputPasswordCheck">비밀번호 확인</label>
											<input type="password" id="inputPasswordCheck" class="form-control" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
										</div>
										<div class="form-group">
											<label for="inputEmail">이메일 주소</label>
											<input type="email" id="inputEmail" name="userEmail" class="form-control" placeholder="이메일 주소를 입력해주세요">
										</div>
										<div class="form-group">
											<label for="inputBTD">생년월일</label>
											<input type="date" class="form-control" id="inputBTD" name="userBirthday">
										</div>
										<div class="form-group">
											<label for="inputMobile">휴대폰 번호</label>
											<input type="tel" class="form-control" id="inputMobile" name="userPhone" placeholder="휴대폰번호를 입력해 주세요">
										</div>
										<div class="form-group">
											<label for="inputAddr">주소</label>
											<input type="text" class="form-control" id="inputAddr" name="userAddress" placeholder="주소를 입력해 주세요">
										</div>

										<div class="form-group">
											<label>약관 동의</label>
											<div data-toggle="buttons">
												<label class="btn btn-primary active"> 
													<span class="fa fa-check"></span> 
													<input id="agree" type="checkbox" autocomplete="off">
												</label> 
												<a href="#">이용약관</a>에 동의합니다.
											</div>
										</div>

										<div class="form-group text-center">
											<button type="submit" id="join-submit" class="btn btn-primary">
												회원가입 <i class="fa fa-check spaceLeft"></i>
											</button>
											<button type="submit" class="btn btn-warning">
												가입취소<i class="fa fa-times spaceLeft"></i>
											</button>
										</div>
									</form>
								</div>
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				
				<span data-toggle="modal" data-target="#elegantModalForm" class="modalSpan">로그인</span>
				<!-- Modal -->
				<div class="modal fade" id="elegantModalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<!--Content-->
						<div class="modal-content form-elegant">
							<!--Header-->
							<div class="modal-header text-center">
								<h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel">
									<strong>Sign in</strong>
								</h3>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<!--Body-->
							<div class="modal-body mx-4">
								<!--Body-->
								<form id="loginform" method="post" action="login">
									<div class="md-form mb-5">
										<input type="text" id="userid" name="userId"
											class="form-control validate" placeholder="id">
									</div>

									<div class="md-form pb-3">
										<input type="password" id="userpw" name="userPw"
											class="form-control validate" placeholder="password">
										<p class="font-small blue-text d-flex justify-content-end">
											Forgot <a href="FindIdPw.html" class="blue-text ml-1"> Password?</a>
										</p>
									</div>

									<div class="text-center mb-3">
										<button id="loginBtn"
											class="btn blue-gradient btn-block btn-rounded z-depth-1a">Sign in</button>
									</div>
								</form>
								<p class="font-small dark-grey-text text-right d-flex justify-content-center mb-3 pt-2"> or Sign in with:</p>

								<div class="row my-3 d-flex justify-content-center">
									<!--Facebook-->
									<button type="button" class="btn btn-white btn-rounded mr-md-3 z-depth-1a">
										<i class="fab fa-facebook-f text-center"></i>
									</button>
									<!--Twitter-->
									<button type="button" class="btn btn-white btn-rounded mr-md-3 z-depth-1a">
										<i class="fab fa-twitter"></i>
									</button>
									<!--Google +-->
									<button type="button" class="btn btn-white btn-rounded z-depth-1a">
										<i class="fab fa-google-plus-g"></i>
									</button>
								</div>
							</div>
							<!--Footer-->
							<div class="modal-footer mx-5 pt-3 mb-1">
								<p class="font-small grey-text d-flex justify-content-end">
									Not a member? <a href="#" class="blue-text ml-1"> Sign Up</a>
								</p>
							</div>
						</div>
						<!--/.Content-->
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${not empty loginInfo}">
			<li class="nav-item dropdown">
				<a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-toggle="dropdown"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings align-middle">
					<circle cx="12" cy="12" r="3"></circle>
					<path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
				</a>
				<a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown"> 
					<span class="text-dark">${loginInfo.userName}(${loginInfo.userId})님 환영합니다</span>
				</a>
				<div class="dropdown-menu dropdown-menu-right">
					<a class="dropdown-item" href="index">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home align-middle mr-2">
							<path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
							<polyline points="9 22 9 12 15 12 15 22"></polyline>
						</svg>main
					</a>
					<c:if test="${loginInfo.userId eq 'admin'}">
					<a class="dropdown-item" href="userinfo">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings align-middle mr-1">
							<circle cx="12" cy="12" r="3"></circle>
							<path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
						</svg> Settings
					</a>
					</c:if>
					<c:if test="${loginInfo.userId ne 'admin'}">
					<a class="dropdown-item" href="userinfo">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle mr-1">
							<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
							<circle cx="12" cy="7" r="4"></circle>
						</svg>Profile
					</a>
					</c:if>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="logout">Log out</a>
				</div>
			</li>
		</c:if>
	</nav>
	<hr>
</header>