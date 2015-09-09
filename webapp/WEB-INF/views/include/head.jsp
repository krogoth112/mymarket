<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<nav class="navbar navbar-default navbar-fixed-top" >
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><strong id="my">My</strong>Market</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <form class="navbar-form navbar-left navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="상품검색창입니다.">
        </div>
        <button type="submit" class="btn btn-default">검색</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">메뉴 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">찜상품</a></li>
            <li><a href="#">알림</a></li>
            <li class="divider"></li>
            <li><a href="#">공지사항</a></li>
            <li><a href="#">이벤트</a></li>
            <li><a href="#">자유게시판</a></li>
            <li><a href="#">문의 제안 신고</a></li>
            <li class="divider"></li>
            <li><a href="#">개인정보수정</a></li>
            <li><a href="#">회원탈퇴</a></li>
            <li class="divider"></li>
            <li><a href="#">버전정보</a></li>
            <li><a href="#">약관 및 개인정보 취급방침</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">로그아웃 <span class="sr-only">(current)</span></a></li>
        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
        <li><a href="#">상품등록</a></li>
      </ul>
    </div>
  </div>
</nav>

