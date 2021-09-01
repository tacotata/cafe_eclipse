<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>myPage</title>
<style>
.wrap {    
    padding: 8% 10% 15%; 
}

.myPage__wrap {   
    color: #929292;
}

.wrap__title h2{
    padding: 15px 0;  
    color: #929292;
    margin-bottom: 8%;
    font-size: 1.8rem;  
}

#myPage__tab input[type="radio"] {
    display: none;
}

#myPage__tab  label {
    font-size: .89rem;
    display: inline-block;   
    text-align: center;    
    margin: 0;   
    width: 49%;
    height:13.625%;
    line-height: 40px;   
}

#myPage__tab label:hover {   
    cursor: pointer;
}

#myPage__tab input:checked + label {
    color:#444;   
    border: 1px solid  #d3d3d3;
    border-top: 2px solid #de8971;
	border-bottom: 1px solid #ffffff;
}

#myPage__tab1, #myPage__tab2 {
    display: none;
}

#tab1:checked ~ #myPage__tab1,
#tab2:checked ~ #myPage__tab2{
    display: block;
}

.myPage-hello {
    font-size: 22px;
    line-height: 1.2;
    color: #444;
    margin-bottom: 5%;
    line-height: 1.5;
}

.myPage-Star__value {
    border: 1px solid #d3d3d3;
    background:#d3d3d3;
    height: 5px;
    border-radius: 5px;
    margin-bottom: 8%;
}

.myPage-StarCount {
    text-align: right;
    margin-bottom: 3%;
    font-size: 18px;
}

.myPage-btns {  
    margin-bottom: 8%;
}

.myPage-btns__box {
    display: flex;
    justify-content: space-between;
}


.myPage-btns button {
    display:inline- block;
    border-radius: 5px;   
    margin-bottom: 5%;
    border: solid 1px #de8971;
    width: 45%;
    height: 40px;
    height: 1.775rem;   
    font-size: 0.813rem; 
    line-height: 1.575rem;
    text-align: center;    
    background: #de8971;
    color: #fff;
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



.myPage-modify__top {
    padding: 4% 0;
  }

#myPage__tab fieldset label {
    display: block;
    text-align: left;
    margin-top: 4%;
    margin-bottom: 3%;   
    font-weight: bold;  
}

.myPage__wrap input:not(.myPage-modify__btn, .memberDel__btn , .cancel__btn) {
    width: 100%;
    padding: 3%;
    margin-bottom: 5%;    
}

.birth__box {
    display: flex;
}

.birth__box div, select {
    width: 100%;  
    margin-bottom: 4%; 
}

.select_year  select , .select_month select , .select_day select {
    width: 100%;
    display: block;
    font-size: .7rem;
    padding:10%;
    color: #929292;
    
}

.select_month {
    margin: 0 3%;
}

.myPage__wrap fieldset {
    margin-top: 4%; 
    padding: 10% 0%;
}

.myPage-modify__btn , .memberDel__btn , .cancel__btn{
    width: 100%;
    margin: 10% 2% 0% 0%;
    box-sizing: border-box;
    display: inline-block;
    height: 45px;
    line-height: 36px;   
    padding-left: 14.88095238095238%;
    padding-right: 14.88095238095238%;   
    border: solid 1px #de8971;
    color: #fff;
    border-radius: 4px;   
    background: #de8971;
}

.myPage-modify__btn:hover , .memberDel__btn:hover , .cancel__btn:hover {
	text-decoration: underline;
}


#whyDel {
    resize: none;
    padding: 10px;
    line-height: 1.2;   
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


.myPage-del__btns {
 	display: flex;
}


/* 태블릿  768*/
@media all and (min-width:768px) {
}

/* pc  960~1024*/
@media all and (min-width:960px) {

.myPage__wrap {
    padding: 0% 20% 0%;
}

.wrap__title h2{
    font-size: 3.2rem;
}

.myPage-btns__box {
    display: flex;
    justify-content: space-between;
}

.myPage-btns__box button {
    width: 45%;
    height: 40px;
}

.myPage-modify__btn--box, .myPage-del__btns {
    text-align: center;
}

.myPage-modify__btn { 
    width:50%;   
}

.myPage-del__btns {
    display: flex;
    justify-content: space-between;
}

.myPage-del__btns input {
    width: 45%;    
}
}
</style>
</head>
<body>
<div id="container">
<%-- header 영역 --%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<div class="wrap">
<div id="myPage">
    <div class="myPage__wrap">
        <div class="wrap__title" >
            <span><h2>My Cafe</h2></span>
        </div>  
        <div class="myPage-membership">
        	<section class="myPage-myinfo">
         <div class="myPage-hello">
            <input type="hidden" id="memberId" value="${ id }">
             <strong>${id}</strong>님,  <br>오늘도 화이팅입니다.
         </div>
         <div class="myPage-Star">                    
             <div class="myPage-StarCount">                       
                 <span><span style="color: #444; font-size: 22px;">  11</span>/12</span>
             </div>
             <div class="myPage-Star__bar">
                 <div class="myPage-Star__value" ></div>
             </div>
         </div> 
   			</section>  
   		<section class="myPage-btns">
          		<div class="myPage-btns__box">
			        <button class="myPage-btns-myMenu" onclick="location.href='/member/myMenu?id=${id}  '">나만의 음료</button>
			             <button class="myPage-btns-myCoupon" onclick="location.href='/member/myCoupon'">나의 쿠폰</button>
	    		</div>
			</section>
		</div>
        <div id="myPage__tab" class="tab">
            <input type="radio" id="tab1" name="tabs"  onclick="location.href='/member/mypage'" >
            <label for="tab1">비밀번호 수정</label>
            <input type="radio" id="tab2" name="tabs" checked >
            <label for="tab2">회원 탈퇴</label>
           <section id="myPage__tab1" >
           
           </section>
           <section id="myPage__tab2"> 
            <div class= "myPage-del__wrap">
              
                <fieldset>
                 <form action="/member/delete"  method="post"> 
                    <label for="login_id">아이디</label>
                    <input type="text" id= "login_id" name="id" value="${id}" placeholder="" readonly>
                   
                    <label for="login_pwd">비밀번호</label>
                    <input type="password" id= "login_pwd" name="passwd" required="required" placeholder="" maxlength="="20">
                    <label for="whyDel">탈퇴사유</label>
                    <textarea name="reason" id="whyDel" maxlength="500" rows="10" required="required"></textarea>
                   <div class="text-num">
                                   		<p><span id="counter"></span>/500</p>
                       				</div>
                  
                </fieldset>
                <div class="myPage-del__btns">
                <input class="memberDel__btn" type="submit" value="탈퇴" class="submit">
                <input class="cancel__btn" type="reset" value="취소" class="reset">
           </form> 
            </div>
            </div> 
           </section>
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

$('#whyDel').keyup(function (e){
    var content = $(this).val();
    $('#counter').html(content.length );    

    if (content.length >= 500){
        alert("최대 500자까지 입력 가능합니다.");
        $(this).val(content.substring(0,500));
      
    }
});
</script>