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
<title>insertMenu</title>
<style>
.wrap {    
    padding: 8% 10% 15%;
    color: #929292;
}

.insertMenu__wrap {  
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

.insertMenu__eMailGuid {
    font-size: 12px;
    text-align: right;
    margin-bottom: 4%;
    padding-bottom:4% ;
    border-bottom: 1px solid #929292;
}

.insertMenu__table{
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

.insertMenu__table tbody, div {
    text-align: left;
    font-weight: bold;
}

.insertMenu__table td {   
    display: inline;
}

.insertMenu__table input:not(.menu-file){
    margin: 2%  0 ;    
    float: right;
    border: 1px solid #ddd;
    padding: 2% 0 ;
    width: 63%;
}

.insertMenu__table tr th {   
    display: inline-block;
    padding: 9px 0;
    font-size: 14px; 
}

.insertMenu__table textarea {
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

 .insertMenu__btn--submit {
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

.insertMenu__fileGuid {
    font-size: 14px;
    line-height: 1.5;
    margin: 5% 0;
    font-weight: initial;
}

.insertMenu-submit__box {
    text-align: center;
    margin-top: 2%;
}

.insertMenu-submit__box input {
    width: 9.375rem;
}

/* 태블릿  768*/
@media all and (min-width:768px) {
}

/* pc  960~1024*/
@media all and (min-width:960px) {

.insertMenu__wrap {
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
        <div id="insertMenu">
            <div class="insertMenu__wrap">                
                <div class="notice__wrap">               
                    <div class="wrap__title" >
                        <span><h2>메뉴 등록</h2></span>
                    </div>   
                    	<form action="/cafe/insertMenu" method="post" enctype="multipart/form-data">
                    <table class="insertMenu__table">
                        <caption class="hid">메뉴 등록</caption>
                         <tbody>
                                
                                <tr>
                                    <th scope="row">이름(한글)</th>
                                    <td>
                                        <input type="text" id="menuName-ko" class="cs-name" name="itemNameKo">    
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">이름(영문)</th>
                                    <td>
                                        <input type="text" id="menuName-en" class="cs-name" name="itemNameEn">    
                                    </td>
                                </tr>
                                  <tr>
                                    <th scope="row">종류</th>
                                    <td>
                                       <select name="sort">
											<option value="에스프레소">에스프레소</option>
											<option value="콜드브루">콜드브루</option>
											<option value="프라푸치노">프라푸치노</option>
											<option value="기타">기타</option>
										</select>                                   
                                    </td>
                                </tr>
                               
                                <tr>
                                    <th scope="row">1회 제공량</th>
                                    <td>
                                        <input type="text" id="menu-kacl" class="cs-name" name="itemKcal">    
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">포화지방</th>
                                    <td>
                                        <input type="text" id="menu-fat" class="cs-name" name="itemFat">    
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">단백질</th>
                                    <td>
                                        <input type="text" id="menu-protein" class="cs-name" name="itemProtein">    
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">나트륨</th>
                                    <td>
                                        <input type="text" id="menu-salt" class="cs-name" name="itemSalt">    
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">당류</th>
                                    <td>
                                        <input type="text" id="menu-sugar" class="cs-name" name="itemSugar">    
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">카페인</th>
                                    <td>
                                        <input type="text" id="menu-caffeine" class="cs-name" name="itemCaffeine">    
                                    </td>
                                </tr>  
                                <tr>
                                    <th scope="row">메뉴 설명</th>
                                    <td>
                                       <textarea maxlength="2500" name="itemDes" id="cs-content" rows="10"  spellcheck="false"></textarea>
                                    </td>
                                   
                                </tr>
                                <tr>
                                    <th scope="row">가격</th>
                                    <td>
                                        <input type="text" id="menu-price" class="cs-name" name="price">    
                                    </td>
                                </tr>  
                               
                                <tr>
                                    <th scope="row">파일첨부</th>
                                    <td>
                                        <div class="insertMenu__file">
                                            <input type="file" id="menu-file" class="itemImg" name="file" >
                                          
                                            <i class="far fa-minus-square"></i>    
                                        </div>                                         
                                    </td>
                                </tr>
                            </tbody>
                    </table>
                    <div class="insertMenu-submit__box">
                    <input class="insertMenu__btn--submit" type="submit" value="메뉴 등록 하기" class="submit">
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