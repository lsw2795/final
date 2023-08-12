<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/css/PDScss.css'/>">
<style>
  .ck-editor__editable { height: 400px; }
  .ck-content { font-size: 12px; }
</style>
    <script src='<c:url value='/vendors/ckeditor/ckeditor.js'/>'></script>
    <script src="<c:url value='/vendors/ckeditor/lang/ko.js'/>"></script>
<script>
	$(function() {
		CKEDITOR.replace('editor', {
			filebrowserUploadUrl: '<c:url value="/admin/board/fileupload"/>'
		});
		
		$('#editCancle').click(function() {
			if(confirm("글 수정을 취소하시겠습니까?")){
				location.href = "<c:url value='/pds/list'/>"
			}
		});
		
		$('#pdsEdit').click(function() {
			if(confirm("자료를 수정하시겠습니까?")){
				$('#pdsForm').submit();
			}
		});	
		
	 });
</script>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="css/css.css">
</head>
<body>
    <div class="board_wrap">
        <div class="board_title">
            <strong>자료실</strong>
            <p>사내 자료실</p>
        </div>
    <form id="pdsForm" action="<c:url value='/pds/edit'/>" method="post" enctype="multipart/form-data">
	      <div class="board_write_wrap">
	          <div class="board_write">
	              <div class="title">
	                  <dl>
	                      <dt>제목</dt>
	                      <dd><input type="text" name="title" placeholder="제목 입력" value="${map['TITLE']}"></dd>
	                  </dl>
	              </div>
	              <div class="info">
	                  <dl>
	                      <dt>작성자</dt>
	                      <dd><input type="text" name="name" readonly="readonly" value="${map['NAME']}" ></dd>
	                  </dl>
	                  <dl>
	                      <dt>비밀번호</dt>
	                      <dd><input type="password" placeholder="비밀번호 입력"></dd>
	                      <input type="hidden" name="boardNo" value="${map['BOARD_NO']}"/>
	                  </dl>
	                  
	              </div>
	              <div class="cont">
	                  <textarea id="editor" name="content">${map['CONTENT']}</textarea>
	              </div>
	          </div>
	          <div class="bt_wrap">
	              <a href="#" class="on" id="pdsEdit">수정</a>
	              <a href="#" id="editCancle">취소</a>
	          </div>
	      </div>
	    </div>
	</form>
</body>
</html>
<%@ include file="../inc/bottom.jsp"%>