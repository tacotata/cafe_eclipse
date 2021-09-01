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
<title>Store</title>
<style>
.wrap {    
    padding: 8% 10% 15%;
    color: #929292;
}

.store__wrap {
    color: #929292;
}

.wrap__title h2{
    padding: 15px 0;   
    color: #929292;
    margin-bottom: 8%;
    font-size: 1.8rem; 
}

.store-sch__table{
    width: 100%;
}

 a{
   color: #929292;
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

.store-sch__table thead, .store-sch__table tbody {
    font-size: 0.813rem;
    text-align: center;
    font-weight: bold;
}

.store-sch__table thead{
    color: #fff;   
    background-color: #de8971; 
}

.store-sch__table td {
    background: rgba(255, 233, 214, .2); 
}

.store-sch__table thead tr th  {
    padding: 1.125rem 0;
}

.store-sch__table tbody tr td {
    padding:1.375rem 0;
}

.store-sch__table  tbody tr {
    border-bottom: 1px solid #d3d3d3;
}

.store-sch__table thead tr th:first-child, .store-sch__table thead tr th:nth-child(3),
.store-sch__table tbody tr td:first-child, .store-sch__table tbody tr td:nth-child(3) {
    display: none;
}

.store-sch__table tbody tr td:nth-child(3):hover, .store-sch__table tbody tr td:nth-child(2):hover {
	text-decoration: underline;
}

.store-pagination li {
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

/* .store-pagination li:first-child, .store-pagination li:last-child  {
    background: rgba(143, 188, 143, .2);
    font-weight: bold;
}     */

.store-pagination {
    display: flex;
    list-style: none;
    justify-content: center;   
}

.store-pagination:hover {
	text-decoration: underline;
}

.store-sch__table {
    margin-top: 3%;
}

#store-sch__sch {   
    margin: 4% 0;
}

#store-sch__sch input {
    width:8.375rem;
    height: 1.950rem;
    font-size: 0.688rem;
    line-height: 1.950rem;
    vertical-align: bottom;
    text-indent: 0.625rem;
    display: inline-block;
}

#store-sch__sch button {
    display:inline- block;
    border: solid 1px #de8971;
    width: 3.375rem;   
    height: 1.975rem;   
    font-size: 0.813rem; 
    line-height: 1.975rem;
    text-align: center;
    background: #de8971;
    color: #fff;
}

.map-img {
    width: 60%;
}

.map-img img {
    width: 100%;
}

.map-img, .map-img__des {
    display: none;
}

.store-sch ul {
    text-align: left;
}

#store-sch__option {
    margin: 4% 0;
    width: 40%;
}

.store-sch p {
    font-weight: bold;
    margin-bottom: 2%;
}

/* 태블릿  768*/
@media all and (min-width:768px) {
.store-sch__table thead tr th:first-child, .store-sch__table thead tr th:nth-child(3), 
.store-sch__table tbody tr td:first-child, .store-sch__table tbody tr td:nth-child(3) {
    display: table-cell;
}

.store-sch__table thead tr th:first-child {
    width: 15%;
}

.store-sch__table thead tr th:nth-child(2) {
    width: 20%;
}

.store-sch__table thead tr th:nth-child(3) {
    width: 45%;
}

.store-sch__table thead tr th:nth-child(4) {
    width: 20%;
}

.store-sch__table tbody tr td:nth-child(3) {
    text-align: left;
    text-overflow: ellipsis;
    overflow: hidden;

}

}

/* pc  960~1024*/
@media all and (min-width:960px) {

.store__wrap {
    padding: 0% 20% 0%; 
}

.wrap__title h2{
    font-size: 3.2rem;
}
.store__wrap-top  {
    display: flex;
    justify-content: space-evenly;
}

.map-img, .map-img__des {   
    display: block;
}

#store-sch__option {
    width:50%;
    padding: 1%;
}
.store-sch__top  {
    margin: 30% 0% 10% 10%;
    width: 100%;
}

.store-sch__bottom {
    margin: 10% 0% 10% 10%;
}

}
</style>
</head>
<body>
<div id="container">
<%-- header 영역 --%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
  <div class="wrap">
        <div id="store">        
            <div class="store__wrap">
                <div class="wrap__title" >
                    <span><h2>STORE</h2></span>
                </div> 
                <section class="store__wrap-top">
                    <div class="map-img">
                        <img src="/img/img_map.gif" alt="지도">
                    </div>
                    <div class="store-sch">
                        <map name="MapStore" id="MapStore">
                            <area shape="poly" coords="169,127,180,125,187,136,177,142,167,142,166,130" href="#" class="city01" alt="서울">
                            <area shape="poly" coords="263,306,276,303,295,290,304,298,289,318" href="#" class="city02" alt="부산">
                            <area shape="poly" coords="251,252,268,244,278,254,268,271,256,270" href="#" class="city03" alt="대구">
                            <area shape="poly" coords="150,130,159,126,166,147,157,152" href="#" class="city04" alt="인천">
                            <area shape="poly" coords="150,304,162,303,175,310,169,320,158,326,147,313" href="#" class="city05" alt="광주">
                            <area shape="poly" coords="191,212,202,228,192,234,185,222" href="#" class="city06" alt="대전">
                            <area shape="poly" coords="301,291,286,280,291,271,318,273,314,289,307,297" href="#" class="city07" alt="울산">
                            <area shape="poly" coords="249,61,306,159,266,167,248,165,239,160,216,158,214,134,208,127,207,110,179,86" href="#" class="city08" alt="강원">
                            <area shape="poly" coords="175,88,201,121,214,159,195,178,169,181,159,160,170,156,171,148,191,141,182,120,167,126,130,128" href="#" class="city09" alt="경기">
                            <area shape="poly" coords="225,255,240,276,279,278,292,288,267,301,261,313,272,323,265,335,250,328,241,328,232,321,221,322,206,296,211,269" href="#" class="city10" alt="경남">
                            <area shape="poly" coords="261,172,294,171,306,163,310,241,323,242,316,269,293,268,286,268,285,277,270,274,283,254,268,239,248,249,250,268,241,271,228,249,224,222,222,202,229,195,255,189" href="#" class="city11" alt="경북">
                            <area shape="poly" coords="199,297,218,325,208,339,201,331,194,335,194,351,179,342,142,363,141,351,128,340,177,318" href="#" class="city12" alt="전남">
                            <area shape="poly" coords="139,332,126,312,135,305,136,297,149,297,160,288,171,292,192,301,179,311,171,303,153,300,145,306,149,320,149,326" href="#" class="city13" alt="전남">
                            <area shape="poly" coords="156,244,168,240,188,244,203,254,211,243,223,249,210,262,203,287,197,296,177,291,158,286,138,293,147,279,145,266,160,263" href="#" class="city14" alt="전북">
                            <area shape="poly" coords="126,184,142,184,137,176,155,178,162,187,171,184,190,187,193,205,191,213,179,219,185,229,192,235,205,230,209,232,214,240,204,249,189,242,166,237,154,242,144,231,146,210,126,195" href="#" class="city15" alt="충남">
                            <area shape="poly" coords="219,162,237,163,257,171,249,188,233,188,217,203,224,249,197,213,192,185" href="#" class="city16" alt="충북">
                            <area shape="poly" coords="141,375,166,372,181,377,176,395,149,402,134,391" href="#" class="city17" alt="제주">
                        </map>

                        <!-- <ul class="map-img__des">                           
                   
                            <li><a href="">서울시</a></li>
                            <li><a href="">경기</a></li>                           
                            <li><a href="">충청도</a></li>                        
                            <li><a href="">전라도</a></li>                     
                            <li><a href="">대구</a></li>
                            <li><a href="">부산</a></li>                          
                            <li><a href="">제주</a></li>
                        </ul> -->
                       
                        <ul class="store-sch__top">  
                            <P>매장검색</P>                         
                            <li id="store-sch__sch" class="sch">
                            <form action="store" method="get">
                            <select name="category" class="hid">
                            	<option value="all" selected="selected" ${pageDto.category eq 'all' ? 'all': '' }>all </option>
                            </select>
                                <label for="store-sch__input"  hidden>매장검색</label>
                                <input type="text" id="store-sch__input" class="store-sch__input" name="search" value="${pageDto.search}" >
                                <button id="store-sch__btn" type="submit"  class="btn">검색</button>
                       </form>
                            </li>                            
                        </ul>
                        
                        <ul class="store-sch__bottom">
                            <P>시도별 매장 검색</P>
                             <form action="store" method="get">
                            <select  id= "store-sch__option" name="category" >
                             <option value="전체">전체</option>
                             <option value="서울">서울</option>                         
                             <option value="충청도">충청도</option>
                             <option value="전라도">전라도</option>                         
                             <option value="부산">부산</option>
                             <option value="제주">제주</option>
                            </select>
                            </form>
                        </ul>
                     	
                    </div>
                </section>
                <section class="">
                    <table class="store-sch__table">
                        <caption class="hid"> search store</caption>
                       
                         <thead>
                             <tr>
                                <th scope="col" >지역</th> 
                                <th scope="col">매장명</th>
                                <th scope="col">주소</th>
                                <th scope="col">전화번호</th>
                             </tr>
                         </thead>
                         <tbody>
                         <c:choose>
                         <c:when test="${ not empty storeList }">
                         <c:forEach var="store" items="${ storeList }">
                           <input type="hidden" name="storeNum" id="storeNum" value="${ store.num }">
                             <tr>
                                 <td>${store.area}</td>
                                 <td><a href="/cafe/storeDetail?num=${store.num}&pageNum=${pageNum}">${store.storeName}</a></td>
                                 <td><a href="/cafe/storeDetail?num=${store.num}&pageNum=${pageNum}">${store.storeAddress }</a></td>
                                 <td>${store.storeTel}</td>
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
                     <div class="store-pagination">
                     <c:if test="${pageDto.count gt 0 }">
                     	<c:if test="${ pageDto.startPage gt pageDto.pageBlock}">
                     		 <li><a href="/cafe/store?pageNum=${pageDto.startPage - pageDto.pageBlock}&category=${ pageDto.category }&search=${pageDto.search}"><</a></li>
                     	</c:if>
                       
                       <c:forEach var="i" begin="${pageDto.startPage}" end="${pageDto.endPage}" step="1">
                        	<c:choose>
	                        	<c:when test="${i eq pageNum }">
	                        		<li><a href="/cafe/store?pageNum=${i }&category=${pageDto.category}&search=${pageDto.search}">[${i}]</a></li>
	                        	</c:when>
	                        	<c:otherwise>
	                        			<li><a href="/cafe/store?pageNum=${i }&category=${pageDto.category}&search=${pageDto.search}">[${i}]</a></li>
	                       		 </c:otherwise>
                      		</c:choose>
                        </c:forEach>
                        <c:if test="${ pageDto.endPage lt pageDto.pageCount}">
                     		 <li><a href="/cafe/store?pageNum=${pageDto.startPage + pageDto.pageBlock}&category=${ pageDto.category }&search=${pageDto.search}">></a></li>
                     	</c:if>
                      </c:if>
                     </div>
                </section>
            </div>
        </div>
    </div>   
<%-- footer 영역 --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</div>
</body>
</html>