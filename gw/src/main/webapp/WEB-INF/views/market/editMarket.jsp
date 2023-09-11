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
			// 선택된 파일의 확장자 확인
	        var allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i; // 허용할 확장자 목록
	        var fileInput = $('#uploadfile');
	        
	        // 여기에서 다른 유효성 검사 로직을 추가할 수 있습니다.
	        if($('#product-name').val().length<1){
				alert("제목을 입력하세요.");
				$('#product-name').focus();
				
				return false;
			}else if($('#identification-no').val().length<1){
				alert("상품명을 입력하세요.");
				$('#identification-no').focus();
				
				return false;
			}else if($('#product-summary').val().length<1){
				alert("가격을 입력하세요.");
				$('#product-summary').focus();
				
				return false;
			}else if(!validate_price($("#product-summary").val())){
				alert("가격은 숫자만 입력해주세요.");
				$('#product-summary').focus();
				
				return false;
			}else if($('#password').val().length<1){
				alert("비밀번호를 입력해주세요.");
				$('#password').focus();
				
				return false;
			}else if($('#pwdCheck').val() ==='N'){
				alert("비밀번호가 다릅니다.");
				return false;
			}/* else if (!allowedExtensions.exec(fileInput.val())) {
	            alert('이미지 파일(.jpg, .jpeg, .png)만 업로드 가능합니다.');
	            fileInput.val(''); // 파일 선택 창 비우기
	            return false;
	        } */
	        
	        if($('#soldout').is(':checked')){
	        	$('#soldout').val('Y');
	        }    
		});
	        
		/* $('#uploadfile').click(function(){
			$('.dz-message').empty();
		}); */

		 $("#uploadfile").on("change", function() {
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
                 $('input[type="file"]').addClass('default-style');                 
		  }
	  });
		
		$('#password').keyup(function(){
			$.ajax({
				url:"<c:url value='/market/ajaxCheckPwd'/>",  
				type:"get",
				dataType:"JSON",
				data:{pwd : $('#password').val()},
				success:function(res){
					$('#check').empty();
					var str = "";
					if(res!=1){
						str+= "<span style='font-weight : bold; color :red'>비밀번호가 일치하지 않습니다.</span>";
						$('#pwdCheck').val('N');
					}else{
						str+= "<span style='font-weight : bold; color :green'>비밀번호 확인 완료</span>";
						$('#pwdCheck').val('Y');
					}
					$('#check').append(str);
				},
				error:function(xhr, status, error){
					alert(status + ":" + error);
				}
			});
		});  
	});
</script>
<style type="text/css">
.mypageempdiv4 {
	margin : 0px;
}

.fallback {
    display: flex;
    justify-content: flex-start;
}



input[type="file"] {
    color: transparent; 
    background-color: transparent; 
    border: none; 
    outline: none; 
}

input[type="file"].default-style {
    color: initial;
    background-color: initial;
    border: initial;
    outline: initial;
}
</style>
 <div class="content">
       <form class="dropzone dropzone-multiple p-0" id="dropzoneMultipleFileUpload" data-dropzone="data-dropzone" method="post" action="<c:url value='/market/editMarket'/>" enctype="multipart/form-data" data-options='{"acceptedFiles":"image/*"}'>
          <div class="card mb-3">
            <div class="card-body">
              <div class="row flex-between-center">
                <div class="col-md">
                  <h5 class="mb-2 mb-md-0">중고거래 상품 수정</h5>
                  <input type="hidden" name= "tradeNo" value="${vo['TRADE_NO'] }"/>
                </div>
                <div class="col-auto">
                </div>
              </div>
            </div>
          </div>
          <div class="row g-0">
              <div class="card mb-3">
                <div class="card-body">
                    <div class="row gx-2">
                      <div class="col-12 mb-3"s>
                        <label class="form-label" for="product-name">제목</label>
                        <input class="form-control" id="product-name" name="title" type="text" value="${vo['TITLE'] }"/>
                      </div>
                      <div class="col-12 mb-3">
                        <label class="form-label" for="identification-no">상품명</label>
                        <input class="form-control" id="identification-no" name = "product" type="text" value="${vo['PRODUCT'] }"/>
                      </div>
                      <div class="col-12 mb-3">
                        <label class="form-label" for="product-summary">가격</label>
                        <input class="form-control" id="product-summary" name = "price" type="text" value="${vo['PRICE'] }"/>
                      </div>
                      <div class="col-12 mb-3">
                        <label class="form-label" for="product-summary">비밀번호</label>
                        <input class="form-control" id="password" name = "pwd" type="password"/>
                        <input type="hidden" id="pwdCheck">
                        <label id="check"></label>
                      </div>
                      <div class="col-12 mb-3">
					    <div class="col-md-auto mypageempdiv4">
							<label class="form-label" >거래 완료 여부</label>
						</div> 
						<div class="col-md-6 mypagespan">
					        <div class="form-check">
		                        <label class="form-check-label mb-0" for="marriedFlagY">거래완료</label>
		                        <input type="checkbox" class="form-check-input" id="soldout"  name="selFlag" value="${vo['SELFLAG'] }"/>
	                       </div>
	                       <span class="mypagehyphen"></span>
				    	</div>
					</div>
                      <div class="col-12 mb-3">
                      <label class="form-label" for="product-description">자세한 설명</label>
                      <div class="create-product-description-textarea">
                        <textarea class="form-control" data-tinymce="data-tinymce" name="discription" id="product-description"
                        	style="height:300px">${vo['DISCRIPTION'] }</textarea>
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
	                <c:if test="${!empty fileList }">
                    <div class="fallback">
                      <input name="imageURL2" type="file" multiple="multiple" id="uploadfile" />
                    </div>
                    <div class="dz-message" data-dz-message="data-dz-message"> 
	                <c:forEach var="file" items="${fileList }">
	               	 <img src = "<c:url value='/market/upload/${file.imageURL }'/>"
	               	 	style="max-width:240px; max-height:200px">
                    </c:forEach>
                    </div>
                    <span class="mb-0">첨부파일 ${fileList.size() } 개</span>
	                </c:if>
                    <div class="dz-preview dz-preview-multiple m-0 d-flex flex-column">
                      <div class="d-flex media align-items-center mb-3 pb-3 border-bottom btn-reveal-trigger">
                        <div class="flex-1 d-flex flex-between-center">
                          <div>
                            <h6 data-dz-name="data-dz-name"></h6>
                            <div class="d-flex align-items-center">
                              <p class="mb-0 fs--1 text-400 lh-1" data-dz-size="data-dz-size"></p>
                              <div class="dz-progress"
                              	><span class="dz-upload" data-dz-uploadprogress=""></span></div>
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
                  <button class="btn btn-primary" id = "bt1" role="button">수정 </button>
                </div>
              </div>
            </div>
          </div>
          </form>
        </div>
<%@ include file="../inc/bottom.jsp" %>