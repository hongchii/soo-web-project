<%@ page session="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<script type="text/javascript"
	src="../../resources/js/jquery-3.3.1.min.js"></script>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<head>

<title>board_list</title>

<style>
table {
	width: 100%;
	margin: 1% auto 2%;
	border: 1px solid #000;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #000;
	padding: 10px;
	cursor: pointer;
	text-align: center;
}

tbody>tr:hover {
	background-color: #c2f0ff;
}

a {
	text-decoration: none;
	color: #000;
}

button {
	float: right;
	background-color: #fff;
	boarder: 1px solid #000;
}

.button {
	background-color: rgb(139, 133, 133);
	border: 2px solid rgb(133, 129, 129);
	color: #fff;
	line-height: 50px;
}

.button:hover {
	background-color: #fff;
	border-color: #8c9397;
	color: #adbbc4;
}

.box {
	font-size: 18px;
	border: 4px dashed #bcbcbc;
	margin-top: 15px;
	font-style: inherit;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		//????????????????????? ??????
		$("#writeBtn").click(function() {
			location.href = "soo_project1_Board_write.do";
		});
	});
	
	
	/* //???????????? ????????????
	function printTime() {

		var clock = document.getElementById("clock"); // ????????? ?????? ??????
		var now = new Date(); // ????????????
		var nowTime = now.getFullYear() + "???" + (now.getMonth() + 1) + "???"
				+ now.getDate() + "???" + now.getHours() + "???" + now.getMinutes()
				+ "???";

		clock.innerHTML = nowTime; // ??????????????? ??????
		setTimeout("printTime()", 1000); // setTimeout(?????????????????????,??????) ?????????1?????? ?????? 1000
	}
	window.onload = function() { // ???????????? ???????????? ??????
		printTime();
	} */

</script>


	<script type="text/javascript">
		   $(document).ready(function(){
		      $("#LogoutBtn").on("click", function(){
		         location.href="/soo_project1_user/soo_project1_logout.do";
		      })
		      
		   })
		</script>

	
	 <script type="text/javascript">
		function linkPage(pageNo) {
			location.href = "/soo_project1_board/soo_project1_Board_list.do?pageNo="+ pageNo;
		}
	</script> 



</head>
<body>



	<!-- ???????????? ??????   ------------------------------------------------------------>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3" width="100%" height="100px">
				<div class="container">
					<div class="row">

						<!-- ???????????? ?????????????????? ------------------------------------->
						<c:if test="${sessionScope.loginSession.user_nick==null}">
							<form action="/soo_project1_user/soo_project1_user_login.do"
								name="login" method="post">

								<!-- ????????? ?????? ----------------------------------------------->
								<button type="button" class="btn btn-dark btn-sm btn-block mt-1"
									onclick="location.href='/soo_project1_user/soo_project1_user_login.do'">
									????????? ??????</button>

								<!-- ???????????? ?????? ----------------------------------------------->
								<button type="button" class="btn btn-dark btn-sm btn-block mt-1"
									onclick="location.href='/soo_project1_user/soo_project1_user_write.do'">????????????
									??????</button>
								<br />

							</form>
						</c:if>

						<!-- ???????????? ??????????????? ------------------------------------->
						<c:if test="${sessionScope.loginSession.user_nick != null}">

							<div style="width: 350px">
								<button type="button" class="btn btn-dark btn-sm btn-block mt-1"
									onclick="location.href='/soo_project1_user/soo_project1_user_list.do'">???????????????
								</button>
								<button type="button"
									class="btn btn-dark btn-sm btn-block mt-1 " ID="LogoutBtn">LOGOUT
								</button>
							</div>
							<p></p>
							<div class="box" style="width: 350px">
								<dl>
									<dt>${sessionScope.loginSession.user_nick}???</dt>
									<dd>???????????????</dd>
									<dt>?????? ?????????</dt>
									<dd id="clock"></dd>
								</dl>
							</div>
						</c:if>

					</div>
				</div>
			</div>




			<div class="col-md-9" width="100%" height="100px">

				<div id="board">
					<table  border="1">
						<thead>
							<tr>
								<th>??????</th>
								<th>??????</th>
								<th>?????????</th>
								<th>?????????</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="boardList" items="${resultList}">
								<tr>
									<td><c:out value="${boardList.board_seq}"></c:out></td>
									<td><a
										href="/soo_project1_board/soo_project1_Board_view.do?board_seq=${boardList.board_seq}">
											<c:out value="${boardList.board_title}"></c:out>
									</a></td>
									<td><c:out value="${boardList.board_writer_name}"></c:out></td>
									<td><fmt:formatDate value="${boardList.board_reg_date}"
											pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>

			</div>

		</div>

		<div>
			<button type="button" id="writeBtn" class="button">?????????</button>
		</div>

		
		<div >
	</div>


	
		
		
	</div>



	<!-- ???????????? ???  ------------------------------------------------------------>



</body>


</body>
</html>
