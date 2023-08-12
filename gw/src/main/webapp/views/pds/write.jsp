<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- pds css  -->
<link rel="stylesheet" href="<c:url value='/css/PDScss.css'/>">
<!-- ck 에디터  -->
<script src='<c:url value='/vendors/ckeditor/ckeditor.js'/>'></script>
<script src="<c:url value='/vendors/ckeditor/lang/ko.js'/>"></script>
<style>
  .ck-editor__editable { height: 400px; }
  .ck-content { font-size: 12px; }
</style>
<script>
	$(function() {
		CKEDITOR.replace('editor', {
			filebrowserUploadUrl: '<c:url value="/admin/board/fileupload"/>'
		});
		
		$('#writeCancle').click(function() {
			if(confirm("글 작성을 취소하시겠습니까?")){
				location.href = "<c:url value='/pds/list'/>"
			}
		});	
		
	});
	
    // 파일 추가
    function addFile() {
        const fileDiv = document.createElement('div');
        fileDiv.innerHTML =`
            <div class="file_input">
                <input type="text" readonly />
                <label> 첨부파일
                    <input type="file" name="files" onchange="selectFile(this);" />
                </label>
            </div>
            <button type="button" onclick="removeFile(this);" class="btns del_btn"><span>삭제</span></button>
        `;
        document.querySelector('.file_list').appendChild(fileDiv);
    }
    
    // 파일 삭제
    function removeFile(element) {
        const fileAddBtn = element.nextElementSibling;
        if (fileAddBtn) {
            const inputs = element.previousElementSibling.querySelectorAll('input');
            inputs.forEach(input => input.value = '')
            return false;
        }
        element.parentElement.remove();
    }
    
    // 파일 선택
    function selectFile(element) {

        const file = element.files[0];
        const filename = element.closest('.file_input').firstElementChild;

        // 1. 파일 선택 창에서 취소 버튼이 클릭된 경우
        if ( !file ) {
            filename.value = '';
            return false;
        }

        // 2. 파일 크기가 10MB를 초과하는 경우
        const fileSize = Math.floor(file.size / 1024 / 1024);
        if (fileSize > 100) {
            alert('100MB 이하의 파일로 업로드해 주세요.');
            filename.value = '';
            element.value = '';
            return false;
        }

        // 3. 파일명 지정
        filename.value = file.name;
    }

</script>

    <div class="board_wrap">
        <div class="board_title">
            <strong>자료실</strong>
            <p>사내 자료실</p>

        </div>
    <form id="saveForm" action="<c:url value='/pds/write'/>" method="post" enctype="multipart/form-data">
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
                <div class="file_list">
                    <div>
                        <div class="file_input">
                            <input type="text" readonly />
                            <label> 첨부파일
                                <input type="file" name="files" onchange="selectFile(this);" />
                            </label>
                        </div>
                        <button type="button" onclick="removeFile(this);" class="btns del_btn"><span>삭제</span></button>
                        <button type="button" onclick="addFile();" class="btns fn_add_btn"><span>파일 추가</span></button>
                    </div>
                </div>
	            <div class="bt_wrap">
	                <a href="view.html" class="on">등록</a>
	                <a href="#" id="writeCancle">취소</a>
	            </div>
	        </div>
	    </div>
    </form>
<%@ include file="../inc/bottom.jsp"%>