<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>menuDetail</title>
<style>

/* 모바일 320*/

.wrap {    
    padding: 8% 10% 15%;
    color: #929292;
}

.menuDetail__wrap {  
    color: #929292;
}

.menu-view__img {
    width: 100%;
    margin-top:5%;
}

.menu-view__img img { 
    width: 100%;
}

.menu-view__wrap {
    display:flex;
    flex-direction: column;
}
.menu-view__info--text{   
    order:-2;
    position: relative;
}

.menu-order__btn { 
    order: -1;
}

.menu-view__info--text p {
    margin-top: 4%;
    line-height: 1.5;
}

.menu-view__info--text strong {
    font-size: 24px;
}

.menu-view__info--text div {
    font-size: 14px;
    color: #929292;
    font-weight: initial;
    padding-top: 2%;
    padding-bottom: 8%;
    border-bottom: 2px solid;
}

.btn {
	display:flex;
}

.btn button {
    margin: 7% 2% 3%;
    box-sizing: border-box;
    display: inline-block;
    width: 100%; 
    height: 40px;
    line-height: 30px;   
  /*   padding-left: 14.88095238095238%;
    padding-right: 14.88095238095238%;   */
    border: solid 1px #de8971;
    color: #fff;
    border-radius: 4px;  
    background: #de8971;   
   
}

.menu-view__info--content dl {
    display: flex;
    justify-content: space-between;
    padding:3% 0;
}

.menu-view__info--nutrition {
    font-size: 14px;
    padding: 10% 0 0 ; 
}

.menu-view__info--content{
    margin-top: 3%;
    padding-top: 5%;
    border-top: solid 1px;
}

/* 태블릿  768*/
@media all and (min-width:768px) {



.btn button:nth-child(1) {
    position: absolute;
    top: 185px;
    right:80px;
    width: 20%;
  /*   padding-left: 3%;
    padding-right: 3%; */
}

.btn button:nth-child(2){
	position: absolute;
    top: 135px;
    right:80px;
   width: 20%;

}

.menu-view__info--text p {
    margin-bottom: 5%;
}

}

/* pc  960~1024*/
@media all and (min-width:960px) {

.menu-view__wrap {
    display:initial;
}        

.menu-view__info--text{
    clear: both;
    order:initial;
    display: inline-block;
    width: 44%;
}

.menu-view__info--text div {
 	padding-bottom: 5%;
}


.menu-view__info--nutrition {
    clear: both;
    display: inline-block;
    padding-top: 3%;
    width: 44%;  
}    

/* .btn button {
    clear: both;
    position: initial;     
    width: 44%;
    margin: 0;
    margin-bottom: 1%;
}
 */

.btn button:nth-child(1) {
   clear: both;
    position: initial;     
    width: 37%;
    margin: 0;
    margin-bottom: 1%;
      margin-right: 3%;
}

.btn button:nth-child(2){
	clear: both;
    position: initial;     
    width: 37%;
    margin: 0;
    margin-bottom: 1%;
}


.menu-view__img  {   
    float: left; 
    margin-right: 60px;  
    width: 33%;
    margin-left:  60px;
}

.menu-view__img img  { 
    height: 320px;
}  

}

</style>
</head>
<body>
<div id="container">
<%-- header 영역 --%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
 <div class="wrap">
            <div id="menuDetail">
                <div class="menuDetail__wrap">                    
                    <div class="menu-view__wrap">
                        <div class="menu-view__img">
                            <img src="/upload/${ menuVo.itemImg }"  alt="커피">
                        </div>                        
                            <div class="menu-view__info--text">
                                <strong>${menuVo.itemNameKo }</strong>                                
                                
                                <div>${menuVo.itemNameEn }</div>
                                <p>${menuVo.itemDes }</p>
                            </div>
                           <c:choose>
							<c:when test="${ not empty id }">
	                            <div id ="menu-order__btn" class="btn" >                     
	                                <button onclick ="location.href='/cafe/order/ '">주문하기</button>
	                                <button onclick ="location.href='/user/wish?memberId=${id}&menuNum=${menuVo.num} '">나만의 음료 등록</button>
	                            </div>
                  			</c:when>
							<c:otherwise>
							<div id ="menu-order__btn" class="btn" > 					
                                <button onclick ="location.href='/member/login/ '">주문하기</button>
                                <button onclick ="location.href='/member/login/'">나만의 음료 등록</button>
							</div>
							</c:otherwise>
						</c:choose>
                            <div class="menu-view__info--nutrition">
                                <strong>제품 영양 정보</strong>
                                <div class="menu-view__info--content">
                                    <ul>
                                        <li>
                                            <dl>
                                                <dt>1회 제공량 (Kcal)</dt>
                                                <dd>${menuVo.itemKcal }</dd>
                                                  
                                            </dl>
                                        </li>
                                        <li>
                                            <dl>
                                                <dt>포화지방 (g)</dt>
                                                <dd>${menuVo.itemFat }</dd>                                                
                                            </dl>
                                        </li>
                                        <li>
                                            <dl>
                                                <dt>단백질 (g)</dt>
                                                <dd>${menuVo.itemProtein }</dd>
                                            </dl>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li>
                                            <dl>
                                                <dt>나트륨 (mg)</dt>
                                                <dd>${menuVo.itemSalt }</dd>
                                            </dl>
                                        </li>
                                        <li>
                                            <dl>
                                                <dt>당류 (g)</dt>
                                                <dd>${menuVo.itemSugar }</dd>
                                            </dl>
                                        </li>
                                        <li>
                                            <dl>
                                                <dt>카페인 (mg)</dt>
                                                <dd>${menuVo.itemCaffeine }</dd>
                                            </dl>
                                        </li>
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