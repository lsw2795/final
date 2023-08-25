/**
 * notice.js (관리자 공지사항 등록,수정)	
 */

 $(function(){
        $('#title').focus();
		
		$('input[type=button]').click(function(){
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
		
	});
