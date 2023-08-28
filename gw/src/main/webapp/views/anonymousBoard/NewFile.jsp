<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	
	$('.slider-2 .page-nav > div').click(function() {
	    
	    var $this = $(this);
	    var $pagenav = $this.parent()
	    var $current = $pagenav.find('.active');
	    
	    $current.removeClass('active');
	    $this.addClass('active');
	
	    var index = $this.index();
	    var $슬라이더 = $this.closest('.slider-2');
	    
	    $슬라이더.find('.slides > div.active').removeClass('active');
	    $슬라이더.find('.slides > div').eq(index).addClass('active');
	    
	    
	});

	$('.slider-2 > .side-btns > div:first-child').click(function() {
	    var $this = $(this);
	    var $slider = $this.closest('.slider-2');
	    
	    var $current = $slider.find('.page-nav > div.active');
	    var $post = $current.prev();
	    
	    if ( $post.length == 0 ) {
	        $post = $slider.find('.page-nav > div:last-child');
	    }
	    
	    $post.click();
	});

	$('.slider-2 > .side-btns > div:last-child').click(function() {
	    var $this = $(this);
	    var $slider = $this.closest('.slider-2');
	    
	    var $current = $slider.find('.page-nav > div.active');
	    var $post = $current.next();
	    
	    if ( $post.length == 0 ) {
	        $post = $slider.find('.page-nav > div:first-child');
	    }
	    
	    $post.click();
	});
});
</script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<style type="text/css">

.slider-2 {
    height:400px;
    position:relative;
}

.slider-2 .slides > div {
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background-position:center;
    /* 이미지를 최대한 안짤리게 한다. */
    background-size:cover;
    /* 배경 반복 금지 */
    background-repeat:no-repeat;
    opacity:0;
    transition: opacity 0.5s;
}


@media ( max-width:700px ) {
    .slider-2 {
        height:300px;
    }
}

.slider-2 .page-nav {
    position:absolute;
    width:100%;
    text-align:center;
    bottom:0;
    left:0;
}

.slider-2 .page-nav > div {
    display:inline-block;
    width:15px;
    height:15px;
    background-color:rgba(255,255,255,0.5);
    border-radius:2px;
    cursor:pointer;
}

.slider-2 .slides > div.active {
    opacity:1;
}
.slider-2 .page-nav > div.active {
    background-color:rgba(255,255,255,1);
}

.slider-2>.side-btns>div{
    position:absolute;
    top:0;
    left:0;
    width:30%;
    height:100%;
    cursor:pointer;
    z-index:10;

}

.slider-2>.side-btns>div>span:active{
    transform:translatey(-40%);
}
.slider-2>.side-btns>div:last-child{
    left:auto;
    right:0;
}

.slider-2>.side-btns>div>span{
    position:absolute;
    top:50%;
    transform:translatey(-50%);
    left:inherit;
    right:inherit;
    width:70px;
    height:70px;
    background-color:rgba(255,255,255,0.4);
    border-radius:100%;
    margin:0 10px;
}
.slider-2>.side-btns>div>span > i{
    position:absolute;
    top:50%;
    left:50%;
    font-size:3rem;
    color:rgba(0,0,0,0.4);
    transform:translateX(-70%) translateY(-50%);
}

.slider-2>.side-btns>div:last-child>span > i {
    transform:translateX(-20%) translateY(-50%);
}
</style>
</head>
<body>



<div class="slider-2">
    
     <div class="side-btns">
        <div><span><i class="fas fa-caret-left"></i></i></span></div>
        <div><span><i class="fas fa-caret-right"></i></span></div>
    </div>
    
    <div class="slides">
        <div class="active" style="background-image:url(https://images.prismic.io/stayfolio-production/73f99b79-336f-47fd-8ace-afc00978147d_banner.jpg?auto=compress,format);"></div>
        <div style="background-image:url(https://images.prismic.io/stayfolio-production/038914a1-9b23-4f26-9b10-84669d9a1339_banner.jpg?auto=compress,format);"></div>
        <div style="background-image:url(https://images.prismic.io/stayfolio-production/586abdef-7163-4629-9c39-6d7a627ae10e_01_banner_picture.jpg?auto=compress,format);"></div>
        <div style="background-image:url(https://images.prismic.io/stayfolio-production/3b4bf417-3c41-4d05-b62c-f02a293ba115_banner.jpg?auto=compress,format);"></div>
    </div>
    
    <div class="page-nav">
        <div class="active"></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>
</body>
</html>