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
			<div id="board">
				<form class="board-form" method="post" action="/board/write"
					enctype="multipart/form-data">
					<table class="tbl-ex">
						<tr>
							<input type="hidden" name="no" value="${authUser.no}">
							<input type="hidden" name="name" value="${authUser.name}">
							<th colspan="2">글쓰기</th>
						</tr>
						<tr>
							<td class="label">제목</td>
							<td><input type="text" name="title" value=""></td>
						</tr>
						<tr>
							<td class="label">내용</td>
							<td><textarea id="content" name="content"></textarea></td>
						</tr>
					</table>
					<input type="file" name="file"> <br />
					<br />
					<div class="bottom">
						<a href="board">취소</a> <input type="submit" value="등록">
					</div>
				</form>

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
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="title" name="title" class="wdp_90"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text"><textarea rows="20"
							cols="100" title="내용" id="content" name="content"></textarea></td>
				</tr>
			</tbody>
		</table>
		<input type="file" name="file">
		<br/><br/>
		<a href="#this" class="btn" id="write">작성하기</a> <a href="#this"
			class="btn" id="list">목록으로</a>
	</form>

	<%@ include file="/WEB-INF/views/include/include-body.jspf"%>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openBoardList();
            });
             
            $("#write").on("click", function(e){ //작성하기 버튼
                e.preventDefault();
                fn_insertBoard();
            });
        });
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/board/view/1'/>");
            comSubmit.submit();
        }
         
        function fn_insertBoard(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/board/write/' />");
            comSubmit.submit();
        }
    </script>
</body>
</html>