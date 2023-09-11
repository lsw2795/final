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
	var bool = false;
	 $(function(){
		$('#bt1').click(function(){
			
			if($('#name').val().length<1){
				alert("자원 이름을 입력하세요.");
				$('#product-name').focus();
				
				return false;
			}
			
			
			if($('#category').val().length<1){
				alert("자원 종류를 선택하세요.");
				$('#category').focus();
				
				return false;
			}
			
			if($('#product-description').val().length<1){
				alert("자원 내용을 입력해주세요.");
				$('#product-description').focus();
				
				return false;
			}
			
			if($('#product-manager').val().length<1){
				alert("담당자를 기재해주세요.");
				$('#product-manager').focus();
				
				return false;
			}
			
			if(!$('input[name=state]').is(':checked')){
				alert("자원 상태를 선택해주세요.");
				
				return false;
			}
			
			if(!bool){
				alert("담당자가 없습니다.");
				return false;
			}
			
		});
			$('#product-manager').keyup(function(){
				$.ajax({
					url:"<c:url value='/admin/officeProduct/ajaxManagerCheck'/>",
					type:"get",
					dataType:"JSON",
					data:{manager:$('#product-manager').val()},
					success:function(result){
						$('#check').empty();
						
						var str = "";
						if(result ==1){
							str += "<span style='font-weight : bold; color :green'>사원 확인</span>"
							bool = true;
						}else{
							str += "<span style='font-weight : bold; color :red'>존재하지 않는 사원입니다.</span>"
							bool = false;
						}
							$('#check').append(str);
							
					},
					error:function(xhr, status, error){
						alert(status + " : " + error);
					}
					
				});
			});
	}); 
	
	function checkOnlyOne(element){
		const checkboxes = document.getElementsByName("state");
		  
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  element.checked = true;
	}
	
	function checkManager(){
		
	}
</script>
<style type="text/css">
.mb-2 {
	color: #0E1726;
}

.admin-card {
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
	<div class="card admin-card mb-3">
		<div class="card-body">
			<h5 class="mb-2 mb-md-0">
				<strong>자원 등록</strong>
			</h5>
		</div>
	</div>
	<div class="row g-0">
		<div class="card admin-card mb-3">
			<div class="card-body">
				<form class="dropzone dropzone-multiple p-0"
					id="update" data-dropzone="data-dropzone"
					method="post" action="<c:url value='/admin/officeProduct/addOfficeProduct'/>">
					<div class="row gx-2">
						<label class="form-label" for="product-name">종류</label> 
						<select class="form-select" aria-label="Default select example" id = "category" name = "category">
							<option value="">선택하세요.</option>
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
							<input class="form-control" id="product-manager" name="manager"
								type="text" />
							<label id = "check"></label>
						</div>
					</div>
					<br> <label class="form-label" for="product-name">자원 상태</label>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="state" name = "state" value="1"  onclick='checkOnlyOne(this)'> 
						<label class="form-check-label" for="inlineCheckbox1">이용 가능</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="state" name = "state" value="2" onclick='checkOnlyOne(this)'> 
						<label class="form-check-label" for="inlineCheckbox2">이용 불가</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="state" name = "state" value="3" onclick='checkOnlyOne(this)'> 
						<label class="form-check-label" for="inlineCheckbox3">관리자 문의</label>
					</div>
				</div>
			</div>
		</div>
		<div class="card admin-card mt-3">
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