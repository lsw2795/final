<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<style>
  .ck-editor__editable { height: 400px; }
  .ck-content { font-size: 12px; }
</style>
    <script src='<c:url value='/vendors/ckeditor/ckeditor.js'/>'></script>
<script>
	$(function () {
		CKEDITOR.replace('contents', {
			filebrowserUploadUrl : '${pageContext.request.contextPath}/adm/fileupload.do'
		});
	});
</script>

<form class="card">
	<div class="card-header bg-light">
		<h5 class="mb-0">자료 등록(CK Editor)</h5>
	</div>
	<div class="card-body p-0">
		<div class="border border-top-0 border-200">
			<input class="form-control border-0 rounded-0 outline-none px-x1"
				id="email-to" type="email" aria-describedby="email-to"
				placeholder="To">
		</div>
		<div class="border border-y-0 border-200">
			<input class="form-control border-0 rounded-0 outline-none px-x1"
				id="email-subject" type="text" aria-describedby="email-subject"
				placeholder="Subject">
		</div>
		


	</div>
	
    <textarea name="text" id="editor"></textarea>

	
	<div class="input-group mb-3">
		 <input type="file" class="form-control" id="inputGroupFile02" size="10">
		 <label class="input-group-text" for="inputGroupFile02">Upload</label>

	</div>
	<div>
		<p><button type="button" class="btn btn-primary">자료 등록</button></p>
	</div>
	
</form>

<%@ include file="../inc/bottom.jsp"%>