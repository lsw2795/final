<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<link href="<c:url value='/vendors/choices/choices.min.css'/>" rel="stylesheet">
<link href="<c:url value='/vendors/flatpickr/flatpickr.min.css'/>" rel="stylesheet">
<link href="<c:url value='/vendors/dropzone/dropzone.min.c.css'/>" rel="stylesheet">
<script type="text/javascript" src = "<c:url value='/js/market.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#bt1').click(function(){
			
			if($('#product-name').val().length<1){
				alert("제목을 입력하세요.");
				$('#product-name').focus();
				
				return false;
			}
			
			if($('#identification-no').val().length<1){
				alert("상품명을 입력하세요.");
				$('#identification-no').focus();
				
				return false;
			}
			
			if($('#product-summary').val().length<1){
				alert("가격을 입력하세요.");
				$('#product-summary').focus();
				
				return false;
			}
			
			if(!validate_price($("#product-summary").val())){
				alert("가격은 숫자만 입력해주세요.");
				$('#product-summary').focus();
				
				return false;
			}
			
			/* if($('#product-description').val().length<50){
				alert("상품 상세 설명은 50자 이상 입력해주세요.");
				$('#product-description').focus();
				
				return false;
			} */
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
		
</script>
 <div class="content">
          <div class="card mb-3">
            <div class="card-body">
              <div class="row flex-between-center">
                <div class="col-md">
                  <h5 class="mb-2 mb-md-0">중고거래 상품 등록</h5>
                </div>
                <div class="col-auto">
                </div>
              </div>
            </div>
          </div>
          <div class="row g-0">
              <div class="card mb-3">
                <div class="card-body">
                  <form class="dropzone dropzone-multiple p-0" id="dropzoneMultipleFileUpload" data-dropzone="data-dropzone" method="post" action="<c:url value='/market/addMarket'/>" enctype="multipart/form-data" data-options='{"acceptedFiles":"image/*"}'>
                    <div class="row gx-2">
                      <div class="col-12 mb-3">
                        <label class="form-label" for="product-name">제목</label>
                        <input class="form-control" id="product-name" name="title" type="text" value="${secondVo.title }"/>
                      </div>
                      <div class="col-12 mb-3">
                        <label class="form-label" for="identification-no">상품명</label>
                        <input class="form-control" id="identification-no" name = "product" type="text" value="${secondVo.product }"/>
                      </div>
                      <div class="col-12 mb-3">
                        <label class="form-label" for="product-summary">가격</label>
                        <input class="form-control" id="product-summary" name = "price" type="text" value="${secondVo.price }"/>
                      </div>
                      <div class="col-12 mb-3">
                      <label class="form-label" for="product-description">자세한 설명</label>
                      <div class="create-product-description-textarea">
                        <textarea class="form-control" data-tinymce="data-tinymce" name="discription" id="product-description"
                        	style="height:300px">${secondVo.discription }</textarea>
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
                      <input name="imageURL2" type="file" multiple="multiple" id="fileInput" required/>
                    </div>
                    <div class="dz-message" data-dz-message="data-dz-message"> 
	                    <img class="me-2" src="<c:url value='/assets/img/icons/cloud-upload.svg'/>" width="25" alt="" />
	                    <span class="d-none d-lg-inline">파일을 드래그하세요.</span>
                    </div>
                    <div class="dz-preview dz-preview-multiple m-0 d-flex flex-column">
                      <div class="d-flex media align-items-center mb-3 pb-3 border-bottom btn-reveal-trigger">
                        <div class="flex-1 d-flex flex-between-center">
                          <div>
                            <h6 data-dz-name="data-dz-name"></h6>
                            <div class="d-flex align-items-center">
                              <p class="mb-0 fs--1 text-400 lh-1" data-dz-size="data-dz-size"></p>
                              <div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress=""></span></div>
                            </div>
                          </div>
                          <div class="dropdown font-sans-serif">
                            <button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal dropdown-caret-none" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h"></span></button>
                            <div class="dropdown-menu dropdown-menu-end border py-2"><a class="dropdown-item" href="#!" data-dz-remove="data-dz-remove">Remove File</a></div>
                          </div>
                        </div>
                      </div>
                    </div>
                   </div>
                 </div>
               </div>
          	</div>
          <div class="card mt-3">
            <div class="card-body">
              <div class="row justify-content-between align-items-center">
                <div class="col-auto">
                  <button class="btn btn-link text-secondary p-0 me-3 fw-medium" role="button">취소</button>
                  <button class="btn btn-primary" id = "bt1" role="button">등록 </button>
                </div>
              </div>
            </div>
          </div>
          </form>
        </div>
<%@ include file="../inc/bottom.jsp" %>