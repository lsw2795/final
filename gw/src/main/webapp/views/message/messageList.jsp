<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>

<script type="text/javascript">
	$(function(){
		$('#frmMessageSend').submit(function(){
			var reader=$('#frmMessageSend #reader').val();
			var messageContent=$('#frmMessageSend #messageContent').val();
			$.ajax({
		    	url:"<c:url value='/message/messageListClickAjax'/>",
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
			
			$('.LastMessage').each(function(){
				var Listreader=$(this).find('#reader').val();
				if(reader==Listreader){
					$(this).find('.chat-contact-content').html("받음 : "+
							messageContent.substr(0,10)+"...");
				}
			});
			
			return false;
		});
	});
	
	function setWrite(a,empNo){
		var no=$(a).find('#reader').val();
		$('form[name=frmMessageSend] #reader').val(no);
		
		$(a).find('.readDiv').addClass('chat-contact');
		$(a).find('.readDiv').addClass('active');
		$(a).find('.readDiv').removeClass('unread-message');
	    
	    $('.LastMessage').not(a).find('.readDiv').removeClass('chat-contact');
	    $('.LastMessage').not(a).find('.readDiv').removeClass('active');
	    
	    $.ajax({
	    	url:"<c:url value='/message/messageListClickAjax'/>",
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
	
	function infoSet(map){
		var str="<h5 class='mb-0 text-truncate fs-0'>"+map.NAME+"</h5>";
		str+="<div class='fs--2 text-400'>"+map.DEPT_NAME+" "+map.POSITION_NAME+"</div>";
		$('#InfoDiv').html(str);
	}
	
	function messageSet(list){
		var startDate="";
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
			
			if(i==0){
				str+="<div class='text-center fs--2 text-500'>";
				str+="<span>"+formatDate(sendDate)+"</span>";
				str+="</div>";
				startDate=sendDateSet;
			}
				
			if(reader==${sessionScope.empNo} && readerDelflag=="N"){
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
			}else if(empNo==${sessionScope.empNo} && delflag=="N"){
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
	
	function formatAMPM(date) {
	    var hours = date.getHours();
	    var minutes = date.getMinutes();
	    minutes = minutes < 10 ? '0' + minutes : minutes;
	    var strTime = hours + ':' + minutes ;
	    return strTime;
	}
	
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
	
	function deleteMessage(reader,messageNo){
		if(confirm("삭제하시겠습니까?")){
			location.href="<c:url value='/message/messageDelete?messageNo="+messageNo+"&reader="+reader+"'/>";
		}
	}
	
</script>
<div class="card card-chat overflow-hidden">
	<div class="card-body d-flex p-0 h-100">
		<div class="chat-sidebar" >
			<div class="contacts-list scrollbar-overlay">
				<div class="nav nav-tabs border-0 flex-column" role="tablist" aria-orientation="vertical">
                	<c:if test="${empty mViewList }">
                	<div class="d-flex p-3">
                		쪽지내역이 없습니다.
                	</div>
                	</c:if>
                	<c:if test="${!empty mViewList }">
                		<c:forEach var="mViewVo" items="${mViewList }">
                		<a class="LastMessage" href="#" onclick="setWrite(this,'${mViewVo.empNo}')">
		                	<c:if test="${mViewVo.empNo!=sessionScope.empNo and empty mViewVo.readDate}">
				                <div class="readDiv d-flex p-3 unread-message">
		                	</c:if>
		                	<c:if test="${mViewVo.empNo==sessionScope.empNo or !empty mViewVo.readDate }">
				                <div class="readDiv d-flex p-3">
		                	</c:if>
		                    	<div class="avatar avatar-xl">
		                        	<img class="rounded-circle"
		                        		<c:if test="${mViewVo.empNo==sessionScope.empNo }">
		                        			src="<c:url value='/images/${mViewVo.readImage }'/>"
			                        	</c:if>
			                        	<c:if test="${mViewVo.empNo!=sessionScope.empNo }">
		                        			src="<c:url value='/images/${mViewVo.sendImage }'/>"
			                        	</c:if>
		                        	alt="사원이미지" />
		                        </div>
		                        <div class="flex-1 chat-contact-body ms-2 d-md-none d-lg-block">
		                        	<div class="d-flex justify-content-between">
		                            	<h6 class="mb-0 chat-contact-title">
		                            		<c:if test="${mViewVo.empNo==sessionScope.empNo }">
				                            	${mViewVo.readName }
				                            	<input id="reader" name="reader" type="hidden" value="${mViewVo.reader }">
				                            	<input id="readName" name="readName" type="hidden" value="${mViewVo.readName }">
			                        		</c:if>
			                        		<c:if test="${mViewVo.empNo!=sessionScope.empNo }">
				                            	${mViewVo.sendName }
				                            	<input id="reader" name="reader" type="hidden" value="${mViewVo.empNo }">
				                            	<input id="readName" name="readName" type="hidden" value="${mViewVo.sendName }">
			                        		</c:if>
		                            	</h6>
		                            	<span class="message-time fs--2">
		                            		<fmt:formatDate value="${mViewVo.sendDate}" pattern="yy-MM-dd"/>
		                            	</span>
		                         	</div>
			                        <div class="min-w-0">
			                        	<div class="chat-contact-content pe-3">
			                            	<c:if test="${mViewVo.empNo==sessionScope.empNo}">
			                            		보냄 :
			                            	</c:if>
			                            	<c:if test="${mViewVo.empNo!=sessionScope.empNo}">
			                            		받음 :
			                            	</c:if>
			                        		<c:if test="${mViewVo.messageContent.length()>10 }">
									 			${fn:substring(mViewVo.messageContent,0,10) }...
											</c:if>
			                        		<c:if test="${mViewVo.messageContent.length()<=10 }">
									 			${mViewVo.messageContent }
											</c:if>
			                            </div>
				                        <div class="read-check position-absolute bottom-0 end-0">
			                            	<c:if test="${mViewVo.empNo==sessionScope.empNo and !empty mViewVo.readDate }">
					                            <span class="fas fa-check text-success" data-fa-transform="shrink-5 down-4"></span>
			                           		</c:if>
		                            	</div>
			                        </div>
		                        </div>
		                   	</div>
	                   	</a>
                		</c:forEach>
                	</c:if>
                </div>
			</div>
			<form name="frmSearchName" class="contacts-search-wrapper">
            	<div class="form-group mb-0 position-relative d-md-none d-lg-block w-100 h-100">
                	<input onkeyup="search(this)" class="form-control form-control-sm chat-contacts-search border-0 h-100" type="text" placeholder="검색할 이름을 입력하세요." />
                	<span class="fas fa-search contacts-search-icon"></span>
                </div>
            </form>
        </div>
        <div class="tab-content card-chat-content">
			<div class="tab-pane card-chat-pane active" id="chat-0" role="tabpanel" aria-labelledby="chat-link-0">
            	<div class="chat-content-header">
                	<div class="row flex-between-center">
                    	<div class="col-6 col-sm-8 d-flex align-items-center">
	                        <div id="InfoDiv" class="min-w-0">
	                        	<h5 class="mb-0 text-truncate fs-0">쪽지를 클릭하세요</h5>
	                        </div>
                      	</div>
                    </div>
                </div>
                <div class="chat-content-body" style="display: inherit;">
                	<div id="chatDiv" class="chat-content-scroll-area scrollbar">
					</div>
				</div>
			</div>
			<form class="chat-editor-area" id="frmMessageSend" name="frmMessageSend">
	            <input class="form-control p-1" id="messageContent" name="messageContent" type="text" placeholder="메시지를 입력하세요."/>
            	<button class="btn btn-sm btn-send shadow-none m-0" type="submit" style="width: 80px;">보내기</button>
	            <input type="hidden" id="reader" name="reader"/>
        	</form>
		</div>
	</div>
</div>
<%@ include file = "../inc/bottom.jsp" %>