<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- fontawesome  -->
<script src="https://kit.fontawesome.com/0b588c2a50.js"crossorigin="anonymous"></script>
<!-- reset.css  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css"
integrity="sha512-IJEbgDEF7OeKJRa0MY2PApnyJHRIsgzCveek4ec8VWQ+7KG3ZSKVNYa5xP/Gh0hVP0Mwb+gBsk+GwR3JQGhQNg=="
crossorigin="anonymous" />
<!-- css  -->
<link href="/css/default.css" rel="stylesheet" type="text/css" media="all"> 
<link href="/css/tablet.css" rel="stylesheet" type="text/css" media="all">
<link href="/css/pc.css" rel="stylesheet" type="text/css" media="all">           
<!-- js -->
<script defer src="/script/main.js"></script>
    
 <header>       
     <div class="header__top">
        <div id="logo">
            <a href="/"><i class="fas fa-coffee"></i></a>
            <p>CAFE</p>
        </div> 
        <ul id="nav-bar__icon" >
        	<c:choose>
        	<c:when test="${ not empty id }">
	        	<li><a href="/member/mypage"><i class="fas fa-user"></i></a></li>
	            <li><a href="/cafe/store"><i class="fas fa-map-marker-alt"></i></a></li>                
	            <li class="nav-bar__toggle"><i class="fas fa-bars"></i></li>
        	</c:when>
        	<c:otherwise>
	        	<li><a href="/member/login"><i class="fas fa-user"></i></a></li>
	            <li><a href="/cafe/store"><i class="fas fa-map-marker-alt"></i></a></li>                
	            <li class="nav-bar__toggle"><i class="fas fa-bars"></i></li>
        	</c:otherwise>
        	</c:choose>
            
        </ul>
       </div>
                      
        <nav>  
          <div class="nav-bar__box">
            <ul id="nav-bar__up">
	            <c:choose>
	            <c:when test="${ not empty id}">
	            	<li><a href="/member/logout">Sign out</a></li>
	                <li><a href="/member/mypage">My Cafe</a></li>
	                <li><a href="/cafe/order">Order</a></li>	              
	                <li><a href="/board/csForm">Customer Service</a></li>
	            </c:when>
	            <c:otherwise>
	            	<li><a href="/member/login">Sign In</a></li>
	                <li><a href="/member/login">My Cafe</a></li>
	                <li><a href="/member/login">Order</a></li>
	                <li><a href="/member/join">Join</a></li>
	                <li><a href="/member/login">Customer Service</a></li>
	            </c:otherwise>
	            </c:choose>    
            </ul>
            <ul id="nav-bar__down">
                <li>
                	<div class="sub-menu__toggle" ><span>CAFE &nbsp;<i class="fas fa-angle-down"></i></span></div>
               		<ul class="sub-menu">
                       <li><a href="/cafe/introduce">CAFE 소개</a></li>
                   </ul>
                </li>    
                <li>
                	<div class="sub-menu__toggle" ><span>MENU &nbsp;<i class="fas fa-angle-down"></i></span></div>
                    <ul class="sub-menu">
                        <li><a href="/cafe/new">신제품</a></li>
                        <li><a href="/cafe/best">인기 메뉴</a></li>
                        <li><a href="/cafe/menu">메뉴</a></li>
                   	</ul>
                </li>    
                <li>
                	<div class="sub-menu__toggle" ><span>STORE &nbsp;<i class="fas fa-angle-down"></i></span></div>
                    <ul class="sub-menu">
                        <li><a href="/cafe/store">매장 찾기</a></li>                       
                    </ul>
                </li>    
                <li>
                	<div class="sub-menu__toggle" ><span>NEWS &nbsp;<i class="fas fa-angle-down"></i></span></div>
                     <ul class="sub-menu">
                       <c:choose>
	            		<c:when test="${ not empty id}">
	                        <li><a href="/board/csForm">고객의 소리</a></li>
	                        <li><a href="/board/notice">공지사항</a></li>
                     </c:when>
	            	<c:otherwise>
	             			<li><a href="/member/login">고객의 소리</a></li>
                       		<li><a href="/board/notice">공지사항</a></li>
                     </c:otherwise>
	            </c:choose>    
                    </ul>
                </li>     
            </ul>
        </div>
      </nav>   
    </header>
    
    
    <script src="/script/jquery-1.6.1.min.js"></script>
<script>


$(document).ready(function(){
    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".sub-menu__toggle").click(function(){
        var submenu = $(this).next("ul");

        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
            submenu.show();
        }
    });
});


</script>