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
    
<title>CAFE</title>
<style>
/*slide*/
#slide {
    width: 100%;
    height: 610px;
    position: relative;
    overflow: hidden;
}

#slide__imgs {
    width: 100%;
    position: absolute;
    object-fit: cover;
    height: 100%;
}

#slide__imgs >  a> img {
    width: 100%;
    display: flex;
    height: 100%;
    object-fit: cover;
}

#slide__imgs div {
    position: absolute;
    top: 40%;
    display: none;    
    font-size: 2rem;
    opacity: .5;
    color: #fff;
}

 #prev {
    left: 0;
}

#next {
    right: 0;
} 

#slide__imgs:hover div{
    display: block;
    cursor: pointer;
}

 #slide__imgs button:focus {
    outline: 0;
}
 
/* section join */

#main-join {
    background: rgba(143, 188, 143, .6);
    text-align: center;
    padding: 18% 8%;
    color: #929292;  
} 

#logo.main-join__logo {
  pointer-events: none;
  display: inline-block;
  padding-top: 0;
}

.main-join__text h2 {
    text-align: center;
    margin-bottom: 5% ;
    font-size: 1.4rem;
    letter-spacing: .2rem;
}

.main-join__text  p {
    line-height: 2;
    font-size: .82rem;
    margin-bottom: 5% ;
}

.main-join__text  p  strong{
    font-size: 1rem;   
}

#main-btn a  {
    box-sizing: border-box;   
    display: inline-block;
    height: 40px;
    line-height: 36px;  
    padding-left:14.88095238095238% ;    
    padding-right: 14.88095238095238%; 
    font-size: .82rem;
    border: solid 1px  #de8971;
    color: #fff;
    border-radius: 4px;  
    background: #de8971;   
} 


#main-btn a:hover  {
	text-decoration: underline;
}

#main-btn .main-join__btn--login {
    background:none;
    border: solid 1px  #959595;
}

.main-join__text {
    margin: 4% 0;
}

/* section introduce */

#main-introduce {
    position: relative;   
    flex-direction: row; */
    width:100%;
    margin: 0 auto;
}

.main-introduce__img  img{
    width: 100%;   
    height: 600px;
    object-fit: cover;
    vertical-align: bottom;   
}

.main-introduce__btn {   
    margin-top: 35px;    
}

#main-introduce img {    
    position: relative;
}

.main-introduce__des {
    text-align: center;
    width: 80%;
    height: 80%;
    position: absolute;
    top:10%;
    right: 8%;
    margin: 10px; 
    display: inline-block;
    border: 3px solid #ffe9d6;
    background: rgba(255, 255, 255, 0.3);
    font-weight: bold;   
}

.main-introduce__des--up h2{
    font-size:4rem;   
}

.main-introduce__des--up p {
    letter-spacing: 1.5px;
    font-size:1.1rem ;
}

.main-introduce__des--up {
    margin-bottom: 30px ;
    line-height: 1.2;
    margin-top: 75px;
}

.main-introduce__des p {  
    line-height: 1.5;
}
/* section menu */

#main-menu  li {
    position: relative;   
    width: 100%;   
    text-align: center;
    padding:  3%;
    background: rgba(143, 188, 143, 0.6);  
}
 
#main-menu li img {   
    width: 200px;
    height: 200px;
    line-height: 200px;
    font-size: 70px;
    margin: auto;
    border-radius: 50%;  
     
}

#main-menu li span:hover,  #main-menu li img:hover {  
       transform:scale(1.1);     
       transition : transform 1s       
}




#main-menu ul li  span {    
    position: absolute;   
    right:38%;
    top:43%;
    font-size: 2.3rem;    
}

/* section store */

#main-store {  
    background: #ffe9d6;
    color: #929292;
    text-align: center;   
}

.main-store__img img {  
    vertical-align: bottom; 
    width: 100%; 
}

.main-store__des {   
  line-height: 1.5;
   padding: 3%;   
}

.main-store__des h2 {
    margin-top: 5%;
    font-size: 1.4rem;   
}

.main-store__des p {
    font-size: .86rem;
    padding: 3% 2%;
    line-height: 1.5rem;
}

.main-store__btn {
    margin: 2% 0 5% ;
}

.arrow-up  {
    display: inline-block;
    font-size: 2rem;
    width: 50px;
    height: 50px;
    background:rgba(255, 255, 255, 0.6);
    line-height: 20px;
    border-radius: 50%;
    border: none;
    color:#de8971 ;
    position: fixed;
    bottom:30px;
    right: 12px;
      opacity: 0; 
}

.arrow-up.visible {
    opacity: 1; 
    pointer-events: auto;
    
}

/* 태블릿  768*/
@media all and (min-width:768px) {

#main-menu  ul{
    display: flex;
}

#main-join {
    padding: 8% 8%;
}
}
/* pc  960~1024*/
@media all and (min-width:960px) {

#main-join {
   padding:0 19% 2% 21%;      
   align-items: center;
   font-size: 1.5rem;
   justify-content: center;
 /*   border: 40px solid  wheat; */
   box-sizing: border-box;
  }

  #logo.main-join__logo {
       margin: 0 auto;
       padding: 36px;
  }
   .main-join__cont {
   padding:3% 8% 5% 8%;
   border: 3px solid ;
   }

   .main-join__text h2 {
   font-size: 2rem;
   }
   
   .main-join__text p  strong {
       font-size: 1.5rem;
   }

   .main-join__text  p  {
   font-size: 1.3rem;
   margin-bottom: 0;
   }
   
   #main-store {
       align-items: center;
       display: flex;
       height:100%;
   }


   .main-store__img  img {
       /* border: 40px solid wheat; */
       height:700px;        
       object-fit: cover;        
   }

   .main-store__des {
   border: 40px solid  #de8971;
   background: rgba(255, 255, 255, 0.3);
   width:31%;
   margin: 0 auto;
   }

	
}
</style>
</head>

<body>
 <div id="container">
	<%-- header 영역 --%>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<div id="slide">
		<div id="slide__imgs">
		<a href="/cafe/introduce"><img src="img/slide/slide1.jpg" alt="회사소개"></a>
		<a href="/cafe/store"><img src="img/slide/coffee2.jpg" alt="매장찾기"></a>
		<a href="/cafe/new"><img src="img/slide/slide3.jpg" alt="신메뉴"></a>
			<div id="prev">◀</div>
			<div id="next">▶</div>
		</div>
	</div>
	
	<div class="main__wrap">
		<main id="main">
			<section id=main-join>
				<div id="logo" class="main-join__logo">
					<a href=""><i class="fas fa-coffee"></i></a>
					<p>CAFE</p>
				</div>
					<c:choose>
		<c:when test="${ not empty id }">
				<div class="main-join__cont">
					<div class="main-join__text">
						<strong><h2>CAFE만의 특별한 혜택</h2></strong>
						<p>
							<strong>${ id }님 안녕하세요!</strong> <br>  나만의 리워드 및 쿠폰을 확인해보세요. <br>
		<!-- 					<strong>CAFE 회원이 아니세요?</strong> <br> 가입을 통해 리워드 혜택을 즐기세요. -->
						</p>
					</div>
					<div id="main-btn" class="main-join__btn">
						<a href="/member/mypage">My cafe</a><!--  <a class="main-join__btn--login" href="/member/login">로그인</a> -->
					</div>
				</div>
						</c:when>
						<c:otherwise>
						<div class="main-join__cont">
					<div class="main-join__text">
						<strong><h2>CAFE만의 특별한 혜택</h2></strong>
						<p>
							<strong>CAFE 회원세요?</strong> <br> 로그인을 통해 나만의 리워드를 확인해보세요. <br>
							<strong>CAFE 회원이 아니세요?</strong> <br> 가입을 통해 리워드 혜택을 즐기세요.
						</p>
					</div>
					<div id="main-btn" class="main-join__btn">
						<a href="/member/join">회원가입</a> <a class="main-join__btn--login" href="/member/login">로그인</a>
					</div>
				</div>
					</c:otherwise>
		</c:choose>
				
			</section>
			<section id="main-introduce">
				<div class="main-introduce__img">
					<img src="img/main/introduce.jpg" alt="회사소개">
				</div>
				<div class="main-introduce__des">
					<div class="main-introduce__des--up">
						<strong><h2>CAFE</h2></strong>
						<p>SPECIALTY COFFEE</p>
					</div>
					<p>
						The core of CAFE <br> is the qualities of <br> materials
						and barista
					</p>


					<div id="main-btn" class="main-introduce__btn">
						<a href="/cafe/introduce">자세히 보기 </a>

					</div>
				</div>
			</section>
			<section id="main-menu">
				<ul>
					<li><a class="main-menu__img"  href="/cafe/new"> <img src="img/main/new.jpg"
							alt="신제품"> <span>NEW</span>
					</a></li>
					<li><a class="main-menu__img"   href="/cafe/best"> <img
							src="img/main/best.jpg" alt="인기메뉴"> <span>BEST</span>
					</a></li>
					<li><a class="main-menu__img"   href="/cafe/menu"> <img
							src="img/main/menu.jpg" alt="메뉴"> <span>MENU</span>
					</a></li>
				</ul>
			</section>
			<section id="main-store">
				<div class="main-store__img">
					<img src="img/main/store.jpg" alt="매장 찾기">
				</div>

				<div class="main-store__des">
					<h2>
						<strong>CAFE를 <br> 가까이에서
						</strong>경험해보세요.
					</h2>
					<p>
						고객님과 가장 가까이 있는 매장을 찾아보세요!<br> 함께해서 더 따뜻할 수 있는 <strong>소통
							공간</strong><br> <strong>CAFE</strong>에서 가치 있는 시간을 보내세요.
					</p>
					<div id="main-btn" class="main-store__btn">
						<a href="/cafe/store">매장찾기</a>
					</div>
				</div>
			</section>
		</main>
		<button class="arrow-up">
			<i class="fas fa-arrow-up" aria-hidden="true"></i>
		</button>
	</div>

	<%-- footer 영역 --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
</html>
<script>
const home = document.querySelector('#slide')
//.getBoundingClientRect() 위치 알아내기
const homeHight = home.getBoundingClientRect().height
const arrowBtn = document.querySelector('.arrow-up')
console.log(homeHight)
console.log(window.scrollY)

document.addEventListener('scroll', () => {
if (window.scrollY > homeHight/2) {
  arrowBtn.classList.add('visible')
  console.log(arrowBtn)
} else {
  arrowBtn.classList.remove('visible')
   console.log(arrowBtn)
}
})

function scrollIntoView(selector) {
  const scrollTo = document.querySelector(selector)
  scrollTo.scrollIntoView({ behavior: 'smooth' })
}

arrowBtn.addEventListener('click', () => {
  scrollIntoView('#container')
})
</script>