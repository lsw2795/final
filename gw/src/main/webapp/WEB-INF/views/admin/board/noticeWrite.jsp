<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
관리자뷰 - 공지사항 등록&수정 뷰
내용 : CKEDITOR4 API를 이용한 이미지 등록, 첨부파일 등록, 첨부파일 삭제
컨트롤러 : com.ez.gw.board.controller.NoticeController	  
작성자 : 송영은
작성일 : 2023.08
 -->  	    
<%@ include file='../../inc/adminTop.jsp'%>
<link rel="stylesheet" href="<c:url value='/css/adminempform.css'/>">
<script src="<c:url value='/vendors/ckeditor/ckeditor.js'/>"></script>
<script src="<c:url value='/vendors/ckeditor/lang/ko.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#title').focus();
		
		$('#btnCancel').click(function(){
			location.href	= "<c:url value='/admin/board/noticeList'/>";
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
		});		
		
		$('#btnAddFile').click(function(){
			var num = $('input[type=file]').length+1;
			 var newInput = $("<input type='file' name='files" + num + "' class='form-control admindefault' style='margin:5px 0px;'/>");
			 $('#inputFiles').append(newInput);
		});
		
		$('#btnDelFile').click(function(){
			 $('input[type=file]:last').remove();
		});

		$('.FileDelete').click(function(){
			$(this).prev().remove();
	        $(this).remove();
	      
		});
	});
	
	function FileDelete(index) {
	    var pdsNo = $('#pdsNo' + index).val();
	    var oldFileName = $('#oldFileName'+ index).val();
	    //alert("pdsNo: " + pdsNo+", oldFileName: "+oldFileName);
	    if(confirm('기존 첨부파일을 삭제하시겠습니까?')){
		    $.ajax({
	            url: "<c:url value='/admin/board/ajaxNoticeFileDelete'/>",
	            type: "get",
	            data: { 
	            	pdsNo: pdsNo,
	            	oldFileName: oldFileName
	            },
	            success: function (res) {
	                if (res> 0) {                	
	                    alert('해당 첨부파일 삭제가 완료되었습니다.');
	                }
	            },
	            error:function(xhr,status,error){
	                alert(status+" : "+error);
	            } 
	        });//ajax
	    }
	}
</script>
<c:if test="${!empty param.boardNo}">
	<c:set var="btLabel" value="수정" />
	<c:set var="url" value="/admin/board/noticeEdit" />
	<c:set var="no" value="${param.boardNo}" />	
</c:if>
<c:if test="${empty param.boardNo}">
	<c:set var="btLabel" value="등록" />
	<c:set var="url" value="/admin/board/noticeWrite" />
	<c:set var="no" value="0" />	
</c:if>
<div class="card mb-3">
	<div class="card-body position-relative admindefault">
		<div class="row">
			<div class="col-lg-8">
			<a class="btn btn-falcon-default admindefault" data-bs-toggle="tooltip" 
				data-bs-placement="top" href="<c:url value='/admin/board/noticeList'/>">
				<span class="fas fa-arrow-left"></span>
			</a>&nbsp;&nbsp;&nbsp;
			<span class="admindefault" style="font-size: 23px; font-weight: bold;">공지사항</span>
			</div>
		</div>
	</div>
</div>
            <div class="card-body py-2 admindefault">
				<form name="frmWrite" method="post" enctype="multipart/form-data"
				action="<c:url value='${url}'/>">	
				<!-- 수정 처리시 no,oldFileName가 필요하므로 hidden 필드에 넣어서 보내준다 -->
				<c:if test="${!empty param.boardNo}">
				<input type="hidden" name="boardNo" value="${map['BOARD_NO']}">
				</c:if>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
					        <label class="form-label" for="title">제목</label>
					    </div>
					    <div class="col-md-10">
					        <input type="text" class="form-control admindefault boardbox" id="title" name="title" value="${map['TITLE']}"/>
					    </div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
					    <div class="col-md-auto adminempdiv6">
							<label class="form-label" for="content">내용</label>
						</div>
						<div class="col-md-auto col-md-10">
							<textarea id="editor" name="content">${map['CONTENT']}</textarea>
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
						<div class="col-md-auto adminempdiv3">
							<label class="form-label">첨부 파일</label>
						</div>
						<div class="col-md-5" style="margin-left: 7px;">
							<c:if test="${empty pdsList}">
		                      첨부파일이 없습니다.
		                      </c:if>
		                       <c:if test="${!empty pdsList }">
		                       <c:set var="i" value="0"/>
			                      <c:forEach var="pdsVo" items="${pdsList }" varStatus="status">
				                       <span>
					                       <img alt="첨부파일 이미지" src="<c:url value='/images/file.gif'/>">
					                     	${fileInfoArr[status.index]}&nbsp;&nbsp;
			                     	   </span>
				                      <input type="button" onclick="FileDelete(${i})" class="btn-close FileDelete" style="font-size: 18px;"/>
				                      <input type="hidden" name="pdsNo" id="pdsNo${i }" value="${pdsVo.pdsNo }"/> 
			                     	  <input type="hidden" name="oldFileNames" id="oldFileName${i }" value="${pdsVo.fileName }">
			                     	   <br>
			                      	<c:set var="i" value="${i+1 }"/>
			                      </c:forEach>
		                     </c:if>
							<input type="button" id="btnAddFile" value="추가" class="btn btn-outline-success">
							<input type="button" id="btnDelFile" value="제거" class="btn btn-outline-danger">
						</div>
					</div>
					<div class="row mb-3 d-flex align-items-center">
						<div class="col-md-auto adminempdiv19"></div>
						<div class="col-md-4" id="inputFiles" style="margin-left: 7px;"></div>
					</div>
					<div style="text-align: center;">
						<input type="submit" value="${btLabel}" class="btn btn-primary"/>
						<input type="button" id="btnCancel" value="취소" class="btn btn-secondary"/>
					</div>
				</form>
			</div>
<script>
	CKEDITOR.replace('editor', {
		filebrowserUploadUrl: '<c:url value="/admin/board/fileupload"/>'
	});
</script>
<%@ include file='../../inc/adminBottom.jsp'%>