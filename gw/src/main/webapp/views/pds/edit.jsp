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
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>작성자</dt>
                        <dd><input type="text" placeholder="작성자 입력"></dd>
                    </dl>
                    <dl>
                        <dt>비밀번호</dt>
                        <dd><input type="password" placeholder="비밀번호 입력"></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea id="editor" name="content">${map['CONTENT']}</textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <a href="view.html" class="on">수정</a>
                <a href="#" id="editCancle">취소</a>
            </div>
        </div>
    </div>
</body>
</html>
<%@ include file="../inc/bottom.jsp"%>