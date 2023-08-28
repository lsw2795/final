<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="<c:url value='/js/anonymousBoard.js'/>"></script>
<link href="<c:url value='/css/anonymousBoard.css'/>" rel="stylesheet">
<script type="text/javascript">
$(function (){
	$('form[name=frmBoardWrite]').submit(function(){
		$.ajax({
	    	url:"<c:url value='/anonymous/boardWrite'/>",
	   		type:"post",
	   		dataType:"text",
	   		data:$('form[name=frmBoardWrite]').serializeArray(),
	   		success:function(res){
	   			alert(res);
	    	},error:function(xhr, status, error){
	    		alert(status+" : "+error);
	   		}
	   	});
		return false;
	});
});

function uploadSet(bt){
	var form = bt.closest('form[name=frmBoardWrite]');
	var cnt = $(form).find('input[type=file]').length;
	
	if(cnt==0){
		$('input[name=upfile]').attr('type','file');
	}else{
		$('input[name=upfile]').attr('type','hidden');
	}
}
</script>
<div class="row g-3">
	<div class="col-lg-10 m-auto mt-3">
		<div class="card mb-3">
			<div class="card-header bg-light overflow-hidden">
				<div class="d-flex align-items-center">
					<div class="flex-1 ms-2">
                    	<h5 class="mb-0 fs-0">익명게시판</h5>
                    	<pre>특정인을 비하하거나 음란물,도박성 광고 공유시 신고될수 있습니다.</pre>
                    </div>
                </div>
			</div>
            <div class="card-body p-0">
            	<form name="frmBoardWrite" method="post" enctype="multipart/form-data" action="<c:url value='/anonymous/boardWrite'/>">
					<input type="text" name="title" class="form-control" placeholder="제목을 입력하세요." >
                	<textarea name="content" class="shadow-none form-control rounded-0 resize-none px-x1 border-y-0 border-200" placeholder="내용을 입력하세요." rows="4"></textarea>
					<input name="upfile" type="hidden" class="form-control" accept="image/*" multiple="multiple" required>
                    <div class="row g-0 justify-content-between mt-3 px-x1 pb-3">
                    	<div class="col">
	                        <button onclick="uploadSet(this)" class="btn btn-light btn-sm rounded-pill shadow-none d-inline-flex align-items-center fs--1 mb-0 me-1" type="button">
		                        <img class="cursor-pointer" src="<c:url value='/assets/img/icons/spot-illustrations/image.svg'/>" width="17" alt="" />
		                        <span class="ms-2 d-none d-md-inline-block">Image</span>
	                        </button>
                      	</div>
                      	<div class="col-auto">
                        	<button class="btn btn-primary btn-sm px-4 px-sm-5" type="submit">작성</button>
                      	</div>
                    </div>
                </form>
            </div>
        </div>
        <div class="card mb-3">
        	<div class="card-header bg-light">
            	<div class="row justify-content-between">
                	<div class="col">
                    	<div class="d-flex">
	                        <div class="flex-1 align-self-center ms-2">
	                        	<p class="mb-1 lh-1">익명의 게시글입니다.</p>
	                          	<p class="mb-0 fs--1">11 hrs</p>
	                        </div>
                      	</div>
                    </div>
                    <div class="col-auto">
                    	<div class="dropdown font-sans-serif btn-reveal-trigger">
                        	<button class="btn btn-link text-600 btn-sm dropdown-toggle p-1 dropdown-caret-none btn-reveal" type="button" id="post-album-action" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        		<span class="fas fa-ellipsis-h fs--1"></span>
                        	</button>
	                        <div class="dropdown-menu dropdown-menu-end py-3" aria-labelledby="post-album-action">
	                        	<a class="dropdown-item" href="#!">수정하기</a>
	                          	<a class="dropdown-item text-danger" href="#!">삭제하기</a>
	                        </div>
                      	</div>
                    </div>
                </div>
            </div>
            <div class="card-body overflow-hidden">
            	<p>내용</p>
                <div class="row mx-n1 img-slider">
					<div class="col-2 p-1 m-auto" id="leftBtDiv" align="right">
	                	<button class="btn" id="leftBt" style="width: 50px">
	                		<img class="img-fluid rounded" src="<c:url value='/images/left.png'/>" alt="" />
	                	</button>
	                </div>
					<div class="col-8" id="centerDiv" align="center" >
	                	<div class="col img-div slideActive" style="background-image:url(<c:url value='/images/IMG_5487_20230820233730762.jpg'/>)">
	                	</div>
	                	<div class="col img-div" style="background-image:url(<c:url value='/images/IMG_5495_20230821003756826.jpg'/>)">
	                	</div>
	                	<div class="col img-div " style="background-image:url(<c:url value='/images/CHUCK%2070%20HI3_20230822202225523.PNG'/>)">
	                	</div>
	                	<div class="col img-div " style="background-image:url(<c:url value='/images/IMG_5487_20230820233730762.jpg'/>)">
	                	</div>
	                </div>
					<div class="col-2 p-1 m-auto" id="rightBtDiv">
	                	<button class="btn" id="rightBt" style="width: 50px">
	                		<img class="img-fluid rounded" src="<c:url value='/images/right.png'/>" alt="" />
	                	</button>
	                </div>
            	</div>
	            <div class="col-12 page-nav" align="center">
					<div class="slideActive"></div>
				    <div></div>
				    <div></div>
				    <div></div>
				</div>
          	</div>
            <div class="card-footer bg-light pt-0" id="datgeulInfo">
            	<div class="border-bottom border-200 fs--1 py-3">
            		<a class="text-700" href="#!">34개의 댓글이 있습니다.</a>
                </div>
                <div class="row g-0 fw-semi-bold text-center py-2 fs--1">
                    <div class="col-auto">
                    	<a class="rounded-2 d-flex align-items-center me-3" onclick="divEvent(this)" href="#!">
                    		<img src="<c:url value='/assets/img/icons/spot-illustrations/comment-active.png'/>" width="20" alt="" />
                    		<span class="ms-1">댓글</span>
                    	</a>
                    </div>
                </div>
                <div class="col-12" id="datgeulWriteDiv" style="display: none;">
		            <form class="d-flex align-items-center border-top border-200 pt-3">
		                <input class="form-control rounded-pill ms-2 fs--1" type="text" placeholder="내용을 입력하세요." />
		            </form>
                </div>
                <div class="row mt-3" id="datgeulViewDiv" style="display: none;">
                	<div class="col-1 fs--1" style="width: 20px;">
	                	<div class="avatar avatar-xl">
	                    	<img class="rounded-circle" src="<c:url value='/assets/img/team/4.jpg'/>" alt="" />
	                    </div>
	                </div>
                    <div class="col flex-1 ms-2 fs--1">
                    	<p class="mb-1 bg-200 rounded-3 p-2">
                      	익명 :
                      	내용</p>
                      	<div class="row">
	                      	<div class="col px-3">
	                      		시간 
	                      		&bull;<a href="#!">답글달기</a>  
	                      		&bull;<a href="#!">신고하기</a> 
	                      	</div>
	                      	<div class="col-auto px-3">
	                      		<a href="#!">수정</a>&bull;  
	                      		<a href="#!">삭제</a>  
		                    </div>
                      	</div>
                    </div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file = "../inc/bottom.jsp" %>