<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp"%>

<link href="<c:url value='/vendors/choices/choices.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/vendors/flatpickr/flatpickr.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/vendors/dropzone/dropzone.min.c.css'/>"
	rel="stylesheet">
<script type="text/javascript" src="<c:url value='/js/market.js'/>"></script>
<script type="text/javascript">
	/* $(function(){
		$('#bt1').click(function(){
			
			if($('#product-name').val().length<1){
				alert("제목을 입력하세요.");
				$('#product-name').focus();
				
				return false;
			}
			
			if($('#identification-no').val().length<1){
				alert("명을 입력하세요.");
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
		
	}); */
		
</script>
<style type="text/css">
.mb-2 {
	color: #0E1726;
}

.card {
	background: white;
	color: #0E1726;
}

.form-select {
	background: white;
	color: #0E1726;
}

.form-control {
	background: white;
	color: #0E1726;
}
</style>
<div class="content">
	<div class="card mb-3">
		<div class="card-body">
			<h5 class="mb-2 mb-md-0">
				<strong>자원 등록</strong>
			</h5>
		</div>
	</div>
	<div class="row g-0">
		<div class="card mb-3">
			<div class="card-body">
				<form class="dropzone dropzone-multiple p-0"
					id="update" data-dropzone="data-dropzone"
					method="post" action="<c:url value='/admin/officeProduct/addOfficeProduct'/>">
					<div class="row gx-2">
						<label class="form-label" for="product-name">종류</label> 
						<select class="form-select" aria-label="Default select example" name = "category">
							<option selected>선택하세요.</option>
							<option value="meetingRoom">회의실</option>
							<option value="noteBook">노트북</option>
							<option value="rentCar">차량</option>
						</select>
						<div class="col-12 mb-3" s>
							<br> 
							<label class="form-label" for="product-name">자원 이름</label> 
							<input class="form-control" id="name" name="name" type="text" />
						</div>
						<div class="col-12 mb-3">
							<label class="form-label" for="product-description">설명</label>
							<div class="create-product-description-textarea">
								<textarea class="form-control" data-tinymce="data-tinymce"
									name="discription" id="product-description"
									style="height: 200px"></textarea>
							</div>
							<br> 
							<label class="form-label" for="product-name">담당자</label>
							<input class="form-control" id="product-name" name="manager"
								type="text" />
						</div>
					</div>
					<br> <label class="form-label" for="product-name">자원 상태</label>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="state" name = "state" value="1"> 
						<label class="form-check-label" for="inlineCheckbox1">이용 가능</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="state" name = "state" value="2"> 
						<label class="form-check-label" for="inlineCheckbox2">이용 불가</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="state" name = "state" value="3" disabled> 
						<label class="form-check-label" for="inlineCheckbox3">3(disabled)</label>
					</div>
				</div>
			</div>
		</div>
		<div class="card mt-3">
			<div class="card-body">
				<div class="row justify-content-between align-items-center">
					<div class="col-auto">
						<button class="btn btn-link text-secondary p-0 me-3 fw-medium"
							role="button" style="color:#0E1726;">취소</button>
						<button class="btn btn-primary" id="bt1" role="button">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</div>
<%@ include file="../../inc/adminBottom.jsp"%>