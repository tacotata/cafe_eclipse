<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
<script defer src="script/main.js"></script>
<title>pwdSearch</title>
<style>

/* 모바일 320*/

.wrap {    
    padding: 8% 10% 15%;
    color: #929292;
}

.introduce__wrap {
   
    text-align: center;
}


.wrap__title h2{
    padding: 15px 0;    
    color: #929292;
    margin-bottom: 8%;
    font-size: 1.8rem; 
    text-align:left
    
}

.introduce__text--up h2 {
    font-size: 1.8rem;
    color: #de8971 ;    
} 

.introduce__text--up p{
    margin: 3% 0 5%;
    font-weight: bold;
    letter-spacing: .1rem;
}

.introduce__text--down {
    text-align: justify;
    line-height: 1.8;
    padding: 3% 0% 10%;
    font-size: .9rem;
}

.introduce-main {
    text-align: justify;
    line-height: 1.3;
}

.introduce-main li img {
    margin-top: 8%;
    width: 100%;
}

.introduce-main li p:nth-child(1) {
    padding: 8% 0;   
    color: #de8971;
    font-weight: bold;
    font-size: 1.2rem;    
    font-style: italic;
}

.introduce-main li p:nth-child(2) {
    line-height:1.5rem ;  
    padding: 0% 10% ;
    font-size: .9rem;      
}


/* 태블릿  768*/
@media all and (min-width:768px) {

.introduce ul {
    display: flex;
    flex-direction: row;      
}

.two ul {
    flex-direction: row-reverse;    
}

.introduce ul li:last-child {   
    padding:5.3989% 4.4389%;
    width: 60%;   
}

.one, .two {
    margin-bottom: 20%;
}

}

/* pc  960~1024*/
@media all and (min-width:960px) {
.introduce__wrap {
     padding: 0% 20% 0%;
    text-align: center;
}

.introduce__text--up h2 {
    font-size: 2.3rem;       
} 

.introduce__text--up p{
    margin: 2% 0 2%;       
    font-size: 1.3rem;
}

.introduce__text--down {        
    padding: 2% 9% 8%;
    font-size: 1.1rem;       
    line-height: 2;
}   

.introduce-main li p:nth-child(1){
    padding: 5% 0 ;          
    font-size: 1.5rem;   
}

.introduce-main li p:nth-child(2){
    line-height: 1.8;
    padding: 2% 10% 7%  ;
    font-size: 1rem;    
}

.introduce ul li:first-child {
    width: 60%;
}

.wrap__title h2 {
    font-size: 3.2rem;
    text-align:left;
}


}
</style>
</head>
<body>
<div id="container">
<%-- header 영역 --%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   <div class="wrap">
  <div id="introduce">
           
          
            <div class="introduce__wrap">
             <div class="wrap__title" >
                <span><h2>CAFE</h2></span>
                </div>
                <div class="introduce__text--up">
                <strong><h2>ABOUT CAFE</h2></strong>
                <p><strong>'작은 차이의 미학'</strong></p>
                </div>
                <div class="introduce__text--down">  
                    <p>오늘도 CAFE는 전세계의 커피 산지를 연구하고, 원두 본연의 맛을 살리기 위한 수많은 블랜딩을 개발하는 등 다양한
                        노력을 지속하고 있습니다. 커피가 주는 아름다움을 보다 많은 고객들이 즐길 수 있도록, 매 순간 의미 있는 작은 차이를
                        만들어가는 CAFE가 되겠습니다.오늘도 CAFE는 전세계의 커피 산지를 연구하고, 원두 본연의 맛을 살리기 위한 수많은 블랜딩을 개발하는 등 다양한
                        노력을 지속하고 있습니다.</p>
                </div>
                <div class="introduce-main">
                    <div class="introduce one">
                        <ul>
                            <li ><img src="/img/introduce1.png" alt="회사소개"></li>
                            <li><p>커피를 알아가는 즐거움</p>
                                <p>오늘도 CAFE는 전세계의 커피 산지를 연구하고, 원두 본연의 맛을 살리기 위한 수많은 블랜딩을 개발하는 등 다양한
                                    노력을 지속하고 있습니다. 커피가 주는 아름다움을 보다 많은 고객들이 즐길 수 있도록, 매 순간 의미 있는 작은 차이를
                                    만들어가는 CAFE가 되겠습니다</p></li>
                        </ul>
                    </div>
                    <div class="introduce two">
                        <ul>
                            <li  ><img src="/img/introduce2.png" alt="회사소개"></li>
                            <li  ><p>커피를 함께하는 즐거움</p>
                                <p>오늘도 CAFE는 전세계의 커피 산지를 연구하고, 원두 본연의 맛을 살리기 위한 수많은 블랜딩을 개발하는 등 다양한
                                    노력을 지속하고 있습니다. 커피가 주는 아름다움을 보다 많은 고객들이 즐길 수 있도록, 매 순간 의미 있는 작은 차이를
                                    만들어가는 CAFE가 되겠습니다.</p></li>
                        </ul>
                    </div>
                    <div class="introduce three">
                        <ul>
                            <li><img src="/img/introduce3.png" alt="회사소개"></li>
                            <li><p>커피를 만드는 즐거움</p>
                                <p>오늘도 CAFE는 전세계의 커피 산지를 연구하고, 원두 본연의 맛을 살리기 위한 수많은 블랜딩을 개발하는 등 다양한
                                    노력을 지속하고 있습니다. 커피가 주는 아름다움을 보다 많은 고객들이 즐길 수 있도록, 매 순간 의미 있는 작은 차이를
                                    만들어가는 CAFE가 되겠습니다.</p></li>
                        </ul>
                    </div>
                 </div>
            </div>
        </div>
    </div>
    </div>
<%-- footer 영역 --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</div>
</body>
</html>