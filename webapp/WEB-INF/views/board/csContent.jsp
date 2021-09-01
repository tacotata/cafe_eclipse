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
<title>CsContent</title>
<style>
.wrap {    
    padding: 8% 10% 15%;
    color: #929292;
}

.wrap__title h2{
    padding: 15px 0;    
    color: #929292;
    margin-bottom: 8%;
    font-size: 1.8rem;   
}

.csContent__table{
    width: 100%;
}

.csContent__table thead {    
    padding: 1.125rem 0;  
    border-top: 1px solid #929292;
    font-size: 0.913rem;  
    font-weight: bold;
    /* background: rgba(255, 233, 214, .2);  */
}

.csContent__table td {
   
}

.csContent__table thead  tr th  {
    display: flex; 
}

.csContent__table thead tr th:first-child {
    padding-top: 1.125rem;  
    padding-bottom:.5rem ;
    font-size: 0.913rem;  ;
} 

.csContent__table thead tr th:last-child {
    padding-bottom:.9rem ;
    font-size: 0.813rem;  
    font-weight: initial;
} 

.csContent__table tbody tr td {
    padding:1.375rem 1rem ;
    text-align: left;
    font-size: 0.813rem;
    line-height: 1.7;
}

.csContent__table  tbody tr {
    border-bottom: 1px solid #929292;
    border-top: 1px solid #929292;
}

.csContent-btn__box {
    margin-top: 1.175rem;
    text-align: right;
}

.csContent-btn__box button, .btn1{
    display: inline- block;
    border: solid 1px #de8971;
    width: 4.375rem;
    height: 1.775rem;
    font-size: 0.813rem;
    line-height: 1.575rem;
    text-align: center;
    background: #de8971;
    color: #fff;
    margin-bottom: 2px;
}



/* 태블릿  768*/
@media all and (min-width:768px) {
}

/* pc  960~1024*/
@media all and (min-width:960px) {
.csContent__wrap {
    padding: 0% 20% 0%;
}

.wrap__title h2{    
     font-size: 3.2rem; 
}

.csContent__table thead tr th  {
    display: table-cell;
}

.csContent__table thead tr th:first-child {
    width: 80%;
    text-align: left;
    text-indent: 1em;
}

.csContent__table thead tr th:last-child {
    width: 20%;
    font-weight: bold;
} 
}
</style>
</head>
<body>
<div id="container">
<%-- header 영역 --%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
 <div class="wrap">
        <div id="csContent">
            <div class="csContent__wrap">                
                <div class="wrap__title" >
                    <span><h2>CUSTOMER SERVICE</h2></span>
                </div>   
                <table class="csContent__table">
                    <caption></caption>
                        <colgroup>
                            <col width="80%">                              
                            <col width="20%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col" >${ csVo.subject }</th>
                           		<th scope="col" ><fmt:formatDate value="${ csVo.regDate}" pattern="yyyy.MM.dd"/></th>
                        	 </tr>
                        </thead>
                        <tbody>
                            <tr class="cs__contect">
                                <td class="cs__td" colspan="2">
                                    <div>
                                    <p>
									${ csVo.content }                                                                          
                                    </p> 
                                    </div>
                                </td>
                            </tr>
                             <tr class="cs__img">
                                <td class="cs__td" colspan="2">
                                    <div>
                                    <p>
									${ csVo.content }                                                                          
                                    </p> 
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        </table>
                        <div class="csContent-btn__box">
                            <button class ="csContent__btn"onclick="location.href = '/board/cs?pageNum=${ pageNum }'">목록</button>
                       </div>
            </div>
        </div>
    </div>  
<%-- footer 영역 --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script>
	function remove() {
		var result = confirm('해당 글을 정말 삭제하시겠습니까?');
		console.log(typeof result);
		
		if(result == false) {
			return;
		}
		location.href = '/board/delete?num=${csVo.num}&pageNum=${pageNum}';
	}
</script>
</div>
</body>
</html>