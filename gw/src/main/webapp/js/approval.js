	var contextPath = "/gw";
	
	/* approvalWrite.jsp */
	
	$(function(){
		//결재문서 작성시 유효성 검사
		$('form[name=documentFrm]').submit(function(){ //ConfirmController
			var bool=false;
			//참조자가 선택되었을시 참조자 유효성 검사
			if($('#referEmpNo').find('input[name=referEmpNo]').length>0){
				$('input[name=referEmpNo]').each(function(){
					if($(this).val()==$('#user').val()){
						bool=true;
					}
				});
			}else{
				bool=false;
			}
			
			if($('#documentNo').val()==0){
				alert('결재 종류를 선택하세요');
				$('#documentNo').focus();
				return false;
			}
			
			if($('#confirmTitle').val().length==0){
				alert('제목을 입력하세요');
				$('#confirmTitle').focus();
				return false;
			}
	
			if($('#confirmLineNo').val().length==0){
				alert('결재선을 선택하세요');
				$('#select').focus();
				return false;
			}
			
			if($('#confirmContent').val().length==0){
				alert('내용을 입력하세요');
				$('#confirmContent').focus();
				return false;
			}
			
			if($('#startDate').val().length==0){
				alert('시작일을 선택하세요');
				$('#startDate').focus();
				return false;
			}
			
			if($('#endDate').val().length==0){
				alert('종료일을 선택하세요');
				$('#endDate').focus();
				return false;
			}
			
			if(bool){
				alert('참조자에 작성자가 포함되었습니다.');
				return false;
			}
		});
		
		//결재문서 수정시 유효성 검사
		$('form[name=documentEditFrm]').submit(function(){
			var bool=false;
			if($('#referEmpNo').find('input[name=referEmpNo]').length>0){
				$('input[name=referEmpNo]').each(function(){
					if($(this).val()==$('#user').val()){
						bool=true;
					}
				});
			}else{
				bool=false;
			}
			
			if($('#documentNo').val()==0){
				alert('결재 종류를 선택하세요');
				$('#documentNo').focus();
				return false;
			}
			
			if($('#confirmTitle').val().length==0){
				alert('제목을 입력하세요');
				$('#confirmTitle').focus();
				return false;
			}

			if($('input[name=confirm1]').val().length==0){
				alert('결재선을 선택하세요');
				$('#select').focus();
				return false;
			}
			
			if($('#confirmContent').val().length==0){
				alert('내용을 입력하세요');
				$('#confirmContent').focus();
				return false;
			}
			
			if($('#startDate').val().length==0){
				alert('시작일을 선택하세요');
				$('#startDate').focus();
				return false;
			}
			
			if($('#endDate').val().length==0){
				alert('종료일을 선택하세요');
				$('#endDate').focus();
				return false;
			}
			
			if(bool){
				alert('참조자에 작성자가 포함되었습니다.');
				return false;
			}
		});
		
		//첨부파일 +버튼 클릭시	
		$('#btFilePlus').click(function(){
			var num = $('input[type=file]').length+1;
			$('#btFilePlus').parent().before("<div class='col-12 mt-1 file'>"+
				"<label class='form-label mb-0'>첨부파일</label>"+
				"<input class='form-control' name='confirmFile"+num+"' type='file'/></div>");	
		});
		
		//첨부파일 -버튼 클릭시	
		$('#btFileDel').click(function(){
			$('.file:last').remove();
		});
		
		$('#backBt').click(function(){
			history.back();
		});
		
		/* adminList.jsp */
	
		$('input[name=allCheck]').click(function(){
			$('td input[type=checkbox]').prop('checked',this.checked);
		});
		
		$('#deleteConfirm').click(function(){
			$('td input[type=checkbox]:checked').each(function(){
				$(this).trigger('change');
			});
			
			var cnt=$('td input[type=checkbox]:checked').length;
			
			if(cnt==0){
				alert("삭제 할 문서를 선택하세요");
				return false;
			}
			
			if(confirm("문서를 삭제하시겠습니까?")){
				$('form[name=frmList]').submit();
			}
		});
	});
	
	//시작날짜 선택시 유효성 검사	
	function startDateChange(){
		var today = new Date();
		var start = new Date($('#startDate').val());
		today.setHours(0, 0, 0, 0);
		
		if(start<today){
			alert('시작일 설정이 잘못되었습니다.');
			$('#startDate').val('');
			$('#startDate').focus();
		}
	}
	
	//종료 날짜 선택시 유효성 검사	
	function endDateChange(){
		if($('#startDate').val().length==0){
			alert('시작일을 선택하세요.');
			$('#endDate').val('');
			$('#startDate').focus();
			
		}else{
			var start = new Date($('#startDate').val());
			var end = new Date($('#endDate').val());
			start.setHours(0, 0, 0, 0);
			
			if(end<start){
				alert('종료일 설정이 잘못되었습니다.');
				$('#endDate').val('');
				$('#endDate').focus();
			}
		}
	}
	
	//참조자 선택 페이지 열기	
	function selectRefer(){
		var referEmpNo=[];
		
		$('input[name=referEmpNo]').each(function(){
			referEmpNo.push($(this).val());
		});
		
		//ConfirmController
		window.open(contextPath+"/approval/selectEmp/selectEmp?referEmpNo="+referEmpNo,"_blank","width=800, height=580")
	}
		
	//결재선 생성 페이지 열기	
	function createLine(){
		//ConfirmController
		window.open(contextPath+"/approval/selectEmp/createConfirmLine","_blank","width=800, height=600")
	}
	
	//결재선 선택 페이지 열기	
	function selectLine(){
		//ConfirmController
		window.open(contextPath+"/approval/selectEmp/selectConfirmLine","_blank","width=700, height=580")
	}
	
	/* approvalView.jsp */
	
	//결재 상태 업데이트
	function closeUpdate(confirmEmpNo,sessionEmpNo,state){
		if(confirmEmpNo==sessionEmpNo && state==1){
			window.close();
			window.opener.location.reload();
		}else{
			window.close();
		}
	}
	
	//결재 버튼 클릭시	
	function clickUpdate(){
		var confirmDocumentNo=$('#confirmDocumentNo').val();
		var confirmState=$('#confirmState').val();
		var searchKeyword=$('#searchKeyword').val();
		
		$.ajax({ //ConfirmController
	    	url:contextPath+"/approval/updateConfirmAjax",
	   		type:"post",
	   		dataType:"text",
	   		data:{
	   			confirmDocumentNo:confirmDocumentNo,
	   			confirmState:confirmState,
	   			searchKeyword:searchKeyword
	   		},
	   		success:function(res){
	   			alert(res);
	   			window.close();
	   			window.opener.location.reload();
	    	},error:function(xhr, status, error){
	    		alert(status+" : "+error);
	   		}
	   	});
	}
	
	//결재 문서 반려버튼 클릭시		
	function clickReturn(){
		var confirmDocumentNo=$('#confirmDocumentNo').val();
		var searchKeyword=$('#searchKeyword').val();
		
		$.ajax({ //ConfirmController
	    	url:contextPath+"/approval/returnConfirmAjax",
	   		type:"post",
	   		dataType:"text",
	   		data:{
	   			confirmDocumentNo:confirmDocumentNo,
	   			searchKeyword:searchKeyword
	   		},
	   		success:function(res){
	   			alert(res);
	   			window.close();
	   			window.opener.location.reload();
	    	},error:function(xhr, status, error){
	    		alert(status+" : "+error);
	   		}
	   	});
	}
	
	function edit(no){
		location.href=contextPath+"/approval/approvalEdit?confirmDocumentNo="+no;
		//ConfirmController
	}
	
	function print(no){
		location.href=contextPath+"/approval/downloadPDF?confirmDocumentNo="+no;
		//ConfirmController
	}
	
	/* approvalEdit.jsp */
	
	//기존파일 삭제버튼 클릭시
	function deleteFile(fileName,a){
		var num = $('#deleteFileDiv>input[type=hidden]').length+1;
		
		if(num==1){
			$('#deleteFileDiv').html("<input name='deleteFile' type='hidden' value='"+fileName+"'/>");
		}else{
			$('#deleteFileDiv').append("<input name='deleteFile' type='hidden' value='"+fileName+"'/>");
		}
		$(a).parent().remove();
	}
	
	//기존파일 새로고침 
	function reloadFile(a){
		location.reload($(a).parent());
	}
	
	/* confrimList.jsp */
	
	//검색 클릭시
	function search(num){
		$('input[name="currentPage"]').val('1');
		
		//문서함 별로 form의 action 설정 
		//ConfirmController
		if(num==0){
			$('form[name="frmSearch"]').prop('action',contextPath+"/approval/confirmList");
		}
		if(num==1){
			$('form[name="frmSearch"]').prop('action',contextPath+"/approval/confirm/confirmList");
		}
		if(num==2){
			$('form[name="frmSearch"]').prop('action',contextPath+"/approval/deptAgreeList");
		}
		if(num==3){
			$('form[name="frmSearch"]').prop('action',contextPath+"/approval/completeList");
		}
		if(num==4){
			$('form[name="frmSearch"]').prop('action',contextPath+"/approval/referList");
		}
		if(num==5){
			$('form[name="frmSearch"]').prop('action',contextPath+"/approval/returnList");
		}
		
		$('form[name="frmSearch"]').submit();
	}
	
	//문서리스트에서 문서 번호 클릭시
	function approvalDetail(no,state,a,title){
		//선택한 문서의 결재라인에 속해있을시 결재상태 업데이트
		$.ajax({ //ConfirmController
	    	url:contextPath+"/approval/updateStateAjax",
	   		type:"post",
	   		dataType:"text",
	   		data:{
	   			confirmDocumentNo:no,
	   			confirmState:state
	   		},
	   		success:function(res){
	   			$(a).parent().parent().find('.state').text(res);
	    	},error:function(xhr, status, error){
	    		alert(status+" : "+error);
	   		}
	   	});
	   	
	   	//ConfirmController
		window.open(contextPath+"/approval/approvalDetail?confirmDocumentNo="+no+"&title="+title,"_blank","width=1000, height=760, left=480, top=100");
	}
	
	/* adminList.jsp */
	
	//관리자 결재리스트 검색 클릭시
	function search(){
		$('input[name="currentPage"]').val('1');
		$('form[name="frmSearch"]').submit();
	}
	
	//관리자 결재리스트 문서번호 클릭시
	function approvalDetail(no,state,a,title,security){
		if(security==1){
			alert("문서를 볼 수 있는 권한이 없습니다.");
			return false;
		}
		
		//ConfirmController
		window.open("<c:url value='/approval/approvalDetail?confirmDocumentNo="+no+"&title="+title+"'/>","_blank","width=1000, height=760, left=480, top=100");
	}
	
	//관리자 결재리스트 삭제 버튼 클릭시
	function delOk(chk,no,create,deadLine){
		var today = new Date();
		var create = new Date(create);
		var deadLine = parseInt(deadLine);
		
		today.setHours(0, 0, 0, 0);
		create.setHours(0, 0, 0, 0);
		create.setFullYear(create.getFullYear() + deadLine);
		
		if(today<create){
			alert(no+"문서는 보존기한이 남아있는 문서입니다.");
			$(chk).prop('checked',false);
		}	
		
	}
	
	/* confrimList5.jsp */
	
	function approvalDetail(no,title){
		//ConfirmController
		window.open(contextPath+"/approval/approvalDetail?confirmDocumentNo="+no+"&title="+title,"_blank","width=1000, height=600");
	}
	
	/* 페이징처리 */
		
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmSearch"]').submit();
	}