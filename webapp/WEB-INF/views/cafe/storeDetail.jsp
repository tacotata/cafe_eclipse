<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>storeDetail</title>
<style>

.wrap {    
    padding: 8% 10% 15%;    
}

.store-name {
    font-size: 24px;
    padding-top: 2%;
    padding-bottom: 8%;
}

.store-view__img {
    display: inline-block;
    width: 50%;  
    display: none;
}

.store-view__img img {
    width: 100%;
}

#storeDetail__list ul {
    padding: .3rem;
}

#storeDetail__list li {
    text-align: left;
    margin: 0;
    font-size: .8rem;
    margin-bottom: 3%;    
}

#storeDetail__list strong {
    font-size: 1rem;
    border-bottom: 2px solid #de8971;
    color: #929292;
}

#storeDetail__list ul  li:last-child{
    padding-top: .3rem;
}

.storeDetail-btn__box {
    text-align: right;
   
}

.storeDetail__btn {
    display:inline- block;
    border: solid 1px #de8971;
    width: 4.375rem;
    height: 1.775rem;   
    font-size: 0.813rem; 
    line-height: 1.575rem;
    text-align: center;    
    background: #de8971;
    color: #fff;
}


/* 태블릿  768*/
@media all and (min-width:768px) {


}

/* pc  960~1024*/
@media all and (min-width:960px) {

.store-view__wrap {
    padding: 0% 5% 0%;
}

.store-view__img { 
    display: block;
    margin-right:30px ;
}

.store-name{   
    font-size: 3.2rem;
}

.store-view {
    display: flex; 
}

#storeDetail__list {
    margin-top: .8rem;
    margin-left: 3rem;  
}

}
</style>
</head>
<body>
<div id="container">
<%-- header 영역 --%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   <div class="wrap">
        <div id="storeDetail">
            <div class="storeDetail__wrap">                
                <div class="store-view__wrap">
                    <div class="store-name">
                    <p>${storeVo.storeName}</p>
                    </div>                    
                    <div class="store-view">
                    <div class="store-view__img">
                        <img src="/upload/${ storeVo.storeImg }"  alt="매장">
                    </div>
                    <div class="store-view__info">
                        <ul id="storeDetail__list">
        
                                    <ul>
                                        <li><strong>매장명</strong></li>
                                        <li>${ storeVo.storeName }</li>
                                    </ul>
                                    <ul>
                                        <li><strong>주소</strong></li>
                                        <li>${storeVo.storeAddress}</li>
                                    </ul>
                                    <ul>
                                        <li><strong>전화번호</strong></li>
                                        <li>${storeVo.storeTel}</li>                                
                                    </ul>
                                    <ul>
                                        <li><strong>영업시간</strong></li>
                                        <li>${storeVo.storeTime}</li>                                
                                    </ul>
                                    <ul>
                                        <li><strong>매장서비스</strong></li>
                                        <li>${storeVo.storeService}</li>
                                </ul>
                        </ul>
                </div>
            </div>
                <div class="storeDetail-btn__box">
                    <button class="storeDetail__btn" onclick="location.href ='/cafe/store?pageNum=${ pageNum }'">목록</button>
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