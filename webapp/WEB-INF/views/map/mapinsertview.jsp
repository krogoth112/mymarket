<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


<input type="button" value="파일찾기">

<input type="button" value="등록"><br/>
<textarea rows="3" cols="100" name="memo"></textarea><br/>
가격 <input type="text" name="price">원<br/>
제목 <input type="text" name="title"><br/>
내용 <textarea rows="3" cols="100"></textarea><br/>

<br/>
<input type="hidden" value="${lat}">
<input type="hidden" value="${lng}">

<input type="submit" value="완료">
<a href="/map"><input type="button"  value="취소"></a><br/>

</form>
</body>
</html>