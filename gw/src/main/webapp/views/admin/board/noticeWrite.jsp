<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script src="<c:url value='/vendors/tinymce/tinymce.min.js'/>"></script>
<div class="card mb-3">
	<div class="card-body position-relative admindefault">
		<div class="row">
			<div class="col-lg-8">
				<h3 class="admindefault">공지사항</h3>
			</div>
		</div>
	</div>
</div>
            <div class="card-body py-2 admindefault">
				<form>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto">
					        <label class="form-label" for="title">제목</label>
					    </div>
					    <div class="col-md-11">
					        <input type="text" class="form-control admindefault" id="title" />
					    </div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto">
							<label class="form-label" for="basic-form-gender">내용</label>
						</div>
						<div class="col-md-11 min-vh-50 align-items-center">
							 <textarea class="tinymce d-none" data-tinymce="data-tinymce" name="content"></textarea>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
						<div class="col-md-auto adminempdiv3">
							<label class="form-label">첨부 파일</label>
						</div>
						<div class="col-md-4">	 
							<input type="file" class="form-control admindefault"/>
						</div>
					</div>
					<div style="text-align: center;">
					<input type="submit" value="등록" class="btn btn-primary"/>
					<input type="button" value="취소" class="btn btn-primary"/>
					</div>
				</form>
			</div>
<%@ include file='../../inc/adminBottom.jsp'%>