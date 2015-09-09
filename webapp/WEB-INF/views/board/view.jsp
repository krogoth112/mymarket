<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<div id="header">
			<c:import url="/WEB-INF/views/include/header.jsp">
			</c:import>
		</div>
		<div id="content">
			<div id="board" class="board-form" align="left">
				<table class="tbl-ex">
					<tr>
						<th colspan="2"></th>
					</tr>
					<tr>
						<td class="label" align="left" style="width: 100px">제목</td>
						<td>${vo.title}</td>
					</tr>
					<tr>
						<td class="label">내용</td>
						<td>
							<div class="view-content">${vo.content}</div>
						</td>
					</tr>
				</table>
				<div>
					<h3>댓글목록</h3>


					<c:forEach var="reply" items="${replyList}">
						<table class="tb-reply">
							<tr>
								<c:if test="${reply.depth==0}">
									<td><img src="/assets/css/images/gc_img.gif"></td>
								</c:if>
								<td class="" style="padding-left:${reply.depth*30}px"><input
									type="hidden" name="articleNo" value=""><td><img src="/assets/css/images/gc_img.gif">
								${reply.userName}
								<td>${reply.regDate}</td>
								<td><c:if test="${reply.userNo == authUser.no }">
										<a href="/board/deletereply/${reply.no}?articleNo=${reply.boardNo}"><img src="/assets/images/recycle.png"></a>
									</c:if> 
									<c:if test="${not empty authUser}">
										<td><a href="/board/replyreplyform?replyNo=${reply.no}&articleNo=${reply.boardNo}">답글</a></td>
									</c:if>
							</tr>
						</table>
						<div id="junki" style="padding-left:${reply.depth*30}px">${reply.content}
						</div>


					</c:forEach>
				</div>
				<form class="board-reply_form" action="/board/addreply/${vo.no}"
					method="post">
					<table>
						<tr>
							<td><textarea cols="75" rows="10" maxlength="1000"
									name="content"></textarea></td>
						</tr>
						<tr>
							<td align="right"><input type="submit" value="답글"></td>
						</tr>
					</table>
				</form>
				<div class="bottom">
					<a href="/board/1">글목록</a>
					<c:if test="${vo.userNo==authUser.no}">
						<a href="/board/modifyform/${no}">글수정</a>
					</c:if>
				</div>
			</div>

		</div>
		<div id="navigation">
			<c:import url="/WEB-INF/views/include/navigation.jsp">
				<c:param name="pageName" value="board" />
			</c:import>
		</div>
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp">
			</c:import>
		</div>
	</div>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/include/include-header.jspf"%>
</head>
<body>
	<table class="board_view">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${vo.no }</td>
				<th scope="row">조회수</th>
				<td>${vo.viewCnt }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${vo.userName }</td>
				<th scope="row">작성시간</th>
				<td>${vo.regDate }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${vo.title }</td>
			</tr>
			<tr>
				<td colspan="4">${vo.content }</td>
			</tr>
			<tr>
				<th scope="row">첨부파일</th>
				<td colspan="3">
				<c:forEach var="row" items="${list }">
						<input type="hidden" id="no" value="${row.no }">
						<a href="#this" name="file">${row.ORIGINAL_FILE_NAME }</a> 
                        (${row.FILE_SIZE }kb)
                </c:forEach></td>
			</tr>
		</tbody>
	</table>
	<br />
	<div>
		<h3>총 ${vo.replyCnt}개 댓글───────────────────────</h3>
		<c:forEach var="reply" items="${replyList}">
			<table class="tb-reply">
				<tr>
					<%-- <c:if test="${reply.depth==0}">
						<td><img src="/assets/css/images/gc_img.gif"></td>
					</c:if> --%>
					<td style="padding-left:${reply.depth*30}px"><input
						type="hidden" name="articleNo" value="">
					<td><img src="/assets/css/images/gc_img.gif">
						${reply.userName}
					<td>${reply.regDate}</td>
					<td><c:if test="${reply.userNo == authUser.no }">
							<a
								href="/board/deletereply/${reply.no}?articleNo=${reply.boardNo}"><img
								src="/assets/images/recycle.png"></a>
						</c:if> <c:if test="${not empty authUser}">
							<td><a
								href="/board/replyreplyform?replyNo=${reply.no}&articleNo=${reply.boardNo}">답글</a></td>
						</c:if>
				</tr>
			</table>
			<div id="junki" style="padding-left:${reply.depth*30}px">${reply.content}
			</div>


		</c:forEach>
	</div>
	<form class="board-reply_form" action="/board/addreply/${vo.no}"
		method="post">
		<table>
			<tr>
				<td><textarea cols="75" rows="10" maxlength="1000"
						name="content"></textarea></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" class="btn" value="답글"></td>
			</tr>
		</table>
	</form>


	<a href="/board/1" class="btn">목록으로</a>
	<!-- <a href="/board/1" class="btn" id="list">목록으로</a> -->
	<a href="#this" class="btn" id="update">수정하기</a>

	<%@ include file="/WEB-INF/views/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});

			$("#update").on("click", function(e) { //수정하기 버튼
				e.preventDefault();
				fn_openBoardUpdate();
			});

			$("a[name='file']").on("click", function(e) { //파일 이름
				e.preventDefault();
			});
		});

		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/1' />");
			comSubmit.submit();
		}

		function fn_openBoardUpdate() {
			var no = "${vo.no}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/modify/' />");
			comSubmit.addParam("no", no);
			comSubmit.submit();
		}
	</script>

</body>
</html>