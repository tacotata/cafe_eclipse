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
<title>pwdSearch</title>
<style>

.wrap {    
    padding: 8% 10% 15%;
    color: #929292;
}

.menu__wrap {   
    color: #929292;
}

.wrap__title h2{
    padding: 15px 0;    
    color: #929292;
    margin-bottom: 8%;
    font-size: 1.8rem; 
}

.menu-title {
    margin: 4% 0;
    padding: 6%;
    background: #ffe9d6;  
    font-weight: bold;
}

#menu__tab input[type="radio"] {
    display: none;
}

#menu__tab  label {
    font-size: .89rem;
    display: inline-block;
    text-align: center;
    margin: 0;    
     width:100px;
    height:13.625%;
    line-height: 40px;
}


#menu__tab label:hover {  
    cursor: pointer;
}

#menu__tab input:checked + label {
    color:#444;   
    border: 1px solid  #d3d3d3;
    border-top: 2px solid #de8971;
	border-bottom: 1px solid #ffffff;
}

section{
    display: none;
}

#tab1:checked ~ #menu__tab1,
#tab2:checked ~ #menu__tab2,
#tab3:checked ~ #menu__tab3 {
    display: block;
}

#menu__tab1 dt > img {  
    width: 100%;   
}





.menu-sort__box {
    border: 1px solid #d3d3d3; 
}

.menu-sort__box p {
    font-weight: bold;
    padding: 5%;  
    border-bottom:1px solid #d3d3d3 ;
      cursor: pointer;
}

#menu-sort__chk {
    padding: 5%;
}

#menu-sort__chk input {
    margin-right: 5%;
}

#menu-sort__chk label {   
    text-align: left;
    background: initial;    
}

#menu-sort__chk input:checked + label {
    color:#929292;
    background:initial;
    border: initial;
}

.menu-sort__box p i {
    line-height: 30px;
    border-radius: 50%;
    text-align: center;
    width: 30px;
    height: 30px;
    background:rgba(255, 233, 214, .6);
}

#menu-sell  {
    text-align: center;
    width:100%; 
    display: flex; 
    flex-wrap: wrap; 
} 

#menu-sell li {   
    width: 49%;
    margin: 0.5%;
}

#menu-sell  img {
    display: inline-block;
    width:100%;
    height: auto;   
}

dd {
    font-size: .87rem;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    text-align: center;
    font-weight: bold;
    margin: 6% 0;
}



/* 태블릿  768*/
@media all and (min-width:768px) {

#menu__tab label {
   /*  width: 32.88%; */
}

#menu-sell li {
    width: 32%;
    margin: 0.5%;
}

.menu-title {
margin: 4% 0;
padding: 3%;
background:#ffe9d6;
font-weight: bold;
}

}


/* pc  960~1024*/
@media all and (min-width:960px) {

.menu__wrap {
    padding: 0% 20% 0%;
}   

#menu__tab label {     
    width:100px;
}

#menu-sell li {
    width: 24%;
    margin: 0.5%;
}

.wrap__title h2 {
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
            <div id="menu">
                <div class="menu__wrap">
                    <div class="wrap__title" >
                        <span><h2>BEST</h2></span>
                    </div>                
                    <div id="menu__tab" class="tab">
                       <input type="radio" id="tab1" name="tabs" onclick="location.href='/cafe/new'">
                        <label for="tab1">NEW</label>
                        <input type="radio" id="tab2" name="tabs"  checked  >
                        <label for="tab2">BEST</label>
                        <input type="radio" id="tab3" name="tabs" onclick="location.href='/cafe/menu'" >
                        <label for="tab3">MENU</label>
                        
                        <section id ="menu__tab1">  
                          
                        </section>

                        <section id ="menu__tab2">  
                            <div class="menu-tap2__wrap">                            
                                <div class="menu-sort__box">
                                    <p>분류보기&nbsp;<i class="fas fa-angle-up"></i><i class="fas fa-angle-down" style="display: none"></i></p>           
                                    <ul id="menu-sort__chk">
                                        <li>
                                            <input type="checkbox" id="menu-all" class="menu-all" name="menu-all">
                                            <label for="menu-all">전체보기</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="menu-esp" class="menu-esp" name="menu-esp">
                                            <label for="menu-esp">에스프레소</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="menu-cb" class="menu-cb" name="menu-cb">
                                            <label for="menu-cb">콜드브루</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="menu-frap" class="menu-frap" name="menu-frap">
                                            <label for="menu-frap">프라푸치노</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="menu-etc" class="menu-etc" name="menu-etc">
                                            <label for="menu-etc">기타음료</label>
                                        </li>
                                    </ul>                            
                                </div>
                                <div class="menu__list">                            
                                    <div class= "menu-new">
                                        <div class="menu-title">
                                            <p>인기메뉴</p>
                                        </div>          
                                           <c:choose>
                                        <c:when test="${ not empty menuAll }">   
                                        <c:forEach var="menu" items="${menuAll }">                  
                                        <ul class= "menu-new__list" id="menu-sell">
                                            <li>
                                             <dl>
                                               <input type="hidden" name="menuNum" id="menuNum" value="${menu.num}">      
                                                    <dt><a href="/cafe/menuDetail?num=${menu.num }"><img src="/upload/${ menu.itemImg }"  alt="신제품"></a></dt>
                                                    <dd>${menu.itemNameKo }</dd>
                                                </dl>
                                            </li>
                                           
                                        </ul>
                                         </c:forEach>  
                                        </c:when>
                                          <c:otherwise>
                                        	메뉴 없음
                                        </c:otherwise>
                                        </c:choose>
                                    </div>        
                                </div>
                            </div>
                        </section>

                        <section id ="menu__tab3">  
                   
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


$(document).ready(function(){
    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".menu-sort__box>p").click(function(){
        var submenu = $(this).next("ul");

        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
            
            $(".fa-angle-up").hide()
              $(".fa-angle-down").show()
            
        }else{
            submenu.show();
            $(".fa-angle-up").show()
            $(".fa-angle-down").hide()
            
        }
    });
});

</script>