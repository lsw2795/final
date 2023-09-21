<!-- 익명게시판 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="<c:url value='/js/anonymousBoard.js'/>"></script>
<link href="<c:url value='/css/anonymousBoard.css'/>" rel="stylesheet">
<div class="row g-3">
	<div class="col-lg-10 m-auto mt-3">
		<div class="card mb-3">
			<div class="card-header bg-light overflow-hidden">
				<div class="d-flex align-items-center">
					<div class="flex-1 ms-2">
                    	<h5 class="mb-0 fs-0">익명게시판</h5>
                    	<pre>특정인을 비하하거나 음란물,도박성 광고 공유시 신고될수 있습니다.</pre>
                    </div>
                </div>
			</div>
            <div class="card-body p-0">
            	<form name="frmBoardWrite" method="post" enctype="multipart/form-data" action="<c:url value='/anonymous/boardWrite'/>">
					<input type="text" name="title" class="form-control" placeholder="제목을 입력하세요." maxlength="33">
                	<textarea name="content" class="shadow-none form-control rounded-0 resize-none px-x1 border-y-0 border-200" placeholder="내용을 입력하세요." rows="4"></textarea>
					<input name="upfile" type="hidden" class="form-control" accept="image/*" multiple="multiple">
                    <div class="row g-0 justify-content-between mt-3 px-x1 pb-3">
                    	<div class="col">
	                        <button onclick="uploadSet(this)" class="btn btn-light btn-sm rounded-pill shadow-none d-inline-flex align-items-center fs--1 mb-0 me-1" type="button">
		                        <img class="cursor-pointer" src="<c:url value='/assets/img/icons/spot-illustrations/image.svg'/>" width="17" alt="" />
		                        <span class="ms-2 d-none d-md-inline-block">Image</span>
	                        </button>
                      	</div>
                      	<div class="col-auto">
                        	<button class="btn btn-primary btn-sm px-4 px-sm-5" type="submit">작성</button>
                      	</div>
                    </div>
                </form>
            </div>
        </div>
        <c:if test="${empty anonymousList }">
        	<div class="card mb-3 p-5" align="center">
        		작성된 게시글이 없습니다.
        	</div>
        </c:if>
        <c:if test="${!empty anonymousList }">
        	<c:set var="no" value="0"/>
        	<c:set var="imgCnt" value="0"/>
        	<c:set var="divCnt" value="0"/>
	        <c:forEach var="map" items="${anonymousList }">
		        <c:if test="${no==map['BOARD_NO'] }">
					
				</c:if>
				<c:if test="${no!=map['BOARD_NO'] }">
		        	<div class="card mb-3">
				        <form name="frmBoardEdit" method="post" enctype="multipart/form-data" action="<c:url value='/anonymous/boardEdit'/>">
				        	<div class="card-header bg-light">
				            	<div class="row justify-content-between" id="boardInfo">
				                	<div class="col">
				                    	<div class="d-flex">
					                        <div class="flex-1 align-self-center ms-2">
					                        	<b>
					                        		<p class="mb-2 lh-1">익명 ${map['BOARD_NO'] }번째 글</p>
					                        	</b>
					                        	<input type="hidden" name="boardNo" value="${map['BOARD_NO'] }">
					                        	<p class="mt-3 mb-1 lh-1" id="titleP">${map['TITLE'] }</p>
					                        	<input type="text" name="title" id="editTitle" class="form-control" value="${map['TITLE'] }" style="display: none;" maxlength="33">
					                          	<p class="mb-0 fs--1"><fmt:formatDate value="${map['REGDATE'] }" pattern="yy-MM-dd HH:mm"/></p>
					                        </div>
				                      	</div>
				                    </div>
				                    <div class="col-auto" id="editBtDiv" style="display: none;">
				                        <button class="btn btn-primary btn-sm " id="editBoradBt" type="submit" style="width: 80px;">수정</button>
				                        <button class="btn btn-primary btn-sm " id="editCancelBt" type="button" onclick="editReturn(this)" style="width: 80px;">취소</button>
				                    </div>
				                    <div class="col-auto">
				                    	<div class="dropdown font-sans-serif btn-reveal-trigger">
				                        	<button class="btn btn-link text-600 btn-sm dropdown-toggle p-1 dropdown-caret-none btn-reveal" type="button" id="post-album-action" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                        		<span class="fas fa-ellipsis-h fs--1"></span>
				                        	</button>
					                        <div class="dropdown-menu dropdown-menu-end py-3" aria-labelledby="post-album-action">
					                        	<c:if test="${map['EMP_NO']==sessionScope.empNo }">
						                        	<a class="dropdown-item" href="#!" onclick="editSet(this)">수정하기</a>
						                          	<a class="dropdown-item text-danger" onclick="deleteBoard(${map['BOARD_NO'] })" href="#!">삭제하기</a>
					                        	</c:if>
					                        	<c:if test="${map['EMP_NO']!=sessionScope.empNo }">
						                          	<a class="dropdown-item text-danger" href="#!" onclick="boardReport(${map['BOARD_NO'] })">신고하기</a>
					                        	</c:if>
					                        	<input type="hidden" value="${map['BOARD_NO'] }">
					                        </div>
				                      	</div>
				                    </div>
				                </div>
				            </div>
				            <div class="card-body overflow-hidden">
				            	<p id="contentP">${map['CONTENT'] }</p>
				            	<textarea name="content" id="editContent" class="shadow-none form-control rounded-0 resize-none px-x1 border-y-0 border-200" rows="4" style="display: none;">${map['CONTENT'] }</textarea>
				            	<input name="upfile" type="hidden" class="form-control" accept="image/*" multiple="multiple">
				            	<c:if test="${!empty map['FILENAME'] }">
							    	<div class="row mx-n1 img-slider">
										<div class="col-2 p-1 m-auto" id="leftBtDiv" align="right">
								        	<button class="btn leftBt" type="button" style="width: 50px">
								            	<img class="img-fluid rounded" src="<c:url value='/images/left.png'/>" alt="" />
								            </button>
								        </div>
										<div class="col-8" id="centerDiv" align="center" >
							            	<c:forEach var="pdsVo" items="${imageList }" >
							            		<c:if test="${pdsVo.boardNo == map['BOARD_NO']}">
									            	<c:if test="${imgCnt == 0}">
										            	<div class="col img-div slideActive" style="background-image:url(<c:url value='/images/${pdsVo.fileName }'/>)"></div>
													</c:if>
									            	<c:if test="${imgCnt > 0}">
										            	<div class="col img-div" style="background-image:url(<c:url value='/images/${pdsVo.fileName }'/>)"></div>
													</c:if>
										            <c:set var="imgCnt" value="${imgCnt+1 }"/>
												</c:if>
							            	</c:forEach>
								        </div>
										<div class="col-2 p-1 m-auto" id="rightBtDiv">
								        	<button class="btn rightBt" type="button" style="width: 50px">
								            	<img class="img-fluid rounded" src="<c:url value='/images/right.png'/>" alt="" />
								        	</button>
								  		</div>
							      	</div>
								    <div class="col-12 page-nav" align="center">
							        	<c:forEach var="pdsVo" items="${imageList }" >
							            	<c:if test="${pdsVo.boardNo == map['BOARD_NO']}">
							            		<c:if test="${divCnt == 0}">	
													<div class="slideActive"></div>
												</c:if>
							            		<c:if test="${divCnt > 0}">	
												    <div></div>
												</c:if>
												<c:set var="divCnt" value="${divCnt+1 }"/>
											</c:if>
							            </c:forEach>
									</div>
									<div class="col-12" id="editImgDiv" style="display: none;">
										<c:forEach var="pdsVo" items="${imageList }" >
								        	<c:if test="${pdsVo.boardNo == map['BOARD_NO']}">
									        	<div>
									        		<img src="<c:url value='/images/file.gif' />" alt="파일그림">
														${pdsVo.fileName }
													<a href="#!" onclick="deleteImg('${pdsVo.fileName }',this)">
														<span class="badge rounded-pill text-bg-primary">
								                        	삭제
								                        </span>
							                        </a>
							                    </div>
								        	</c:if>
								        </c:forEach>
									</div>
				            	</c:if>
				          	</div>
				        </form>
	            		<div class="card-footer bg-light pt-0" id="datgeulInfo">
	            			<div class="border-bottom border-200 fs--1 py-3">
		            			<c:choose>
						    		<c:when test="${!empty commentCntList}">
						        		<c:set var="commentCnt" value="0" />
						        		<c:forEach var="cntMap" items="${commentCntList}">
							            	<c:if test="${cntMap['BOARD_NO'] == map['BOARD_NO']}">
							                	<a class="text-700" href="#!">${cntMap['CNT']}개의 댓글이 있습니다.</a>
							                	<c:set var="commentCnt" value="1" />
							            	</c:if>
						        		</c:forEach>
								        <c:if test="${commentCnt == 0}">
								            <a class="text-700" href="#!">댓글이 없습니다.</a>
								        </c:if>
						    		</c:when>
								    <c:otherwise>
								        <a class="text-700" href="#!">댓글이 없습니다.</a>
								    </c:otherwise>
								</c:choose>
	                		</div>
			                <div class="row g-0 fw-semi-bold text-center py-2 fs--1">
			                    <div class="col-auto">
			                    	<a class="rounded-2 d-flex align-items-center me-3" onclick="divEvent(this)" href="#!">
			                    		<img src="<c:url value='/assets/img/icons/spot-illustrations/comment-active.png'/>" width="20" alt="" />
			                    		<span class="ms-1">댓글</span>
			                    	</a>
			                    </div>
			                </div>
			                <div class="col-12" id="datgeulWriteDiv" style="display: none;">
					            <form name="frmDatgeulForm" class="d-flex align-items-center border-top border-200 pt-3" method="post" action="<c:url value='/anonymous/datgeulWrite'/>"/>
					                <input class="form-control rounded-pill ms-2 fs--1" type="text" name="content" placeholder="내용을 입력하세요." />
					                <input type="hidden" name="boardNo" value="${map['BOARD_NO']}" />
					            </form>
			                </div>
	                		<c:if test="${!empty commentsList }">
	                			<c:forEach var="commentVo" items="${commentsList }">
		                			<c:if test="${commentVo.boardNo==map['BOARD_NO'] and commentVo.step==0}">
	                					<div class="row mt-1" id="datgeulViewDiv" style="display: none;">
			                				<div class="col-1 fs--1" style="width: 20px;">
				                				<div class="avatar avatar-xl">
				                    				<img class="rounded-circle" src="<c:url value='/images/anonymous.png'/>" alt="" />
				                    			</div>
				                			</div>
			                    			<div class="col flex-1 ms-2 fs--1" id="datgeulEditDiv">
			                    				<form name="frmDatgeulEditForm" >
							                    	<p class="mb-1 bg-200 rounded-3 p-2" id="datguelP">
							                      		익명 :
								                      	<c:if test="${commentVo.reportStatus==1}">
								                      		신고된 댓글입니다.
								                      	</c:if>
								                      	<c:if test="${commentVo.reportStatus!=1}">
								                      		${commentVo.content}
								                      	</c:if>
							                      	</p>
				                      				<input class="form-control" type="hidden" name="content" value="${commentVo.content}">
					                    			<input type="hidden" name="commentNo"value="${commentVo.commentNo }">  
			                    				</form>  	
			                      				<div class="row">
							                      	<div class="col px-3">
							                      		<fmt:formatDate value="${commentVo.regdate}" pattern="yy-MM-dd HH:mm"/>
							                      		&bull;<a href="#!" onclick="replyShow(this)">답글</a>  
							                      		&bull;<a href="#!" onclick="reply(this)">답글달기</a>
							                      		<c:if test="${commentVo.empNo!=sessionScope.empNo }">
								                      		&bull;<a href="#!" onclick="commentReport(${commentVo.commentNo },${commentVo.boardNo})">신고하기</a> 
							                      		</c:if>
							                      	</div>
				                      				<div class="col-auto px-3" >
								                      	<c:if test="${commentVo.empNo==sessionScope.empNo }">
								                      		<a href="#!" id="editDatguelA" onclick="editDatguel(this)">수정</a>&bull;  
								                      		<a href="#!" onclick="deleteDatguel(this)">삭제</a>
								                      	</c:if>  
					                    			</div>
								                    <div class="col-12 px-3" id="replyDiv" style="display: none;">
									                    <form name="frmReplyForm" class="d-flex align-items-center pt-3" method="post" action="<c:url value='/anonymous/replyWrite'/>">
									               			<input class="form-control rounded-pill ms-2 fs--1" name="content" type="text" placeholder="내용을 입력하세요." />
									            			<input type="hidden" name="boardNo"value="${commentVo.boardNo}">  
									            			<input type="hidden" name="groupNo"value="${commentVo.groupNo}">  
									            			<input type="hidden" name="step"value="${commentVo.step}">  
									            			<input type="hidden" name="sortNo"value="${commentVo.sortNo}">  
									            		</form>
								            		</div>
			                      				</div>
			                   				</div>
			                   				<c:forEach var="commentVo2" items="${commentsList }">
			                   					<c:if test="${commentVo2.groupNo==commentVo.groupNo and commentVo2.step==1}">
					               					<div class="col-12 mt-2" id="replyInfo" style="display: none; margin-left: 20px;">
						           						<div class="row">
											            	<div class="col-1 fs--1" style="width: 20px;">
												            	<div class="avatar avatar-xl">
												                	<img class="rounded-circle" src="<c:url value='/images/anonymous.png'/>" alt="" />
												                </div>
												            </div>
												            <div class="col flex-1 ms-2 fs--1">
												            	<form name="frmReplyEditForm">
													            	<p class="mb-1 bg-200 rounded-3 p-2" id="replyP">
													                	익명 :
													                	<c:if test="${commentVo2.reportStatus==1}">
												                      		신고된 댓글입니다.
												                      	</c:if>
												                      	<c:if test="${commentVo2.reportStatus!=1}">
												                      		${commentVo2.content}
												                      	</c:if>
													                </p>
												                	<input class="form-control" type="hidden" name="content" value="${commentVo2.content}">
								                   		 			<input type="hidden" name="commentNo" value="${commentVo2.commentNo }">
								                   		 		</form>
												                <div class="row">
														        	<div class="col px-3">
														        		<fmt:formatDate value="${commentVo2.regdate}" pattern="yy-MM-dd HH:mm"/>
														            </div>
														            <div class="col-auto px-3" id="editReplyDiv">
															            <c:if test="${commentVo2.empNo==sessionScope.empNo }">
															            	<a href="#!" onclick="editReply(this)">수정</a>&bull;  
															            	<a href="#!" onclick="deleteReply(this)">삭제</a>  
															            </c:if>
															            <c:if test="${commentVo2.empNo!=sessionScope.empNo }">
															            	<a href="#!" onclick="commentReport(${commentVo2.commentNo },${commentVo2.boardNo })">신고하기</a> 
															            </c:if>
															        </div>
														        </div>
												            </div>
							            				</div>
						            				</div>
			                   					</c:if>
			                   				</c:forEach>
										</div>
		                   			</c:if>
	                			</c:forEach>
	                		</c:if>
						</div>
					</div>
					<c:set var="no" value="${map['BOARD_NO'] }"/>
					<c:set var="imgCnt" value="0"/>
					<c:set var="divCnt" value="0"/>
	        	</c:if>
	        </c:forEach>
        </c:if>
	</div>
</div>
<%@ include file = "../inc/bottom.jsp" %>