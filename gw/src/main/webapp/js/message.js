	var contextPath = "/gw";
	
	$(function(){
		/* messageWrite.jsp */
		
		//보내기 버튼 클릭시
		//MessageContentController
		$('form[name=frmMessageWrite]').submit(function(){
			if($('#readerDiv').find('#reader').length==0){
				alert("쪽지를 보낼 사람을 선택하세요.");
				return false;
			}
			
			if($('#messageContent').val().length==0){
				alert("쪽지 보낼 내용을 입력하세요.");
				$('#messageContent').focus();
				return false;
			}
		});
		
		/* messageList.jsp */
		
		//쪽지함에서 보내기 버튼 클릭시
		//MessageContentController
		$('#frmMessageSend').submit(function(){
			var reader=$('#frmMessageSend #reader').val();
			var messageContent=$('#frmMessageSend #messageContent').val();
			
			$.ajax({
		    	url:contextPath+"/message/messageListClickAjax",
		   		type:"post",
		   		dataType:"json",
		   		data: {
		   			reader:reader,
		   			messageContent:messageContent
		   		},
		   		success:function(res){
		   			$('#frmMessageSend #messageContent').val('');
		   			messageSet(res.messageList);
		    	},error:function(xhr, status, error){
		    		alert(status+" : "+error);
		   		}
		   	});
			
			//쪽지 보낸 후 쪽지리스트 마지막 쪽지 세팅
			$('.LastMessage').each(function(){
				var Listreader=$(this).find('#reader').val();
				if(messageContent.length>10){
					messageContent=messageContent.substr(0,10)+"...";
				}
				if(reader==Listreader){
					$(this).find('.chat-contact-content').html("보냄 : "+messageContent);
				}
			});
			
			return false;
		});
		
		//쪽지함 전체삭제 버튼 클릭시
		$('#deleteBt').click(function(){
			empNo=$('#InfoDiv').find('input[name=empNo]').val();
			
			if(confirm("메시지를 전체 삭제 하시겠습니까?")){
				//MessageContentController
				location.href=contextPath+"/message/allDelete?reader="+empNo;
			}
		});
	});
	
	/* messageWrite.jsp */
	
	//조직도에서 이름 클릭시
	function setReader(no, name){
		var sessionEmpNo=$('#sessionEmpNo').val();
		var bool=true;
		var str="";
		
		//자신은 선택불가
		if(sessionEmpNo==no){
			alert("선택 할 수 없습니다.");
			return false;
		}
		
		//중복 선택불가
		$('#readerName>#reader').each(function(){
			if($(this).val()==no){
				alert("이미 선택된 사람입니다.");
				bool=false;
			}
		});
		
		//쪽지 받는사람 이름 세팅
		if(bool){
			str+="<span id='readerName'>";
			str+=name+"<a href='#' onclick='delReader(this)'>";
			str+="<span class='fas fa-minus' style='width: 8px'></span></a>";
			str+="<input id='reader' name='reader' type='hidden' value='"+no+"'/>";
			str+="&nbsp;&nbsp;</span>";
			
			if($('#readerDiv').find('#readerName').length==0){
				$('#readerDiv').html(str);
			}else{
				$('#readerDiv').append(str);
			}
		}
	}
	
	//받는사람 목록에서 -버튼 클릭시
	function delReader(a){
		$(a).parent().remove();
		if($('#readerDiv').find('#readerName').length==0){
			$('#readerDiv').html("<b>조직도에서 선택하세요</b>");
		}
	}
	
	/* messageList.jsp */
	
	//쪽지 리스트 클릭시 쪽지 내용 세팅
	function setWrite(a,empNo){
		var no=$(a).find('#reader').val();
		$('form[name=frmMessageSend] #reader').val(no);
		
		$(a).find('.readDiv').addClass('chat-contact');
		$(a).find('.readDiv').addClass('active');
		$(a).find('.readDiv').removeClass('unread-message');
	    
	    $('.LastMessage').not(a).find('.readDiv').removeClass('chat-contact');
	    $('.LastMessage').not(a).find('.readDiv').removeClass('active');
	    
	    $.ajax({ //MessageContentController
	    	url:contextPath+"/message/messageListClickAjax",
	   		type:"post",
	   		dataType:"json",
	   		data:{
	   			reader:no,
	   		},
	   		success:function(res){
	   			messageSet(res.messageList);
	   			infoSet(res.empMap);
	    	},error:function(xhr, status, error){
	    		alert(status+" : "+error);
	   		}
	   	});
	}
	
	//ajax에서 받아온 상대방의 정보 세팅
	function infoSet(map){
		var str="<h5 class='mb-0 text-truncate fs-0'>"+map.NAME+"</h5>";
		
		str+="<div class='fs--2 text-400'>"+map.DEPT_NAME+" "+map.POSITION_NAME+"</div>";
		str+="<input type='hidden' name='empNo' value='"+map.EMP_NO+"'>";
		
		$('#InfoDiv').html(str);
		$('#deleteBt').show();
	}
	
	//ajax에서 받아온 상대방과 주고받은 쪽지내용 세팅
	function messageSet(list){
		var startDate="";
		var sessionEmpNo=$('#sessionEmpNo').val();
		
		//list에 들어있는 vo값 하나씩 꺼내오기
		for(var i=0;i<list.length;i++){
			var str="";
			var vo=list[i];
			var messageNo = vo.messageNo;
			var messageContent = vo.messageContent;
			var sendDate = new Date(vo.sendDate);
			var sendDateSet = new Date(vo.sendDate);
			sendDateSet.setHours(0, 0, 0, 0);
			var readDate = vo.readDate;
			var empNo = vo.empNo;
			var reader = vo.reader;
			var readImage = vo.readImage;
			var sendImage = vo.sendImage;
			var delflag= vo.delflag;
			var readerDelflag = vo.readerDelflag;
			
			//첫번째 메시지 전에 날짜 출력
			if(i==0 && delflag=="N" && readerDelflag=="N"){
				str+="<div class='text-center fs--2 text-500'>";
				str+="<span>"+formatDate(sendDate)+"</span>";
				str+="</div>";
				
				//메시지 시작날짜 세팅
				startDate=sendDateSet;
			}
			
			//받은 쪽지일 경우	
			if(reader==sessionEmpNo && readerDelflag=="N"){
				//첫번째 메시지가 아닐경우 보낸시간과 시작시간 비교
				if(i>0){
					if(sendDateSet>startDate){
						str+="<div class='text-center fs--2 text-500'>";
						str+="<span>"+formatDate(sendDate)+"</span>";
						str+="</div>";
						startDate=sendDateSet;
					}
				}
				
				str+="<div class='d-flex p-3'>";
				str+="<div class='avatar avatar-l me-2'>";
				str+="<img class='rounded-circle' src='<c:url value='/images/"+sendImage+"'/>' />";
				str+="</div>";
				str+="<div class='flex-1'>";
				str+="<div class='w-xxl-75'>";
				str+="<div class='hover-actions-trigger d-flex align-items-center'>";
				str+="<div class='chat-message bg-200 p-2 rounded-2'>";
				str+=messageContent;
				str+="</div>";
				str+="<ul class='hover-actions position-relative list-inline mb-0 text-400 ms-2'>";
				str+="<li class='list-inline-item'>";
				str+="<a class='chat-option' href='#' onclick='deleteMessage("+reader+","+messageNo+")' data-bs-toggle='tooltip' data-bs-placement='top' title='삭제하기'>";
				str+="<span class='fas fa-trash-alt'></span>";
				str+="</a>";
				str+="</li>";
				str+="</ul>";
				str+="</div>";
				str+="<div class='text-400 fs--2'>";
				str+="<span>"+ sendDate.toLocaleDateString() + " " + formatAMPM(sendDate) + "</span>";
				str+="</div>";
				str+="</div>";
				str+="</div>";
				str+="</div>";
			}else if(empNo==sessionEmpNo && delflag=="N"){ //보낸 쪽지일 경우
				//첫번째 메시지가 아닐경우 보낸시간과 시작시간 비교
				if(i>0){
					if(sendDateSet>startDate){
						str+="<div class='text-center fs--2 text-500'>";
						str+="<span>"+formatDate(sendDate)+"</span>";
						str+="</div>";
						startDate=sendDateSet;
					}
				}
				
				str+="<div class='d-flex p-3'>";
				str+="<div class='flex-1 d-flex justify-content-end'>";
				str+="<div class='w-100 w-xxl-75'>";
				str+="<div class='hover-actions-trigger d-flex flex-end-center'>";
				str+="<ul class='hover-actions position-relative list-inline mb-0 text-400 me-2'>";
				str+="<li class='list-inline-item'>";
				str+="<a class='chat-option' href='#' onclick='deleteMessage("+reader+","+messageNo+")' data-bs-toggle='tooltip' data-bs-placement='top' title='삭제하기'>";
				str+="<span class='fas fa-trash-alt'></span>";
				str+="</a>";
				str+="</li>";
				str+="</ul>";
				str+="<div class='bg-primary text-white p-2 rounded-2 chat-message' data-bs-theme='light'>";
				str+="<p class='mb-0'>"+messageContent+"</p>";
				str+="</div>";
				str+="</div>";
				str+="<div class='text-400 fs--2 text-end'>";
				str+=sendDate.toLocaleDateString() + " " + formatAMPM(sendDate);
				
				if(readDate!=null){
					str+="<span class='fas fa-check ms-2 text-success'></span>";
				}
				
				str+="</div>";
				str+="</div>";
				str+="</div>";
			}
				
			if(i==0){
				$('#chatDiv').html(str);
			}else{
				$('#chatDiv').append(str);
			}
		}
	}
	
	//날짜 세팅
	function formatDate(date) {
	    // 포맷팅 옵션 설정
	    var options = {
	        year: 'numeric',    // 년(4자리)
	        month: '2-digit',   // 월(2자리)
	        day: '2-digit',     // 일(2자리)
	        weekday: 'long'     // 요일(전체 이름)
	    };
	    
	    // 날짜를 지정한 포맷으로 변환하여 반환
	    return date.toLocaleDateString('euc-kr', options);
	}
	
	//시간 세팅
	function formatAMPM(date) {
	    var hours = date.getHours();
	    var minutes = date.getMinutes();
	    
	    minutes = minutes < 10 ? '0' + minutes : minutes;
	    
	    var strTime = hours + ':' + minutes ;
	    return strTime;
	}
	
	//쪽지함에서 상대방 이름 검색
	function search(name){
		var searchName = $(name).val().trim();
		
		$('.LastMessage').each(function(){
			var name=$(this).find('#readName').val();
			
			if(searchName.length==0){
				$(this).show();
			}else{
				if(searchName.includes(name)){
					$(this).show();
				}else{
					$(this).hide();
				}
			}
		});
	}
	
	//메시지 내용에서 삭제 버튼 클릭시
	function deleteMessage(reader,messageNo){
		if(confirm("삭제하시겠습니까?")){
			//MessageContentController
			location.href=contextPath+"/message/messageDelete?messageNo="+messageNo+"&reader="+reader;
		}
	}
	
	//새쪽지 클릭시
	function writePage(){
		//MessageContentController
		location.href=contextPath+"/message/messageWrite";
	}