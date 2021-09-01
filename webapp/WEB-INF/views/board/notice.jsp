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
<title>notice</title>
<style>
a{
 color: #929292;	
}

.wrap {    
    padding: 8% 10% 15%;
    color: #929292;
}

.notice__wrap {   
    color: #929292;
}

.wrap__title h2{
    padding: 15px 0;    
    color: #929292;
    margin-bottom: 8%;
    font-size: 1.8rem;   
}

.notice__table{
    width: 100%;
}

.hid {
    position: absolute;
    left: -9999px;
    font-size: 0;
    width: 1px;
    height: 1px; 
    text-indent: -9999px;    
    visibility:hidden;
    overflow: hidden;
}

.notice__table thead, .notice__table tbody {
    font-size: 0.813rem;
    text-align: center;
    font-weight: bold;
}

.notice__table thead{
    color: #fff;   
    background-color: #de8971; 
}

.notice__table td {
    background: rgba(255, 233, 214, .2); 
}

.notice__table thead tr th  {
    padding: 1.125rem 0;
}

.notice__table tbody tr td {
    padding:1.375rem 0;
}

.notice__table  tbody tr {
    border-bottom: 1px solid #d3d3d3;
}

.notice__table thead tr th:first-child, .notice__table thead tr th:nth-child(3), .notice__table tr th:nth-child(4),
.notice__table tbody tr td:first-child, .notice__table tbody tr td:nth-child(3), .notice__table tbody tr td:nth-child(4) {
    display: none;
}

.notice__table tbody tr td:nth-child(2):hover{
	text-decoration: underline;
}

.pagination li {
    margin: 1.875rem .4rem 1.500rem 0;  
    width: 26px;
    width: 1.625rem;
    font-size: 0.813em;
    font-size: 0.813rem;
    line-height: 26px;
    line-height: 1.625rem;
    text-align: center;
    color:#8fbc8f;
    transition: all 0.2s;    
}

.pagination li:hover {
	text-decoration: underline;
}

/*  .pagination li:first-child, .pagination li:last-child  {
    background: rgba(143, 188, 143, .2);
    font-weight: bold;   
}  */

.pagination {
    display: flex;
    list-style: none;
    justify-content: center;  
}

#notice__sch {
    text-align: center;
}

#notice__sch  input {
    width:10.375rem;
    height: 1.950rem;
    font-size: 0.688rem;
    line-height: 1.950rem;
    vertical-align: bottom;
    text-indent: 0.625rem;
    display: inline-block;
}

#notice__sch  button {
    display:inline- block;
    border: solid 1px #de8971;
    width: 4.375rem;
    height: 1.975rem;
    font-size: 0.813rem;
    line-height: 1.975rem;
    text-align: center;   
    background: #de8971;
    color: #fff;
}

#notice__sch  button:hover {
		text-decoration: underline;
}

/* 태블릿  768*/
@media all and (min-width:768px) {

.notice__table thead tr th:first-child, .notice__table thead tr th:nth-child(3), .notice__table tr th:nth-child(4),
.notice__table tbody tr td:first-child, .notice__table tbody tr td:nth-child(3), .notice__table tbody tr td:nth-child(4) {
    display: table-cell;
}

.notice__table thead tr th:first-child {
    width: 10%;
}

.notice__table thead tr th:nth-child(2) {
    width: 55%;
}

.notice__table thead tr th:nth-child(3) {
    width: 15%;
}

.notice__table thead tr th:nth-child(4) {
    width: 20%;
}



.notice__table tbody tr td:nth-child(2) {
    text-align: left;
}

}
/* pc  960~1024*/
@media all and (min-width:960px) {

.notice__wrap {
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
        <div id="notice">
            <div class="notice__wrap">               
                <div class="wrap__title" >
                    <span><h2>NOTICE</h2></span>
                </div>   
                     <table class="notice__table">
                        <caption class="hid">NOTICE</caption>
                         <thead>
                             <tr>
                                <th class="notice-num">번호</th> 
                                <th>제목</th>                              
                                <th >작성일</th>
                             </tr>
                         </thead>
                         <tbody>
                         <c:choose>
                         <c:when test="${ not empty noticeList }">
                         <c:forEach var="notice" items="${noticeList }">
                             <tr>
                                 <td>${notice.num}</td>
                                 <td><a href="/board/noticeContent?num=${notice.num}&pageNum=${pageNum }">${notice.subject }</a></td>
                                 <c:choose>
		                   			<c:when test ="${empty notice.updateDate}"> 
		                                 <td><fmt:formatDate value="${notice.regDate }" pattern="yyy.MM.dd"/></td>
		                           	</c:when>
		                           	<c:otherwise>
		                           	 	<td><fmt:formatDate value="${notice.updateDate }" pattern="yyy.MM.dd"/></td>
	                           		</c:otherwise>
                            	</c:choose>
                             </tr>
                             </c:forEach>
                             </c:when>
                             <c:otherwise>
	                             <tr>
	                             	<td colspan="4">게시판 글없음</td>
	                             </tr>
                             </c:otherwise>
                          </c:choose>
                         </tbody>
                     </table>
                     <div id="notice-pagination" class="pagination">
                   	 	<c:if test="${pageDto.count gt 0 }">
                   	 		<c:if test="${ pageDto.startPage gt pageDto.pageBlock }">
	                         	<li><a href="/board/notice?pageNum=${ pageDto.startPage - pageDto.pageBlock }&category=${ pageDto.category }&search=${pageDto.search}"><</a></li>
	                         </c:if>
	                         
	                         <c:forEach var="i" begin="${pageDto.startPage}" end="${pageDto.endPage }" step="1">
		                        <c:choose>
		                        <c:when test="${ i eq pageNum }">
			                         <li><a href="/board/notice?pageNum=${i }&category=${pageDto.category}&search=${pageDto.search}" class="active">[${i}]</a></li>
		                        </c:when> 
		                        <c:otherwise>
			                        <li><a href="/board/notice?pageNum=${i }&category=${pageDto.category}&search=${pageDto.search}">[${i}]</a></li>
		                         </c:otherwise>			                          
		                         </c:choose>
	                         </c:forEach> 
	                         
	                         <c:if test="${pageDto.endPage lt pageDto.pageCount }">	                         
	                        	<li><a href="/board/notice?pageNum=${pageDto.statPage + pageDto.pageBlock }&category=${pageDto.category}&search=${pageDto.search}">></a></li>	                         
	                         </c:if>
                      </c:if>   
                     </div>
                     <div id="notice__sch" class="sch">
                      <form action ="notice" method="get">
                     <select name="category" class="hid">
                     	<option value="all"  selected="selected" ${pageDto.category eq 'all' ? 'all': '' }>all</option>
                     </select>
                    
                         <label for="notice-sch__input"></label>
                         <input type="text" id="notice-sch__input" class="notice-sch__input" name="search" value="${pageDto.search}" placeholder="검색어를 입력해 주세요.">
                         <button id="notice-sch__btn" type="submit" class="btn">검색</button>
                      </form>
                  	</div>
             </div>
		</div>
      </div>
<%-- footer 영역 --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</div>
</body>
</html>