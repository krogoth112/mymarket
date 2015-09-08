<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/main.css" type="text/css">

</head>
<body class="joinform">
<div class="container">
	<form class="form-horizontal">
	  <fieldset>
	    <legend>회원가입</legend>
	    <div class="form-group">
	      <label for="inputEmail" class="col-lg-2 control-label">이메일ID</label>
	      <div class="col-lg-10">
	        <input type="text" class="form-control" id="inputEmail" placeholder="Email">
	      </div>
	    </div>
	     <div class="form-group">
	      <label for="inputEmail" class="col-lg-2 control-label">중복체크</label>
	      <div class="col-lg-10">
	        <input type="button" class="btn btn-primary" value="중복체크">
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
	      <div class="col-lg-10">
	        <input type="password" class="form-control" id="inputPassword" placeholder="Password">
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="confirmPassword" class="col-lg-2 control-label">비밀번호확인</label>
	      <div class="col-lg-10">
	        <input type="password" class="form-control" id="inputPassword" placeholder="Password">
	      </div>
	    </div>
	      <div class="form-group">
	      <label for="inputName" class="col-lg-2 control-label">이름</label>
	      <div class="col-lg-10">
	        <input type="text" class="form-control" id="inputName" placeholder="Name">
	      </div>
	    </div>
	    <div class="form-group">
	      <div class="col-lg-10 col-lg-offset-2">
	        <button type="reset" class="btn btn-default">취소</button>
	        <button type="submit" class="btn btn-primary">확인</button>
	      </div>
	    </div>
	  </fieldset>
	</form>
</div>
</body>
</html>