<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script src="<c:url value='/vendors/ckeditor/ckeditor.js'/>"></script>
<script src="<c:url value='/vendors/ckeditor/lang/ko.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#title').focus();
		
		$('#btnCancel').click(function(){
			location.href	= "<c:url value='/admin/board/faqList'/>";
		});
		
		$('input[type=submit]').click(function(){
			if($('input[name=title]').val().trim().length<1){
				alert("제목을 입력하세요.");
				$('input[name=title]').focus();
				return false;
			}
			
			if(CKEDITOR.instances.editor.getData() =='' 
			        || CKEDITOR.instances.editor.getData().length ==0){
			    alert("내용을 입력해주세요.");
			    $("#editor").focus();
			    return false;
			}
			
			$.ajax({
	            url: "<c:url value='/admin/board/ajaxInsertFaq'/>",
	            type:'post',
				data: $('#insertFaq').serializeArray(),
				dataType:'json',
	            success: function (res) {
	            	if(res>0){
                   		alert("FAQ 등록이 완료되었습니다.");
                   		$('#exampleModal').modal('hide'); 
                   		location.href="<c:url value='/admin/board/faqList'/>";
	            	}
	            },
	            error:function(xhr,status,error){
	                alert(status+" : "+error);
	            } 
	        });//ajax
			
		});		
	});
</script>
<div class="modal fade" id="exampleModal" tabindex="-1" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content admindefault" style="width: 700px;">
      <div class="modal-header">
        <h5 class="modal-title admindefault" id="exampleModalLabel">FAQ 등록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<table class="table table-bordered">
			<colgroup>
				<col style="width: 20%;" />
				<col style="width: 80%;" />
			</colgroup>
			<tbody id="table-contact-body">
			<form id="insertFaq">
				<tr class="adminemptr">
					<td class="align-middle">FAQ 제목</td>
					<td class="align-middle">
						<input type="text" class="form-control admindefault" id="title" name="title"/>
					</td>
				</tr>
				<tr class="adminemptr">
					<td class="align-middle">FAQ 내용</td>
					<td class="align-middle">
						<textarea id="editor" name="content"></textarea>
					</td>
				</tr>
			</form>
			</tbody>
		</table>
      </div>
      <div class="modal-footer" style="text-align: center;">
        <input type="submit" value="등록" class="btn btn-primary">
        <input type="button" value="취소" class="btn btn-secondary" id="btnCancel">
      </div>
    </div>
  </div>
</div> 
<script>
	CKEDITOR.replace('editor', {
		filebrowserUploadUrl: '<c:url value="/admin/board/fileupload"/>'
	});
</script>