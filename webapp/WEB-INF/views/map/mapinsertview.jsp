<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
상품등록<br/>
이미지 등록<br/>
<h1>파일 업로드 예제</h1>
<form method="post" action="upload" enctype="multipart/form-data">
	<label>email:</label>
	<input type="text" name="email" value="kickscar@gmail.com">
	<br><br>
	
	<label>파일1:</label>
	<input type="file" name="file1">
	<br><br>
	
	<label>파일2:</label>
	<input type="file" name="file2">
	<br><br>
	
	<label>파일3:</label>
	<input type="file" name="file3">
	<br><br>
	
	<br>
	<input type="submit" value="upload">
	<br>
<div class="result-images">
		<c:if test="${not empty productImageUrl1 }">
			<img src="/fileupload/${productImageUrl1 }" style="width:150px"><br>
		</c:if>
		
		<c:if test="${not empty productImageUrl2 }">
			<img src="/fileupload/${productImageUrl2 }" style="width:150px"><br>
		</c:if>
		
		<c:if test="${not empty productImageUrl3 }">
			<img src="/fileupload/${productImageUrl3 }" style="width:150px"><br>
		</c:if>
		
	</div>
	
<!-- </form>
<form method="post" action="upload1">
 -->

<input type="button" value="파일찾기">

<input type="button" value="등록"><br/>
<textarea rows="3" cols="100" name="memo"></textarea><br/>
가격 <input type="text" name="price">원<br/>
제목 <input type="text" name="title"><br/>
내용 <textarea rows="3" cols="100" name="content"></textarea><br/>
태그<input type="text" name="tag"><br/>

tradeCategory
<!-- <input type="text" name="tradeCategory" value="trade_category 중고 신품 "> -->
<select name="tradeCategory">
<option value="중고" selected="selected">중고</option>
<option value="신품">신품</option>
</select><br/>

itemCondition
<!-- <input type="text" name="itemCondition" value="item_condition 판매 구매 "> -->
<select name="itemCondition">
<option value="판매" selected="selected">판매</option>
<option value="구매">구매</option>
</select><br/>

shipingFee
<!-- <input type="text" name="shipingFee" value="shopingFee 택배비"><br/> -->
<select name="shipingFee">
<option value="포함" selected="selected">포함</option>
<option value="미포함">미포함</option>
</select><br/>

<br/>
<input type="text" name="userNo" value="userNo 히든으로 가져갈꺼임"><br/>
<!-- <input type="text" name="email" value="email 히든으로 가져갈꺼임"><br/> -->
<input type="hidden" name="location" value="${latlng}">

<input type="submit" value="완료">
<a href="/map"><input type="button"  value="취소"></a><br/>

</form>


	
</body>
</html>