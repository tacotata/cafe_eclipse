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
<title>insertStore</title>
<style>
.wrap {    
    padding: 8% 10% 15%;
    color: #929292;
}

.insertStore__wrap {  
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

.insertStore__eMailGuid {
    font-size: 12px;
    text-align: right;
    margin-bottom: 4%;
    padding-bottom:4% ;
    border-bottom: 1px solid #929292;
}

.insertStore__table{
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

.insertStore__table tbody, div {
    text-align: left;
    font-weight: bold;
}

.insertStore__table td {   
    display: inline;
}

.insertStore__table input:not(.menu-file){
    margin: 2%  0 ;    
    float: right;
    border: 1px solid #ddd;
    padding: 2% 0 ;
    width: 63%;
}

.insertStore__table tr th {   
    display: inline-block;
    padding: 9px 0;
    font-size: 14px; 
}

.insertStore__table textarea {
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

.menu-file{
    border: 1px solid #ddd;
    padding: 4px 0;
    vertical-align: bottom;
    width: 58%;
}

 .insertStore__btn--submit {
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

.insertStore__fileGuid {
    font-size: 14px;
    line-height: 1.5;
    margin: 5% 0;
    font-weight: initial;
}

.insertStore-submit__box {
    text-align: center;
    margin-top: 2%;
}

.insertStore-submit__box input {
    width: 9.375rem;
}

/* 태블릿  768*/
@media all and (min-width:768px) {
}

/* pc  960~1024*/
@media all and (min-width:960px) {

.insertStore__wrap {
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
        <div id="insertStore">
            <div class="insertStore__wrap">                
                <div class="notice__wrap">               
                    <div class="wrap__title" >
                        <span><h2>매장 등록</h2></span>
                    </div>   
                    	<form action="/cafe/insertStore" method="post" enctype="multipart/form-data">
                    <table class="insertStore__table">
                        <caption class="hid">매장 등록</caption>
                         <tbody>
                                
                                <tr>
                                    <th scope="row">매장명</th>
                                    <td>
                                        <input type="text" id="menuName-ko" class="cs-name" name="storeName">    
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">주소</th>
                                    <td>
                                        <input type="text" id="menuName-en" class="cs-name" name="storeAddress">    
                                    </td>
                                </tr>
                            <tr>
                                    <th scope="row">지역</th>
                                    <td>
                                       <select name="area">
											<option value="서울">서울</option>
											<option value="충청도">충청도</option>
											<option value="전라도">전라도</option>
											<option value="부산">부산</option>
											<option value="제주">제주</option>
										</select>                                   
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">전화번호</th>
                                    <td>
                                        <input type="text" id="menu-kacl" class="cs-name" name="storeTel">    
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">영업시간</th>
                                    <td>
                                        <input type="text" id="menu-fat" class="cs-name" name="storeTime">    
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">매장서비스</th>
                                    <td>
                                        <input type="text" id="menu-protein" class="cs-name" name="storeService">    
                                    </td>
                                </tr>
                             
                               
                                <tr>
                                    <th scope="row">파일첨부</th>
                                    <td>
                                        <div class="insertStore__file">
                                            <input type="file" id="menu-file" class="itemImg" name="file" >
                                          
                                            <i class="far fa-minus-square"></i>    
                                        </div>                                         
                                    </td>
                                </tr>
                            </tbody>
                    </table>
                    <div class="insertStore-submit__box">
                    <input class="insertStore__btn--submit" type="submit" value="매장 등록 하기" class="submit">
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
</html>