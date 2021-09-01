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
<title>csForm</title>
<style>
.wrap {    
    padding: 8% 10% 15%;
    color: #929292;
}

.csForm__wrap {  
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

.csForm__eMailGuid {
    font-size: 12px;
    text-align: right;
    margin-bottom: 4%;
    padding-bottom:4% ;
    border-bottom: 1px solid #929292;
}

.csForm__table{
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

.csForm__table tbody, div {
    text-align: left;
    font-weight: bold;
}

.csForm__table td {   
    display: inline;
}

.csForm__table input:not(.cs-file){
    margin: 2%  0 ;    
    float: right;
    border: 1px solid #ddd;
    padding: 2% 0 ;
    width: 63%;
}

.csForm__table tr th {   
    display: inline-block;
    padding: 9px 0;
    font-size: 14px; 
}

.csForm__table textarea {
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
 .text-num  span{
   font-size: 12px;
    text-align: right;
    margin-top: 1%;   
    font-weight: initial;   
 }

.csForm__file button ,.csForm__btn--submit {
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
.csForm__btn--submit:hover {
	text-decoration: underline;
}

.fa-plus-square {
    font-size: 30px;
    vertical-align: bottom;
    color:  rgb(185, 183, 183);
   	cursor: pointer;
    
}

.fa-plus-square:hover {
   
    color:#de8971;
}

.csForm__fileGuid {
    font-size: 14px;
    line-height: 1.5;
    margin: 5% 0;
    font-weight: initial;
}

.csForm-submit__box {
    text-align: center;
    margin-top: 2%;
}

.csForm-submit__box input {
    width: 9.375rem;
}

/* 태블릿  768*/
@media all and (min-width:768px) {
}

/* pc  960~1024*/
@media all and (min-width:960px) {

.csForm__wrap {
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
        <div id="csForm">
            <div class="csForm__wrap">                
                <div class="notice__wrap">               
                    <div class="wrap__title" >
                        <span><h2>CUSTOMER SERVICE</h2></span>
                    </div>   
                    <table class="csForm__table">
                        <caption class="hid">CUSTOMER SERVICE</caption>
                        <div class="csForm__eMailGuid">
                            <i class="fas fa-star-of-life"></i>답변은 메일로 보내집니다.
                        </div>     
                        <tbody>
                        <form action="/board/csForm" method="post" enctype="multipart/form-data">
                          
                            <tr>
                                <th scope="row">아이디</th>
                                <td>
                                    <input type="text" id="cs-name" class="cs-name" name="csId" value="${id}" readonly>    
                                </td>
                            </tr>                           
                            <tr>
                                <th scope="row">이메일</th>
                                <td>
                                    <input type="email" id="cs-email" class="cs-email" name="csEmail"  >   
                                </td>
                            </tr>
                             <tr>
                                 <th scope="row">제목</th>
                                 <td>
                                     <input type="text" id="cs-title" class="cs-title" name="csTitle" required>    
                                 </td>
                  			</tr>
                            <tr>
                                <th scope="row">내용</th>
                                <td>
                                   <textarea maxlength="2500" name="csContent" id="cs-content" rows="10"  spellcheck="false"></textarea>
                                   <div class="text-num">
                                   		<p><span id="counter"></span>/2500</p>
                       				</div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">파일첨부</th>
                                <td>
                                <label for='cs-file' ><i class="far fa-plus-square"  ></i>  </label>       
                                    <div class="csForm__file">
                                    <div></div>
                                        <input type="file" id="cs-file" class="cs-file" name="file" onchange='printName()' accept=".gif, .jpg, .png, .jpeg" style="display:none">
                                         <div id="file__name"></div>
                                    </div> 
                                    <div class="csForm__fileGuid">
                                        파일첨부는 아래의 파일만 등록이 가능하며 최대 1개 등록 가능합니다.
                                        <br>(등록 가능 확장자 : jpg, jpeg, png, gif)
                                    </div>   
                                </td>
                            </tr>
                         
                        </tbody>
                	</table>
		                <div class="csForm-submit__box">
		               		<input class="csForm__btn--submit" type="submit" value="고객의 소리 등록 하기" class="submit">
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
<script src="/script/jquery-1.6.1.min.js"></script>
<script>

$('#cs-content').keyup(function (e){
    var content = $(this).val();
    $('#counter').html(content.length );    

    if (content.length >= 2500){
        alert("최대 2500자까지 입력 가능합니다.");
        $(this).val(content.substring(0,2500));
      
    }
});




function printName()  {
	  const name = document.getElementById('cs-file').value;
	  document.getElementById("file__name").innerText = name;
	}
</script>