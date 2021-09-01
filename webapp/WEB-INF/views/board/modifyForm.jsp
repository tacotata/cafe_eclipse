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
<title>ModifyForm</title>
<style>
.wrap {    
    padding: 8% 10% 15%;
    color: #929292;
}

.modifyForm__wrap {  
    color: #929292;
}

.wrap__title h2{
    padding: 15px 0;   
    color: #929292;
    margin-bottom: 8%;
    font-size: 1.8rem;   
}

.fa-star-of-life {
    font-size: 12px;
    color: #de8971; 
    padding-right: 1%;
}

.modifyForm__border{
    border-bottom: 1px solid #929292;
    margin-bottom: 4%;
    padding-bottom:4%;
}

.modifyForm__table{
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

.modifyForm__table tbody, div {
    text-align: left;
    font-weight: bold;
}

.modifyForm__table td {   
    display: inline;
}

.modifyForm__table input:not(.modify-file){
    margin: 2%  0 ;    
    float: right;
    border: 1px solid #ddd;
    padding: 2% 0 ;
    width: 63%;
}

.modifyForm__table tr th {   
    display: inline-block;
    padding: 9px 0;
    font-size: 14px; 
}

.modifyForm__table textarea {
    resize: none;
    padding: 10px;
    line-height: 1.2;
    border: 1px solid #ddd;
    width:100%   
}

.text-num  {
    font-size: 12px;
    text-align: right;
    margin-top: 1%;   
    font-weight: initial;   
}

.modify-file{
    border: 1px solid #ddd;
    padding: 4px 0;
    vertical-align: bottom;
    width: 58%;
}

.modifyForm__btn--submit {
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

.fa-minus-square {
    font-size: 30px;
    vertical-align: bottom;
    color:  rgb(185, 183, 183);
    
}

.modifyForm__fileGuid {
    font-size: 14px;
    line-height: 1.5;
    margin: 5% 0;
    font-weight: initial;
}

.modifyForm-submit__box {
    text-align: center;
    margin-top: 2%;
}

.modifyForm-submit__box input {
    width: 9.375rem;
    margin-bottom: 2px;
}

/* 태블릿  768*/
@media all and (min-width:768px) {
}

/* pc  960~1024*/
@media all and (min-width:960px) {

.modifyForm__wrap {
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
        <div id="modifyForm">
            <div class="modifyForm__wrap">                
                <div class="notice__wrap">               
                    <div class="wrap__title" >
                        <span><h2>Modify</h2></span>
                    </div>   
                    <table class="modifyForm__table">
                        <caption class="hid">Modify</caption>
                        <div class="modifyForm__border"></div>     
                        <form action="/board/modify" method="post" name="frm">                     
                        <tbody>
                        <input type="hidden" name="pageNum" value="${ pageNum }">
						<input type="hidden" name="num" value="${ noticeVo.num }">
                                <tr>
                                    <th scope="row">이름</th>
                                    <td>
                                        <input type="text" id="modify-name" class="modify-name" name="id" value="${noticeVo.id }" readonly>    
                                    </td>
                                </tr>
                               
                                <tr>
                                    <th scope="row">제목</th>
                                    <td>
                                        <input type="text" id="modify-title" class="modify-title" name="subject" value=" ${noticeVo.subject }" required>    
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">내용</th>
                                    <td>
                                       <textarea maxlength="10000" name="content" id="modify-content" rows="10"   spellcheck="false"> ${noticeVo.content}</textarea>
                                       <div class="text-num">
                                        <p>0/10000</p>
                                    </div>
                                    </td>
                            
                            </tbody>
                    </table>
                    <div class="modifyForm-submit__box">
	                    <input class="modifyForm__btn--submit" type="submit" value="수정하기" class="submit">
	                     <input class="modifyForm__btn--submit" type="button" value="목록보기" class="submit" onclick="location.href= '/board/notice?pageNum=${pageNum}'">
	                </div>
                </form>
                </div>
        </div>
    </div> 
    </div> 
<%-- footer 영역 --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</div>
</body>
</html></html>