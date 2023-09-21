<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
관리자뷰 - FAQ 등록&수정 뷰
내용 : FAQ 일반등록, 수정, CKEDITOR4 API 이용한 이미지 등록
컨트롤러 : com.ez.gw.board.controller.FaqController
작성자 : 송영은
작성일 : 2023.08
 -->   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value='/assets/css/theme.css'/>" rel="stylesheet" id="style-default">
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script src="<c:url value='/vendors/ckeditor/ckeditor.js'/>"></script>
<script src="<c:url value='/vendors/ckeditor/lang/ko.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#title').focus();
		
		$('#btnCancel').click(function(){
			self.close();
		});
		
		$('input[type=submit]').click(function(){
			var title=$('#title').val();
			var content=CKEDITOR.instances.editor.getData();
			//alert(title+" : "+content);
				
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
			
			var boardNo=$('#boardNo').val();
			if(boardNo==0 || boardNo==''){ //등록 ajax
				$.ajax({
		            url: "<c:url value='/admin/board/ajaxInsertFAQ'/>",
		            type:'get',
					data: {
						title: title,
						content: content
					},
					dataType:'json',
		            success: function (res) {
		            	if(res>0){
			            	alert('FAQ 등록이 완료되었습니다.');
			            	self.close();
		            	}
		            },
		            error:function(xhr,status,error){
		                alert(status+" : "+error);
		            } 
		        });//ajax
			}else if(boardNo!=0){ //수정 ajax
				$.ajax({
		            url: "<c:url value='/admin/board/ajaxUpdateFAQ'/>",
		            type:'get',
					data: {
						boardNo: boardNo,
						title: title,
						content: content
					},
					dataType:'json',
		            success: function (res) {
		            	if(res>0){
			            	alert('FAQ 수정이 완료되었습니다.');
			            	self.close();
		            	}
		            },
		            error:function(xhr,status,error){
		                alert(status+" : "+error);
		            } 
		        });//ajax
			}
		});		
	});
</script>
<c:if test="${!empty param.boardNo}">
	<c:set var="btLabel" value="수정" />
	<c:set var="url" value="/admin/board/faqEdit" />
	<c:set var="no" value="${param.boardNo}" />	
</c:if>
<c:if test="${empty param.boardNo}">
	<c:set var="btLabel" value="등록" />
	<c:set var="url" value="/admin/board/faqWrite" />
	<c:set var="no" value="0" />	
</c:if>
<div class="card mb-3">
   <div class="card-header">
     <div class="row flex-between-end">
       <div class="col-auto align-self-center">
         <h5 class="mb-0" data-anchor="data-anchor">FAQ ${btLabel }</h5>
       </div>
     </div>
   </div>
   <div class="card-body bg-light">
     <div class="tab-content">
       <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-098d01fc-d98f-4993-8b04-531ca5667534" id="dom-098d01fc-d98f-4993-8b04-531ca5667534">
        <form name="frmWrite" method="post" enctype="multipart/form-data" action="<c:url value='${url}'/>">	
         <div class="mb-3">
           <label class="form-label" for="title">제목</label>
           <input class="form-control" id="title" name="title" type="text" value="${boardVo.title }"/>
         </div>
         <div class="mb-3">
           <label class="form-label" for="editor">내용</label>
           <textarea class="form-control" id="editor" name="content">${boardVo.content }</textarea>
         </div>
         <!-- hidden -->
         <input type="hidden" name="boardNo" id="boardNo" value="${boardVo.boardNo }"/>
         </form>
       </div>
     </div>
   </div>
   <div class="card-footer" style="text-align: center;">
     <input type="submit" value="${btLabel }" class="btn btn-primary" id="btnSubmit">
     <input type="button" value="취소" class="btn btn-secondary" id="btnCancel">
   </div>
 </div>
<script>
	CKEDITOR.replace('editor', {
		filebrowserUploadUrl: '<c:url value="/admin/board/fileupload"/>'
	});
</script>