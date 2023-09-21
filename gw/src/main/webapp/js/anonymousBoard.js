	var contextPath = "/gw";
	
	$(function(){
		//익명게시판 글 작성시
		//AnonymousBoardController
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
		
		$('form[name=frmDatgeulEditForm]').submit(function(){
			event.preventDefault();
		});
		
		$('form[name=frmReplyEditForm]').submit(function(){
			event.preventDefault();
		});
		
		//댓글 작성시
		//AnonymousBoardController
		$('form[name=frmReplyForm]').submit(function(){ 
			content=$(this).find('input[name=content]');
			
			if(content.val().length==0){
				alert("내용을 입력하세요.");
				content.focus();
				return false;
			}
		});
		
		//게시글 수정시
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
		
		//게시판 이미지 슬라이드
		$('.page-nav>div').click(function() {
		    var pagenav = $(this).parent();
			var current = $(pagenav).find('.slideActive');
		    
		    $(current).removeClass('slideActive');
		    $(this).addClass('slideActive');
			    
		    var slider = $(pagenav).parent().find('#centerDiv');
		    var index = $(this).index();
			    
		    $(slider).find('div.slideActive').removeClass('slideActive');
		    $(slider).find('div').eq(index).addClass('slideActive');
			    
		});
		
		//게시판 이미지 슬라이드(왼쪽 버튼 클릭)
		$('.leftBt').click(function () {
	        var slider = $(this).closest('.img-slider');
	        var current = slider.parent().find('.page-nav > .slideActive');
	        var post = current.prev();
	
	        if (post.length == 0) {
	            post = slider.parent().find('.page-nav > div:last-child');
	        }
	
	        post.click();
    	});
		
		//게시판 이미지 슬라이드(오른쪽 버튼 클릭)
		$('.rightBt').click(function () {
	        var slider = $(this).closest('.img-slider');
	        var current = slider.parent().find('.page-nav > .slideActive');
	        var post = current.next();
	
	        if (post.length == 0) {
	            post = slider.parent().find('.page-nav > div:first-child');
	        }
	
	        post.click();
   		});
					
	});
		
	//게시글 댓글 버튼 클릭시	
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
	
	//게시글 작성 이미지버튼 클릭
	function uploadSet(bt){
		var form = bt.closest('form[name=frmBoardWrite]');
		var cnt = $(form).find('input[type=file]').length;
		
		if(cnt==0){
			$(form).find('input[name=upfile]').attr('type','file');
		}else{
			$(form).find('input[name=upfile]').attr('type','hidden');
		}
	}
	
	//답글 클릭시
	function replyShow(a){
		var parent=$(a).closest('#datgeulViewDiv');
		var div=$(parent).children('#replyInfo');
		$(div).each(function(){
			if ($(this).css("display") == "none") {
	        	$(this).show();
	    	} else {
	        	$(this).hide();
	    	}
			
		});
	}
	
	//답글달기 클릭시
	function reply(a){
		var parent=$(a).closest('.row');
		var div=$(parent).find('#replyDiv');
		if (div.css("display") == "none") {
        	div.show();
    	} else {
        	div.hide();
    	}
	}
	
	//게시글 수정 세팅
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
	
	//게시글 수정 취소
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
	
	//게시글 수정시 이미지 삭제
	function deleteImg(imgName,a){
		var editImgDiv=$(a).parent().parent();
		
		$(editImgDiv).append("<input name='deleteImg' type='hidden' value='"+imgName+"'/>");
		$(a).parent().remove();
	}
	
	//게시글 삭제
	function deleteBoard(no){
		if(confirm("게시글을 삭제하시겠습니까?")){
			//AnonymousBoardController
			location.href=contextPath+"/anonymous/deleteAnonymousBoard?boardNo="+no;
		}
	}
	
	//댓글 수정 세팅
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
	
	//댓글 수정
	function editDatguelOK(a){
		var parent=$(a).closest('#datgeulEditDiv');
		var form = $(parent).find('form[name=frmDatgeulEditForm]');
		var editContent=$(form).find('input[name=content]');
		var commentNo=$(form).find('input[name=commentNo]');
		var str="<a href='#!' id='editDatguelA' onclick='editDatguel(this)'>수정</a>&bull;";  
		str+="<a href='#!' onclick='deleteDatguel(this)'>삭제</a>";  
		
		if(editContent.val().length==0){
			alert("내용을 입력하세요.");
			editContent.focus();
		}else{
			$.ajax({ //AnonymousBoardController
			    url:contextPath+"/anonymous/replyEditAjax",
			   	type:"post",
			   	dataType:"text",
			 	data:$(form).serialize(),
			   	success:function(res){
			   		alert(res);
			   		form.html(datguelSet(editContent.val(),commentNo.val(),"datgeul"));
					$(a).parent().html(str);
			   	},error:function(xhr, status, error){
			   		alert(status+" : "+error);
		   		}
	   		});
		}
	}
	
	//댓글 작성 후 댓글 세팅
	function datguelSet(content,no,type){
		var str="";
		if(type=="reply"){
			str="<p class='mb-1 bg-200 rounded-3 p-2' id='replyP'>";
		}else{
			str="<p class='mb-1 bg-200 rounded-3 p-2' id='datguelP'>";
		}
		str+="익명 :";
		str+=content+"</p>";
		str+="<input class='form-control' type='hidden' name='content' value='"+content+"'>";
		str+="<input type='hidden' name='commentNo' value="+no+">";
		
		return str;
	}
	
	//댓글 수정 취소시
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
	
	//댓글 삭제시
	function deleteDatguel(a){
		var parent=$(a).closest('#datgeulEditDiv');
		var form = $(parent).find('form[name=frmDatgeulEditForm]');
		
		if(confirm("댓글을 삭제하시겠습니까?")){
			$.ajax({//AnonymousBoardController
			    url:contextPath+"/anonymous/replyDeleteAjax",
			   	type:"post",
			   	dataType:"json",
			 	data:$(form).serialize(),
			   	success:function(res){
					alert(res.msg);
					if(res.cnt=='1'){
						$(form).closest('#datgeulViewDiv').remove();		   
					}
			   	},error:function(xhr, status, error){
			   		alert(status+" : "+error);
		   		}
	   		});
		}
	}
	
	//답글 수정 세팅
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
	
	//답글 수정 취소시
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
	
	//답글 수정
	function editReplyOK(a){
		var parent=$(a).closest('#replyInfo');
		var form = $(parent).find('form[name=frmReplyEditForm]');
		var editContent=$(form).find('input[name=content]');
		var commentNo=$(form).find('input[name=commentNo]');
		var str="<a href='#!' onclick='editReply(this)'>수정</a>&bull;";  
		str+="<a href='#!' onclick='deleteReply(this)'>삭제</a>"; 
		
		if(editContent.val().length==0){
			alert("내용을 입력하세요.");
			editContent.focus();
		}else{
			$.ajax({//AnonymousBoardController
			    url:contextPath+"/anonymous/replyEditAjax",
			   	type:"post",
			   	dataType:"text",
			 	data:$(form).serialize(),
			   	success:function(res){
			   		alert(res);
			   		form.html(datguelSet(editContent.val(),commentNo.val(),"reply"));
					$(a).parent().html(str);
			   	},error:function(xhr, status, error){
			   		alert(status+" : "+error);
		   		}
	   		});
		}
	}
	
	//답글 삭제
	function deleteReply(a){
		var parent=$(a).closest('#replyInfo');
		var form = $(parent).find('form[name=frmReplyEditForm]');
		
		if(confirm("댓글을 삭제하시겠습니까?")){
			$.ajax({
			    url:contextPath+"/anonymous/replyDeleteAjax",
			   	type:"post",
			   	dataType:"json",
			 	data:$(form).serialize(),
			   	success:function(res){
					alert(res.msg);
					if(res.cnt=='1'){
						$(form).closest('#replyInfo').remove();		   
					}
			   	},error:function(xhr, status, error){
			   		alert(status+" : "+error);
		   		}
	   		});
		}
	}
	
	//게시글 신고
	function boardReport(no){
		if(confirm(no+"번 게시글을 신고하시겠습니까?")){
			$.ajax({ //AnonymousBoardController
		    	url:contextPath+"/report/reportBoardAjax",
		   		type:"post",
		   		dataType:"text",
		   		data:{
		   			boardNo:no
		   		},
		   		success:function(res){
		   			alert(res);
		    	},error:function(xhr, status, error){
		    		alert(status+" : "+error);
		   		}
	   		});
		}
	}
	
	//댓글 신고
	function commentReport(commentNo,boardNo){
		if(confirm("댓글을 신고하시겠습니까?")){
			$.ajax({ //AnonymousBoardController
		    	url:contextPath+"/report/reportCommentAjax",
		   		type:"post",
		   		dataType:"text",
		   		data:{
		   			commentNo:commentNo,
		   			boardNo:boardNo
		   		},
		   		success:function(res){
		   			alert(res);
		    	},error:function(xhr, status, error){
		    		alert(status+" : "+error);
		   		}
	   		});
		}
	}