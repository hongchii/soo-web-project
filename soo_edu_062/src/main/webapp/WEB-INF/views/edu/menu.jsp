<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>SOO EDU</title>
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-ui.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />

	</head>
<body>
	<div class="logo">
					<a href="/index.do"><img
						src="${pageContext.request.contextPath}/resources/img/common/logo.png" /></a>
				</div>
				<div class="user">
				<!-- 로그인 -->
					
					<c:choose>
						<c:when test="${sessionScope.email eq null }">
							<form name="loginForm" action="/user/login.do" method="post">
								<div class="login_wrap">
									<div class="input_wrap">
										<label for="id">id</label>
										<input type="text" id="id" name="soo_user_mail" placeholder="id"/>
										<label for="pw">pw</label>
										<input type="password" id="pw" name="soo_user_pw" placeholder="pw"/> 	
									</div>
										<button type="submit">로그인</button>
								</div>	
         					<a href="/user/register.do">· 회원가입</a>
         					<a href="#none">· ID/PW 찾기</a>
    						</form>
    					</c:when>
    				
						<c:when test="${sessionScope.email ne null}">
							<div class="user_status">
								<div class="img">
									<img src="${pageContext.request.contextPath}/resources/img/common/user.png" />	
								</div>
								<div class="info">
									<p>환영합니다!</p>
									<%-- <p class="name"><span>${uservo.soo_user_name }</span>님</p> --%>
									<p class="name"><span>${sessionScope.name }</span>님</p>
									<p>최근접속일 <span>2020.04.30 10:48</span></p>
								</div>
							</div> 
								<input  type="button" class= "header_btn"  value="로그아웃" onclick="location.href='/user/logout.do'">
						</c:when>
					</c:choose>
						<!--  //접속정보 -->				
					</div>
				<!-- 메뉴(활성화시 li태그에 클래스'on' 추가) -->
				<c:if test="${sessionScope.usertype eq '1' || sessionScope.usertype eq null}"> 
						<div class="menu">
							<ul>
								<li>
									<a href="/soo_project_board/Soo_Edu_Board_Notice_List.do">공지사항</a>
								</li>
								<li>
									<a href="#none">API</a>
									<ul class="depth">
										<li>
											<a href="/papago.do">파파고</a>
										</li>
										<li>
											<a href="/shop.rdo">카카오페이</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="#none">문의하기</a>
								</li>
								<li>
									<a href="#none">상품보기</a>
								</li>
								<li>
									<a href="#none">마이페이지</a>
								</li>
							</ul>
						</div>
					</c:if>
					
					<!-- 관리자로 로그인시 보이는 메뉴 -->
					<c:if test="${sessionScope.usertype eq '0' }"> 
					 	<div class="menu">
					 		<ul>
								<li>
									<a href="/soo_project_board/Soo_Edu_Board_Notice_List.do">공지사항</a>
								</li>
								
								<li>
									<a href="#none">상품관리</a>
								</li>
								<li>
									<a href="#none">고객관리</a>
								</li>
								
							</ul>
					 	
					 	</div>
					</c:if>
					
					<!-- //메뉴 -->
</body>
</html>