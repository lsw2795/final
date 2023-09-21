<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.authority!='Y' }">
	<%@ include file = "../inc/top.jsp" %>
</c:if>
<c:if test="${sessionScope.authority=='Y' }">
	<%@ include file = "../inc/adminTop.jsp" %>
	<link href="<c:url value='/css/adminMessage.css'/>" rel="stylesheet">
</c:if>
<script src="<c:url value='/js/message.js'/>"></script>
<div class="card admin-card card-chat overflow-hidden">
	<input type="hidden" id="sessionEmpNo" value="${sessionScope.empNo }">
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
			                            	<h6 class="mb-0 chat-contact-title" style="color: black">
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
                    	<div class="col-4 align-items-center">
	                        <div id="InfoDiv" class="min-w-0">
	                        	<h5 class="mb-0 text-truncate fs-0">쪽지를 클릭하세요</h5>
	                        </div>
                      	</div>
                    	<div class="col-6 align-items-center p-0" align="right">
                    		<button class="btn btn-primary btn-sm px-5 me-2" id="deleteBt" style="display: none;" type="button" onclick="allDelete()">전체삭제</button>
                    		<button class="btn btn-primary btn-sm px-5 me-2" type="button" onclick="writePage()">새쪽지</button>
                    	</div>
                    </div>
                </div>
                <div class="chat-content-body" style="display: inherit;">
                	<div id="chatDiv" class="chat-content-scroll-area scrollbar"></div>
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
<c:if test="${sessionScope.authority!='Y' }">
	<%@ include file = "../inc/bottom.jsp" %>
</c:if>
<c:if test="${sessionScope.authority=='Y' }">
	<%@ include file = "../inc/adminBottom.jsp" %>
</c:if>