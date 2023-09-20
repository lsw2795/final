<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 동호회 게시판 수정페이지 
	-clubBoardController
-->
<%@ include file="../inc/top.jsp" %>
<link href="<c:url value='/vendors/choices/choices.min.css'/>" rel="stylesheet">
<link href="<c:url value='/vendors/flatpickr/flatpickr.min.css'/>" rel="stylesheet">
<link href="<c:url value='/vendors/dropzone/dropzone.min.c.css'/>" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		$('#btn').click(function(){
			event.preventDefault();
			
			if($('#title').val().length<1){
				alert("제목을 입력하세요.");
				$('#title').focus();
				
				return false;
			}
			
			if($('#content').val().length<1){
				alert("내용을 입력하세요.");
				$('#content').focus();
				
				return false;
			}
			
			$('form[name="clubBoardFrm"]').submit();
			
		});
		
		$("#fileInput").on("change", function() {
			  var imagePreview = $(".dz-message");
			  imagePreview.empty();
			  
			  var files = $(this)[0].files;
              for (var i = 0; i < files.length; i++) {
                  var file = files[i];
                  var reader = new FileReader();
                  
                  reader.onload = function(e) {
                      var img = $("<img>").attr("src", e.target.result).css({
                          width: "150px", // 이미지 크기 조절
                          margin: "10px" // 이미지 간격 조절
                      });
                      imagePreview.append(img);
                  };
                  
                  reader.readAsDataURL(file);
		  }
	  });
	});
	
	function deleteImg(imgName, a) {
	    var editImg = $(a).parent().parent();
	    
	    // 새로운 input 태그를 동적으로 생성하고 폼 내에 추가합니다.
	    var input = $("<input>").attr({
	        type: "text",
	        name: "delImg",
	        value: imgName
	    });
	    $('form[name="clubBoardFrm"]').append(input);
	    
	    // 원래의 요소를 제거합니다.
	    $(a).parent().remove();
	}
</script>

<div class="contentBody">
   	<div class="card mb-3">
       	<div class="card-body">
            <div class="row flex-between-center">
                <div class="col-md">
                  <h5 class="mb-2 mb-md-0">게시글 수정</h5>
                </div>
                <div class="col-auto">
	                <button class="btn btn-falcon-default btn-sm"type="button">
	                	<a href="<c:url value='/club/clubBoard?clubNo=${param.clubNo}'/>">
	                		<span class="fas fa-arrow-left"></span>
	                	</a>
	                </button>
                </div>
              </div>
        </div>
     </div>
     <div class="row g-0">
        <div class="card mb-3">
           	<div class="card-body">
                <form class="dropzone dropzone-multiple p-0" id="dropzoneMultipleFileUpload" data-dropzone="data-dropzone" 
                  	name="clubBoardFrm"	method="post" action="<c:url value='/club/editClubBoard'/>" enctype="multipart/form-data" data-options='{"acceptedFiles":"image/*"}'>
                 <div class="row gx-2">
                    <input type="hidden" name="clubNo" value="${param.clubNo }">
                    <input type="text" name="boardNo" value="${param.boardNo }">
                      <div class="col-12 mb-3">
                        <label class="form-label" for="title">제목</label>
                        <input class="form-control" id="title" name="title" type="text" value="${map['TITLE']}"/>
                      </div>
                      <div class="col-12 mb-3">
                      	<label class="form-label" for="content">내용</label>
                      	<div class="create-product-description-textarea">
                        	<textarea class="form-control" data-tinymce="data-tinymce" name="content" id="content"
                        		style="height:300px">${map['CONTENT']}</textarea>
                      	</div>
                   	</div>
                 </div>
	        </div>
	    </div>
        <div class="card mb-3">
            <div class="card-header bg-light">
                  <h6 class="mb-0">이미지 추가</h6>
            </div>
            <div class="card-body">
                <div class="dropzone dropzone-multiple p-0" id="dropzoneMultipleFileUpload" data-dropzone="data-dropzone" data-options='{"acceptedFiles":"image/*"}'>
                    <div class="fallback">
                      <input name="imageURL2" type="file" multiple="multiple" id="fileInput"/>
                    </div>
                    <div class="dz-message" data-dz-message="dz-message"> 
	                    <img class="me-2" src="<c:url value='/assets/img/icons/cloud-upload.svg'/>" width="25" alt="" />
	                    <span class="d-none d-lg-inline">파일을 드래그하세요.</span>
                    </div>
                    <div class="dz-preview dz-preview-multiple m-0 d-flex flex-column">
                      <div class="d-flex media align-items-center mb-3 pb-3 border-bottom btn-reveal-trigger">
                        <div class="flex-1 d-flex flex-between-center" id="editImg">
                          <c:forEach var="imgMap" items="${list }">
					        	<div>
					        		<img src="<c:url value='/images/file.gif' />" alt="파일그림">
										${imgMap['FILENAME']}
									<a href="#!" onclick="deleteImg('${imgMap['FILENAME']}',this)">
										<span class="badge rounded-pill text-bg-primary">
				                        	삭제
				                        </span>
			                        </a>
			                    </div>
	                  	  </c:forEach>
                          <div>
                            <h6 data-dz-name="data-dz-name"></h6>
                            <div class="d-flex align-items-center">
                              <p class="mb-0 fs--1 text-400 lh-1" data-dz-size="data-dz-size"></p>
                              <div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress=""></span></div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
            </div>
        </div>
     </div>
     <div class="card mb-3">
       <div class="card-body">
         <div class="row justify-content-between align-items-center">
           <div class="col-auto">
             <button class="btn btn-link text-secondary p-0 me-3 fw-medium" role="button">취소</button>
             <button class="btn btn-primary" id ="btn" role="button">저장 </button>
           </div>
         </div>
       </div>
     </div>
</div>
</form>
<%@ include file="../inc/bottom.jsp" %>