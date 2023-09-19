<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/css/PDScss.css'/>">
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
                location.href = "<c:url value='/pds/list'/>";
            }
        });  
        
        $('#pdsWrite').click(function() {
            // 유효성 검사
            if($('input[name=title]').val().trim().length < 1){
                alert("제목을 입력하세요.");
                $('input[name=title]').focus();
                return false;
            }
            
            // 입력 내용 받기 = CKEDITOR.instances.textarea태그의 id.getData();
            if(CKEDITOR.instances.editor.getData() == '' || CKEDITOR.instances.editor.getData().length == 0){
                alert("내용을 입력해주세요.");
                $("#editor").focus();
                return false;
            }
            
            if(confirm("자료를 등록하시겠습니까?")){
                $('#pdsForm').submit();
            }
        });  
    });
    
    // 파일 추가
    var fileIndex = 1; // 파일 name 인덱스

    function addFile() {
        console.log(fileIndex); // 인덱스 증가 로그
        
        const fileDiv = document.createElement('div');
        fileDiv.innerHTML = '<div class="file_input">' +
                            '<input type="text" readonly />' +
                            '<label> 첨부파일' +
                            '<input name="files[' + fileIndex + ']" type="file" onchange="selectFile(this);" />' +
                            '</label>' +
                            '</div>' +
                            '<button type="button" onclick="removeFile(this);" class="btns del_btn"><span>삭제</span></button>';
        document.querySelector('.file_list').appendChild(fileDiv);
        fileIndex++;
    }

    // 파일 삭제
    function removeFile(element) {
        const fileAddBtn = element.nextElementSibling;
        if (fileAddBtn) {
            const inputs = element.previousElementSibling.querySelectorAll('input');
            inputs.forEach(input => input.value = '');
            return false;
        }
        element.parentElement.remove();
    }

    // 파일 선택
    function selectFile(element) {
        const file = element.files[0];
        const filename = element.closest('.file_input').firstElementChild;

        // 1. 파일 선택 창에서 취소 버튼이 클릭된 경우
        if (!file) {
            filename.value = '';
            return false;
        }

        // 2. 파일 크기가 100MB를 초과하는 경우
        const fileSize = Math.floor(file.size / 1024 / 1024);
        if (file.size === 0) { // 0byte
            alert('파일 크기가 0인 파일은 업로드할 수 없습니다.');
            filename.value = '';
            element.value = '';
            return false;
        } else if (fileSize > 100) {
            alert('100MB 이하의 파일로 업로드해 주세요.');
            filename.value = '';
            element.value = '';
            return false;
        }

        // 3. 파일명 지정
        filename.value = file.name;

        // 4. 파일 첨부 여부 확인
        const fileAddBtn = filename.parentElement.nextElementSibling;
        if (fileAddBtn) {
            const inputs = filename.parentElement.querySelectorAll('input[type="file"]');
            const isFileAttached = Array.from(inputs).some(input => input.files.length > 0);
            if (!isFileAttached) {
                filename.value = '';
            }
        }
    }
</script>

<div class="board_wrap">
    <div class="board_title">
        <strong>자료실</strong>
        <p>사내 자료실</p>
    </div>
    <form id="pdsForm" action="<c:url value='/pds/write'/>" method="post" enctype="multipart/form-data">
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" name="title" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>작성자</dt>
                        <dd><input type="text" name="writer" value="${vo.name}" readonly="readonly"></dd>
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
                            <input type="file" name="files[0]" onchange="selectFile(this);" />
                        </label>
                    </div>
                    <button type="button" onclick="removeFile(this);" class="btns del_btn"><span>삭제</span></button>
                    <button type="button" onclick="addFile();" class="btns fn_add_btn"><span>파일 추가</span></button>
                </div>
            </div>
            <div class="bt_wrap">
                <a href="#" class="on" id="pdsWrite">등록</a>
                <a href="#" id="writeCancle">취소</a>
            </div>
        </div>
    </form>
</div>
<%@ include file="../inc/bottom.jsp"%>
