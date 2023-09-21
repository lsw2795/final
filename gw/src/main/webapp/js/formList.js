	var contextPath = "/gw";
	
	$(function(){
		//검색버튼 클릭시
		$('#search').click(function(){
			$('form[name="frmSearch"]').submit();
		});
		
		$('input[name=allCheck]').click(function(){
			$('td input[type=checkbox]').prop('checked',this.checked);
		});
		
		//문서양식 수정 클릭시
		$('#btDisabled').click(function(){
			if($('#editDocumentNo').val().length==0){
				alert("수정할 문서를 클릭하세요.");
				return false;
			}
			
			if($('#editDocumentNo').val().length!=0){
				$('#editFormName').prop('disabled',false);
	   			$('#editSecurityLevel').prop('disabled',false);
	   			$('#editDeadline').prop('disabled',false);
			}
		});
		
		//문서양식 수정 확인 클릭시
		$('#formEdit').click(function(){
			if($('#editDocumentNo').val().length==0){
				alert("수정할 문서를 클릭하세요.");
				return false;
			}
			
			if($('#editFormName').prop('disabled')){
				alert("수정버튼을 클릭하세요.");
				$('#btDisabled').focus();
				return false;
			}
			
			if(confirm($('#editFormName').val()+" 양식을 수정하시겠습니까?")){
				if($('#editFormName').val().length<1){
					alert("양식명을 입력하세요.");
					$('#editFormName').focus();
					return false;
				}
				
				if($('#editFormName').val().length>0){
					//양식 수정 처리
					$.ajax({ //DocumentFormController
				    	url:contextPath+"/document/searchFormNameAjax",
				   		type:"post",
				   		dataType:"json",
				   		data:{
				   			formName:$('#editFormName').val(),
				   			documentNo:$('#editDocumentNo').val()
				   		},
				   		success:function(res){
							//양식명 유효성 검사
				   			if(res>0){
				   				alert("이미 존재하는 양식명입니다.");
				   				formName.val("");
				   			}
				   			if(res==0){
								if($('#editSecurityLevel').val()==0){
									alert("보안등급을 선택하세요.");
									$('#editSecurityLevel').focus();
									return false;
								}
								if($('#editDeadline').val()==0){
									alert("보존기한을 선택하세요.");
									$('#editDeadline').focus();
									return false;
								}
								
								$('form[name=frmFormEdit]').submit();
				   			}
				    	},error:function(xhr, status, error){
				    		alert(status+" : "+error);
				   		}
				   	});
				}
			}
		});
		
		//추가하기 버튼 클릭시
		$('#formInsert').click(function(){
			if($('#formName').val().length<1){
				alert("양식명을 입력하세요.");
				$('#formName').focus();
				return false;
			}
			
			//양식 추가 처리
			if($('#formName').val().length>0){
				$.ajax({ //DocumentFormController
			    	url:contextPath+"/document/searchFormNameAjax",
			   		type:"post",
			   		dataType:"json",
			   		data:{
			   			formName:$('#formName').val()
			   		},
			   		success:function(res){
						//양식명 유효성 검사
			   			if(res>0){
			   				alert("이미 존재하는 양식명입니다.");
			   				formName.val("");
			   			}
			   			if(res==0){
							if($('#securityLevel').val()==0){
								alert("보안등급을 선택하세요.");
								$('#securityLevel').focus();
								return false;
							}
							if($('#deadline').val()==0){
								alert("보존기한을 선택하세요.");
								$('#deadline').focus();
								return false;
							}
							
							$('form[name=frmFormInsert]').submit();
			   			}
			    	},error:function(xhr, status, error){
			    		alert(status+" : "+error);
			   		}
			   	});
			}
		});
		
		//삭제 버튼 클릭시
		$('#formDelete').click(function(){
			var cnt=$('td input[type=checkbox]:checked').length;
			
			if(cnt==0){
				alert("삭제 할 문서양식을 선택하세요");
			}
			
			if(cnt>0){
				if(confirm("양식을 삭제하시겠습니까?")){
					$('form[name=frmTable]').submit();
				}
			}
		});
		
	});
	
	//양식명 클릭시 수정칸에 양식정보 세팅
	function editSet(no){
	   	$('#editFormName').prop('disabled',true);
	   	$('#editSecurityLevel').prop('disabled',true);
	   	$('#editDeadline').prop('disabled',true);
	   	
		$.ajax({ //DocumentFormController
	    	url:contextPath+"/document/editSetAjax",
	   		type:"post",
	   		dataType:"json",
	   		data:{
	   			documentNo:no
	   		},
	   		success:function(res){
	   			$('#editFormName').val(res.formName);
	   			$('#editSecurityLevel').val(res.securityLevel);
	   			$('#editDeadline').val(res.deadline);
	   			$('#editDocumentNo').val(res.documentNo);
	    	},error:function(xhr, status, error){
	    		alert(status+" : "+error);
	   		}
	   	});
	}
	
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmSearch"]').submit();
	}