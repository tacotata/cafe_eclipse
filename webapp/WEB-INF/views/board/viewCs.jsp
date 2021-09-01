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
<title>viewCs</title>
<style>

/* 모바일 320*/
.viewCs__wrap {
    padding: 13% 6% 15%;
    color: #929292;  
}

.viewCs__wrap h2 {
    text-align: center;   
    margin-bottom:10% ;
    font-size: 1.8rem;
    letter-spacing: .2rem;
}

.viewCs__wrap p {
    letter-spacing: .1rem;  
    margin-bottom: 6% ;

}
.viewCs__wrap-wrap {
    margin-top: 4%;  
    border: 1px solid wheat;
    padding: 6%;
}

.viewCs__text {
    text-align: center;
}
.viewCs__top {
  padding: 4%;
  text-align: center;
  margin-bottom: 10%;
  line-height: 1.8;
}

 #viewCs_id {
    padding: 3%;
    margin-bottom: 4%;
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

.viewCs__id-save i {
    text-align: left;    
    display: inline-block;
    left:0;
}

.viewCs__btn{
    margin: 0 0 10%;
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

.viewCs__bottom ul, a {
    font-size: .89rem;
    color: #929292;
    display: flex;
    justify-content: space-around;   
}

/* 태블릿  768*/
@media all and (min-width:768px) {
}

/* pc  960~1024*/
@media all and (min-width:960px) {

.viewCs__wrap {
    padding: 8% 30% 8%;
}

.viewCs__btn{ 
    height: 50px;
}

}
</style>
</head>
<body>
<div id="container">
<%-- header 영역 --%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
    <div class="wrap">
        <div id="viewCs">
            <div class="viewCs__wrap">
                <strong><h2>CUSTOMER SERVICE</h2></strong>                
                <div class="viewCs__wrap-wrap">
                <div class="viewCs__text">
	                <strong> <p style="color:#de8971  ;">고객님 소중한 의견 감사합니다.</p></strong>
	                <p>답변은 입력하신 메일로 보내드립니다.</p>
            	</div>
                <fieldset>
                    <div class="viewCs__top">                        
						고객님 입력하신 이메일은<br><strong> "${csVo.csEmail }"</strong> 입니다.	
						<br> 오늘도 좋은 하루 보내세요.
                    </div>
                   
                </fieldset>
            </div>
            </div>
        </div>
    </div>
<%-- footer 영역 --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</div>
</body>
</html></html>