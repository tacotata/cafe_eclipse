<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- css  -->
<link href="/css/default.css" rel="stylesheet" type="text/css" media="all"> 
<link href="/css/tablet.css" rel="stylesheet" type="text/css" media="all">
<link href="/css/pc.css" rel="stylesheet" type="text/css" media="all">           
	
	<footer id="footer-menu">
		<ul>
			<ul class="footer-menu__sns">
				<li><a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook-square"
						style="color: #3b5998;"></i></a></li>
				<li><a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram-square"
						style="color: #BE3681;"></i></a></li>
				<li><a href="https://www.youtube.com" target="_blank"><i class="fab fa-youtube"
						style="color: #c4302b;"></i></a></li>
				<li><a href="https://www.twitter.com" target="_blank"><i class="fab fa-twitter-square"
						style="color: #00acee;"></i></a></li>
			</ul>
			<ul class="footer-menu__info">
				<li><strong>(주) CAFE </strong></li>
				<li><strong>대표번호: 1111-1111</strong></li>
				<li><strong>주소: 서울특별시 동래구 대연동</strong></li>

			</ul>
			<ul class="footer-menu__terms">
				<li><a href="">개인정보처리방침</a></li>
				<li>|</li>
				<li><a href="">서비스이용약관</a></li>
				<li>|</li>
				<li><a href="">멤버십이용약관</a></li>
			</ul>
		</ul>
		<c:if test="${id eq 'admin'}">
		<ul class="footer-menu__terms admin">
				<li><a href="/cafe/insertMenu">메뉴등록</a></li>
				<li>|</li>
				<li><a href="/board/noticeForm">공지사항 글쓰기</a></li>
				<li>|</li>
				<!-- <li><a href="/board/cs">cs 게시판</a></li>
				<li>|</li> -->
				<li><a href="/cafe/insertStore">매장등록</a></li>
			</ul>
			</c:if>
	</footer>
</body>
</html>