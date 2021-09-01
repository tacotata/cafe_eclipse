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
<title>cs</title>
<style>
a{
 color: #929292;	
}

.wrap {    
    padding: 8% 10% 15%;
    color: #929292;
}

.cs__wrap {   
    color: #929292;
}

.wrap__title h2{
    padding: 15px 0;    
    color: #929292;
    margin-bottom: 8%;
    font-size: 1.8rem;   
}

.cs__table{
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

.cs__table thead, .cs__table tbody {
    font-size: 0.813rem;
    text-align: center;
    font-weight: bold;
}

.cs__table thead{
    color: #fff;   
    background-color: #de8971; 
}

.cs__table td {
    background: rgba(255, 233, 214, .2); 
}

.cs__table thead tr th  {
    padding: 1.125rem 0;
}

.cs__table tbody tr td {
    padding:1.375rem 0;
}

.cs__table  tbody tr {
    border-bottom: 1px solid #d3d3d3;
}

.cs__table thead tr th:first-child, .cs__table thead tr th:nth-child(3), .cs__table tr th:nth-child(4),
.cs__table tbody tr td:first-child, .cs__table tbody tr td:nth-child(3), .cs__table tbody tr td:nth-child(4) {
    display: none;
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

/*  .pagination li:first-child, .pagination li:last-child  {
    background: rgba(143, 188, 143, .2);
    font-weight: bold;   
}  */

.pagination {
    display: flex;
    list-style: none;
    justify-content: center;  
}

#cs__sch {
    text-align: center;
}

#cs__sch  input {
    width:10.375rem;
    height: 1.950rem;
    font-size: 0.688rem;
    line-height: 1.950rem;
    vertical-align: bottom;
    text-indent: 0.625rem;
    display: inline-block;
}

#cs__sch  button {
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

/* 태블릿  768*/
@media all and (min-width:768px) {

.cs__table thead tr th:first-child, .cs__table thead tr th:nth-child(3), .cs__table tr th:nth-child(4),
.cs__table tbody tr td:first-child, .cs__table tbody tr td:nth-child(3), .cs__table tbody tr td:nth-child(4) {
    display: table-cell;
}

.cs__table thead tr th:first-child {
    width: 10%;
}

.cs__table thead tr th:nth-child(2) {
    width: 55%;
}

.cs__table thead tr th:nth-child(3) {
    width: 15%;
}

.cs__table thead tr th:nth-child(4) {
    width: 20%;
}



.cs__table tbody tr td:nth-child(2) {
    text-align: left;
}

}
/* pc  960~1024*/
@media all and (min-width:960px) {

.cs__wrap {
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
        <div id="cs">
            <div class="cs__wrap">               
                <div class="wrap__title" >
                    <span><h2>CUSTOMER SERVICE</h2></span>
                </div>   
                     <table class="cs__table">
                        <caption class="hid">CUSTOMER SERVICE</caption>
                         <thead>
                             <tr>
                                 <th class="cs-num">번호</th> 
                                 <th>제목</th>
                                 <th>글쓴이</th>
                                 <th >작성일</th>
                             </tr>
                         </thead>
                         <tbody>
                         <c:choose>
                         <c:when test="${ not empty csList }">
                         <c:forEach var="cs" items="${csList }">
                             <tr>
                                 <td>${cs.num}</td>
                                 <td><a href="/board/csContent?num=${cs.num}&pageNum=${pageNum }">${cs.subject }</a></td>
                                 <c:choose>
		                   			<c:when test ="${empty cs.updateDate}"> 
		                                 <td><fmt:formatDate value="${cs.regDate }" pattern="yyy.MM.dd"/></td>
		                           	</c:when>
		                           	<c:otherwise>
		                           	 	<td><fmt:formatDate value="${cs.updateDate }" pattern="yyy.MM.dd"/></td>
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
                     <div id="cs-pagination" class="pagination">
                   	 	<c:if test="${pageDto.count gt 0 }">
                   	 		<c:if test="${ pageDto.startPage gt pageDto.pageBlock }">
	                         	<li><a href="/board/cs?pageNum=${ pageDto.startPage - pageDto.pageBlock }&category=${ pageDto.category }&search=${pageDto.search}"><</a></li>
	                         </c:if>
	                         
	                         <c:forEach var="i" begin="${pageDto.startPage}" end="${pageDto.endPage }" step="1">
		                        <c:choose>
		                        <c:when test="${ i eq pageNum }">
			                         <li><a href="/board/cs?pageNum=${i }&category=${pageDto.category}&search=${pageDto.search}" class="active">[${i}]</a></li>
		                        </c:when> 
		                        <c:otherwise>
			                        <li><a href="/board/cs?pageNum=${i }&category=${pageDto.category}&search=${pageDto.search}">[${i}]</a></li>
		                         </c:otherwise>			                          
		                         </c:choose>
	                         </c:forEach> 
	                         
	                         <c:if test="${pageDto.endPage lt pageDto.pageCount }">	                         
	                        	<li><a href="/board/cs?pageNum=${pageDto.statPage + pageDto.pageBlock }&category=${pageDto.category}&search=${pageDto.search}">></a></li>	                         
	                         </c:if>
                      </c:if>   
                     </div>
                     <div id="cs__sch" class="sch">
                      <form action ="cs" method="get">
                     <select name="category" class="hid">
                     	<option value="all"  selected="selected" ${pageDto.category eq 'all' ? 'all': '' }>all</option>
                     </select>
                    
                         <label for="cs-sch__input"></label>
                         <input type="text" id="cs-sch__input" class="cs-sch__input" name="search" value="${pageDto.search}" placeholder="검색어를 입력해 주세요.">
                         <button id="cs-sch__btn" type="submit" class="btn">검색</button>
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