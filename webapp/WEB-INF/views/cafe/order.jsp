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
<title>order</title>
<style>
.wrap {    
    padding: 8% 10% 15%;  
}

.order__wrap {
    color: #929292;
}

.order__wrap ul {
    display: flex;
    justify-content: space-around;
    border-bottom:1px solid ;
    padding-bottom:6% ;
    margin-top: 8%;
}

.wrap__title h2{
    padding: 15px 0;    
    color: #929292;
    margin-bottom: 8%;
    font-size: 1.8rem;   
}

.order-menu__wrap {
    width: 32%;
    text-align: center;
    display: inline-block;
}

.order-menu__box img {
    width: 100%;
} 

.order-menu__box p {
    margin-top: 2%;
    line-height: 1.2;
    font-size: 14px;
    color: #929292;
}

.order-menuName p {
    color: #de8971;
}

.order-radio__box {
    display: flex;

}

.order-option {   
    display: inline-block;
    width: 50%;   
    padding: 4% 0; 
}

.order-option li{
    margin-bottom: 4%;  
}

.order-radio__box label  {
    width: 100%;
    box-sizing: border-box;
    display: inline-block;
    height: 25px;
    line-height: 26px;  
    padding-left: 14.88095238095238%;
    padding-right: 14.88095238095238%;   
    border: solid 1px #de8971;
    color:#de8971;
}

.order-quantity__box input[type="text"] {
    background: transparent;
    border:none;
    margin: 0 2%;
    text-align: center;
}

.order-radio__box  input:checked + label {
    color:#fff;    
    background: #de8971;
}

.order-radio__box input[type="radio"] {
    display: none;
}

#order-quantity__num {
    width: 30px;
}

.order-quantity__box {
    display: flex;
    justify-content: space-between;
    width: 100%;
    margin-top: 10%;
    margin-left: 2%;
}

.order-del__box {
    text-align: right;
}

.order-del__box button {   
    margin: 8% 0% 0% 0%;
    box-sizing: border-box;
    display: inline-block;
    height: 25px;
    line-height: 23px;  
    padding-left: 12.88095238095238%;
    padding-right: 12.88095238095238%;   
    border: solid 1px #ffe9d6;
    color: #929292;
    border-radius: 2px;    
    background: #ffe9d6;  
}

.total-box {
    margin: 10% 0;
    text-align: right;
    font-weight: bold;
}

/* 태블릿  768*/
@media all and (min-width:768px) {

.order-radio__box label  {
    text-align: center;
}

.order-menu__wrap {
    width: 18%;
}
}

/* pc  960~1024*/
@media all and (min-width:960px) {

.order__wrap {
    padding: 0% 20% 0%;
}

.wrap__title h2{
    font-size: 3.2rem;

}

}
</style>
</head>
<body>
<div id="container">
<%-- header 영역 --%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   <div class="wrap">
        <div id="order">
            <div class="order__wrap">               
               <div class="wrap__title" >
                   <span><h2>ORDER</h2></span>
               </div>    
               <ul>  
           <%--     <c:choose>
               <c:when test="${ not empty cartList }">
               <c:forEach var="cart" items="${cartList}"> --%>
    
               <input type="hidden" name="cartNum" id="cartNum" value="${cart.num }">
                  <div class="order-menu__wrap">
	                  <li class="order-menu__box">   
	                   <a href="/cafe/menuDetail?num=${ cart.num }&pageNum=${ pageNum }"><img alt="이미지 없음" src="/img/menu1.jpg"></a>
	                      <span class="order-menuName">
	                          <p>아메리카노</p>
	                      </span>
	                      <span class="order-price">
                              <p>4,000 원</p>
                          </span>
	                  </li>  
                  </div>
                <div class="order-option">
	                <div>
	                   <li class="order-radio__box">
	                       <input type="radio" id="tab1" name="tabs" checked>
	                       <label for="tab1">HOT</label>
	                       <input type="radio" id="tab2" name="tabs" >
	                       <label for="tab2">ICE</label>
		               	</li>
		           	</div>
		           	<div>
		               <li class="order-quantity__box">
		                   <i class="far fa-plus-square"></i>
		                   <input type="text" id="order-quantity__num" >
		                   <i class="far fa-minus-square"></i>
		               </li>
		           </div>
		           <div>
		                <li class="order-del__box">
		                   <button>삭제</button>  
		                </li>
            		</div>
        		</div>
            </ul>
       
            <div class="total-box">
                합 계: 4,000원
            </div>
         <%--    </c:forEach>
			</c:when>
					<c:otherwise>
					상품 없음
					</c:otherwise>		
            </c:choose> --%>
              <div id="myMenu-pagination" class="pagination">
                   	 	<c:if test="${pageDto.count gt 0 }">
                   	 		<c:if test="${ pageDto.startPage gt pageDto.pageBlock }">
	                         	<li><a href="/board/myMenu?pageNum=${ pageDto.startPage - pageDto.pageBlock }&category=${ pageDto.category }&search=${pageDto.search}"><</a></li>
	                         </c:if>
	                         
	                         <c:forEach var="i" begin="${pageDto.startPage}" end="${pageDto.endPage }" step="1">
		                        <c:choose>
		                        <c:when test="${ i eq pageNum }">
			                         <li><a href="/board/myMenu?pageNum=${i }&category=${pageDto.category}&search=${pageDto.search}" class="active">[${i}]</a></li>
		                        </c:when> 
		                        <c:otherwise>
			                        <li><a href="/board/myMenu?pageNum=${i }&category=${pageDto.category}&search=${pageDto.search}">[${i}]</a></li>
		                         </c:otherwise>			                          
		                         </c:choose>
	                         </c:forEach> 
	                         
	                         <c:if test="${pageDto.endPage lt pageDto.pageCount }">	                         
	                        	<li><a href="/board/myMenu?pageNum=${pageDto.statPage + pageDto.pageBlock }&category=${pageDto.category}&search=${pageDto.search}">></a></li>	                         
	                         </c:if>
                      </c:if>   
                     </div>
  		</div>
    </div>
 </div>
<%-- footer 영역 --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</div>
</body>
</html>