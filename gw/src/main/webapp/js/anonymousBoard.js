var contextPath = "/gw";
$(function(){
	$('form[name=frmBoardWrite]').submit(function(){
		title=$(this).find('input[name=title]');
		content=$(this).find('textarea[name=content]');
		
		if(title.val().length==0){
			alert("제목을 입력하세요.");
			title.focus();
			return false;
		}
		if(content.val().length==0){
			alert("내용을 입력하세요.");
			content.focus();
			return false;
		}
	});
	
	$('form[name=frmDatgeulForm]').submit(function(){
		content=$(this).find('input[name=content]');
		
		if(content.val().length==0){
			alert("내용을 입력하세요.");
			content.focus();
			return false;
		}
	});
	
	$('form[name=frmReplyForm]').submit(function(){
		content=$(this).find('input[name=content]');
		
		if(content.val().length==0){
			alert("내용을 입력하세요.");
			content.focus();
			return false;
		}
	});
	
	$('form[name=frmBoardEdit]').submit(function(){
		title=$(this).find('input[name=title]');
		content=$(this).find('textarea[name=content]');
		
		if(title.val().length==0){
			alert("제목을 입력하세요.");
			content.focus();
			return false;
		}
		if(content.val().length==0){
			alert("내용을 입력하세요.");
			content.focus();
			return false;
		}
	});
	
	$('.page-nav>div').click(function() {
	    var pagenav = $(this).parent();
		var current = $(pagenav).find('.slideActive');
	    
	    $(current).removeClass('slideActive');
	    $(this).addClass('slideActive');
		    
	    var slider = $(pagenav).parent().find('.col-8');
	    var index = $(this).index();
		    
	    $(slider).find('div.slideActive').removeClass('slideActive');
	    $(slider).find('div').eq(index).addClass('slideActive');
		    
	});

		$('#leftBt').click(function() {
		    var slider = $(this).closest('.img-slider');
		    var current = $(slider).parent().find('.page-nav > div.slideActive');
		    var post = current.prev();
		    
		    if ( post.length == 0 ) {
		        post = $(slider).find('.page-nav > div:last-child');
		    }
		    
		    post.click();
		});

		$('#rightBt').click(function() {
		    var slider = $(this).closest('.img-slider');
		    
		    var current = $(slider).parent().find('.page-nav > div.slideActive');
		    var post = current.next();
		    
		    if ( post.length == 0 ) {
		        post = $(slider).find('.page-nav > div:first-child');
		    }
		    
		    post.click();
		});
				
	});
	

	function divEvent(a){
		var pDiv=$(a).closest('#datgeulInfo');
		if(pDiv.find('.slide').length==0){
			pDiv.children('#datgeulWriteDiv').slideDown();
			pDiv.children('#datgeulViewDiv').slideDown();
			pDiv.children('#datgeulViewDiv').addClass('slide');
			pDiv.children('#datgeulWriteDiv').addClass('slide');
		}else{
			pDiv.children('#datgeulWriteDiv').slideUp();
			pDiv.children('#datgeulViewDiv').slideUp();
			pDiv.children('#datgeulViewDiv').removeClass('slide');
			pDiv.children('#datgeulWriteDiv').removeClass('slide');
		}
	}
	
	function uploadSet(bt){
		var form = bt.closest('form[name=frmBoardWrite]');
		var cnt = $(form).find('input[type=file]').length;
		
		if(cnt==0){
			$(form).find('input[name=upfile]').attr('type','file');
		}else{
			$(form).find('input[name=upfile]').attr('type','hidden');
		}
	}
	
	function replyShow(a){
		var parent=$(a).closest('#datgeulViewDiv');
		var div=$(parent).find('#replyInfo');
		if (div.css("display") == "none") {
        	div.show();
    	} else {
        	div.hide();
    	}
	}
	
	function reply(a){
		var parent=$(a).closest('.row');
		var div=$(parent).find('#replyDiv');
		if (div.css("display") == "none") {
        	div.show();
    	} else {
        	div.hide();
    	}
	}
	
	function editSet(a){
		var parent=$(a).closest('#boardInfo');
		var card=$(a).closest('.card');
		var title=$(parent).find('#titleP');
		var titleInput=$(parent).find('#editTitle');
		var button=$(parent).find('#editBtDiv');
		var content=$(card).find('#contentP');
		var file=$(card).find('input[name=upfile]');
		var contentArea=$(card).find('#editContent');
		var img=$(card).find('.img-slider');
		var page=$(card).find('.page-nav');
		var editImg=$(card).find('#editImgDiv');
		
		title.hide();
		content.hide();
		img.hide();
		page.hide();
		
		button.show();
		titleInput.show();
		contentArea.show();
		editImg.show();
		file.prop('type','file');
	}
	
	function editReturn(bt){
		var card=$(bt).closest('.card');
		var title=$(card).find('#titleP');
		var titleInput=$(card).find('#editTitle');
		var button=$(card).find('#editBtDiv');
		var content=$(card).find('#contentP');
		var file=$(card).find('input[name=upfile]');
		var contentArea=$(card).find('#editContent');
		var img=$(card).find('.img-slider');
		var page=$(card).find('.page-nav');
		var editImg=$(card).find('#editImgDiv');
		var delImg=$(editImg).find('input[name=deleteImg]');
		$(delImg).each(function(){
			var str="";
			var imgName=$(this).val();
			str+="<div>";
			str+="<img src='"+contextPath+"/images/file.gif' alt='파일그림'> ";
			str+= imgName;
			str+="<a href='#!' onclick=deleteImg('"+imgName+"',this)>";
			str+="<span class='badge rounded-pill text-bg-primary'>";
			str+="삭제</span></a></div>";
			editImg.append(str);
		});
		
		delImg.remove();
		title.show();
		content.show();
		img.show();
		page.show();
		
		titleInput.val(title.text());
		contentArea.val(content.text());
				
		button.hide();
		titleInput.hide();
		contentArea.hide();
		editImg.hide();
		file.prop('type','hidden');
	}
	
	function deleteImg(imgName,a){
		var editImgDiv=$(a).parent().parent();
		
		$(editImgDiv).append("<input name='deleteImg' type='hidden' value='"+imgName+"'/>");
		$(a).parent().remove();
	}
	
	function deleteBoard(no){
		if(confirm("게시글을 삭제하시겠습니까?")){
			location.href=contextPath+"/anonymous/deleteAnonymousBoard?boardNo="+no;
		}
	}
	
	function editDatguel(a){
		var parent=$(a).closest('#datgeulEditDiv');
		var content=$(parent).find('#datguelP');
		var form = $(parent).find('form[name=frmDatgeulEditForm]');
		var editContent=$(form).find('input[name=content]');
		var str="<a href='#!' onclick='editDatguelOK(this)'>확인</a>&bull;";  
		str+="<a href='#!' onclick='editDatguelCancel(this)'>취소</a>";  
		
		$(a).parent().html(str);
		content.hide();
		editContent.prop('type','text');
	}
	
	function editDatguelOK(a){
		var parent=$(a).closest('#datgeulEditDiv');
		var form = $(parent).find('form[name=frmDatgeulEditForm]');
		var editContent=$(form).find('input[name=content]');
		
		if(editContent.val().length==0){
			alert("내용을 입력하세요.");
			editContent.focus();
		}else{
			form.prop('action',contextPath+'/anonymous/replyEdit');
			form.submit();
		}
	}
	
	function editDatguelCancel(a){
		var parent=$(a).closest('#datgeulEditDiv');
		var content=$(parent).find('#datguelP');
		var form=$(parent).find('form[name=frmDatgeulEditForm]');
		var editContent=$(form).find('input[name=content]');
			                      		
		var str="<a href='#!' id='editDatguelA' onclick='editDatguel(this)'>수정</a>&bull;";  
		str+="<a href='#!' onclick='deleteDatguel(this)'>삭제</a>";  
		
		$(a).parent().html(str);
		content.show();
		editContent.val(content.val());
		editContent.prop('type','hidden');
	}
	
	function deleteDatguel(a){
		var parent=$(a).closest('#datgeulEditDiv');
		var form = $(parent).find('form[name=frmDatgeulEditForm]');
		if(confirm("댓글을 삭제하시겠습니까?")){
			form.prop('action',contextPath+'/anonymous/replyDelete');
			form.submit();
		}
	}
	
	function editReply(a){
		var parent=$(a).closest('#replyInfo');
		var content=$(parent).find('#replyP');
		var form = $(parent).find('form[name=frmReplyEditForm]');
		var editContent=$(form).find('input[name=content]');
		var str="<a href='#!' onclick='editReplyOK(this)'>확인</a>&bull;";  
		str+="<a href='#!' onclick='editReplyCancel(this)'>취소</a>";  
		
		$(a).parent().html(str);
		content.hide();
		editContent.prop('type','text');
	}
	
	function editReplyCancel(a){
		var parent=$(a).closest('#replyInfo');
		var content=$(parent).find('#replyP');
		var form = $(parent).find('form[name=frmReplyEditForm]');
		var editContent=$(form).find('input[name=content]');
		 
		var str="<a href='#!' onclick='editReply(this)'>수정</a>&bull;";  
		str+="<a href='#!' onclick='deleteReply(this)'>삭제</a>";  
		
		$(a).parent().html(str);
		content.show();
		editContent.val(content.val());
		editContent.prop('type','hidden');
	}
	
	function editReplyOK(a){
		var parent=$(a).closest('#replyInfo');
		var form = $(parent).find('form[name=frmReplyEditForm]');
		var editContent=$(form).find('input[name=content]');
		
		if(editContent.val().length==0){
			alert("내용을 입력하세요.");
			editContent.focus();
		}else{
			form.prop('action',contextPath+'/anonymous/replyEdit');
			form.submit();
		}
	}
	
	function deleteReply(a){
		var parent=$(a).closest('#replyInfo');
		var form = $(parent).find('form[name=frmReplyEditForm]');
		if(confirm("댓글을 삭제하시겠습니까?")){
			form.prop('action',contextPath+'/anonymous/replyDelete');
			form.submit();
		}
	}