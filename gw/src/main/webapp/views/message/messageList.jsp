<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<script type="text/javascript">
	function setWrite(a){
		$(a).find('.readDiv').addClass('chat-contact');
		$(a).find('.readDiv').addClass('active');
	    // 클릭한 a 태그를 제외한 다른 a 태그들의 active 클래스 제거
	    $('.LastMessage').not(a).find('.readDiv').removeClass('chat-contact');
	    $('.LastMessage').not(a).find('.readDiv').removeClass('active');
	}
</script>
<div class="card card-chat overflow-hidden">
	<div class="card-body d-flex p-0 h-100">
		<div class="chat-sidebar">
			<div class="contacts-list scrollbar-overlay">
				<div class="nav nav-tabs border-0 flex-column" role="tablist" aria-orientation="vertical">
                	<c:if test="${empty mViewList }">
                	<div class="d-flex p-3">
                		쪽지내역이 없습니다.
                	</div>
                	</c:if>
                	<c:if test="${!empty mViewList }">
                		<c:forEach var="mViewVo" items="${mViewList }">
                		<a class="LastMessage" href="#" onclick="setWrite(this)">
		                	<div class="readDiv d-flex p-3">
		                    	<div class="avatar avatar-xl">
		                        	<img class="rounded-circle"
		                        		<c:if test="${mViewVo.empNo==sessionScope.empNo }">
		                        			src="<c:url value='/images/${mViewVo.readImage }'/>"
			                        	</c:if>
			                        	<c:if test="${mViewVo.empNo!=sessionScope.empNo }">
		                        			src="<c:url value='/images/${mViewVo.sendImage }'/>"
			                        	</c:if>
		                        	alt="" />
		                        </div>
		                        <div class="flex-1 chat-contact-body ms-2 d-md-none d-lg-block">
		                        	<div class="d-flex justify-content-between">
		                            	<h6 class="mb-0 chat-contact-title">
		                            		<c:if test="${mViewVo.empNo==sessionScope.empNo }">
				                            	${mViewVo.readName }
			                        		</c:if>
			                        		<c:if test="${mViewVo.empNo!=sessionScope.empNo }">
				                            	${mViewVo.sendName }
			                        		</c:if>
		                            	</h6>
		                            	<span class="message-time fs--2">
		                            		<fmt:formatDate value="${mViewVo.sendDate}" pattern="yy-MM-dd"/>
		                            	</span>
		                         	</div>
			                        <div class="min-w-0">
			                        	<div class="chat-contact-content pe-3">
			                        		<c:if test="${mViewVo.empNo==sessionScope.empNo }">
				                            	${mViewVo.messageContent }
			                        		</c:if>
			                        		<c:if test="${mViewVo.empNo!=sessionScope.empNo }">
				                            	${mViewVo.messageContent }
			                        		</c:if>
			                            </div>
			                            <c:if test="${mViewVo.empNo==sessionScope.empNo and !empty mViewVo.readDate }">
				                            <div class="position-absolute bottom-0 end-0">
					                            <span class="fas fa-check text-success" data-fa-transform="shrink-5 down-4"></span>
		                            		</div>
			                            </c:if>
			                        </div>
		                        </div>
		                   	</div>
	                   	</a>
                		</c:forEach>
                	</c:if>
                </div>
			</div>
			<form class="contacts-search-wrapper">
            	<div class="form-group mb-0 position-relative d-md-none d-lg-block w-100 h-100">
                	<input class="form-control form-control-sm chat-contacts-search border-0 h-100" type="text" placeholder="Search contacts ..." /><span class="fas fa-search contacts-search-icon"></span>
                </div>
                <button class="btn btn-sm btn-transparent d-none d-md-inline-block d-lg-none"><span class="fas fa-search fs--1"></span></button>
            </form>
        </div>
        <div class="tab-content card-chat-content">
			<div class="tab-pane card-chat-pane active" id="chat-0" role="tabpanel" aria-labelledby="chat-link-0">
            	<div class="chat-content-header">
                	<div class="row flex-between-center">
                    	<div class="col-6 col-sm-8 d-flex align-items-center">
	                        <div class="min-w-0">
	                        	<h5 class="mb-0 text-truncate fs-0">이름</h5>
	                          	<div class="fs--2 text-400">정보</div>
	                        </div>
                      	</div>
                    </div>
                </div>
                <div class="chat-content-body" style="display: inherit;">
                	<div class="chat-content-scroll-area scrollbar">
                    	<div class="text-center fs--2 text-500">
                    		<span>대화 시작 날짜</span>
                    	</div>
                      	<div class="d-flex p-3">
	                        <div class="avatar avatar-l me-2">
	                        	<img class="rounded-circle" src="../assets/img/team/2.jpg" alt="" />
	                        </div>
	                        <div class="flex-1">
	                          <div class="w-xxl-75">
	                              <div class="chat-message bg-200 p-2 rounded-2">
	                              	받은 메시지
	                              </div>
	                              <div class="text-400 fs--2">
	                              	<span>받은시간</span>
	                              </div>
	                          </div>
	                        </div>
                        </div>
                      	<div class="d-flex p-3">
                        	<div class="flex-1 d-flex justify-content-end">
                          		<div class="w-100 w-xxl-75">
                            		<div class="hover-actions-trigger d-flex flex-end-center">
                              			<div class="bg-primary text-white p-2 rounded-2 chat-message" data-bs-theme="light">
                                			<p class="mb-0">보낸메시지 </p>
					       				</div>
                            		</div>
                            		<div class="text-400 fs--2 text-end">
                            			보낸시간<span class="fas fa-check ms-2 text-success"></span>
                            		</div>
                          		</div>
                        	</div>
                      	</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file = "../inc/bottom.jsp" %>