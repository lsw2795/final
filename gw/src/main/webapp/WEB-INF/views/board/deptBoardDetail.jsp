<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
사원뷰 - 부서게시판(동적 게시판) 상세뷰
내용 : 게시글 좋아요 활성화시 ajax 이용한 좋아요 등록, 좋아요 감소, 좋아요 재증가 처리
	  게시글 업로드 활성화시 업로드한 첨부파일 제목+용량 조회(여러개 파일 등록시 누적으로 보이도록 함)
	  게시글 댓글 입력 활성화시 ajax 이용한 댓글 등록,수정,삭제 답글 등록,수정,삭제 처리
	  게시글 작성자 공개여부 활성화시 작성자의 정보와 댓글,답글 작성자의 정보 조회와 정보보기 처리
	  이전글과 다음글 ajax 활용한 조회수 증가 처리
컨트롤러 : com.ez.gw.board.controller.DeptBoardController
작성자 : 송영은
작성일 : 2023.09
 -->     
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet"href="<c:url value='/css/mypageempform.css'/>">
<style type="text/css">
 #CMDiv {
    display: flex;
  }
 #commentContent {
    flex: 1;
    margin-right: 10px;
  }
</style>   
<script type="text/javascript">
	$(function(){
		//게시글 작성자에게 보이는 삭제버튼 
		$('#btnDelete').click(function(){
			if(confirm('정말 삭제하시겠습니까?')){
				location.href="<c:url value='/board/deptBoardDelete?boardlistNo=${boardlistVo.boardlistNo}&boardNo=${param.boardNo }'/>";
			}
		});
		//댓글 등록 활성화시 유효성 검사 진행 후 댓글 등록 처리
		$('#btnInsertCM').click(function(){
			if($('#commentContent').val().length<10){
				alert('댓글 등록을 위해서는 최소 10글자 입력이 필요합니다.');
				$('#commentContent').focus();
				return false;
			}
			
			//alert($.param($('#frmComment').serializeArray())); 
			$.ajax({
	            url: "<c:url value='/board/ajaxInsertBoardCM'/>",
	            type:'post',
				data: $('#frmComment').serializeArray(),
				dataType:'json',
	            success: function (res) {
	            	if(res>0){
                   		alert("댓글 등록이 완료되었습니다.");
                   		location.reload();
	            	}
	            },
	            error:function(xhr,status,error){
	                alert(status+" : "+error);
	            } 
	        });//ajax
		});
		//댓글 등록전 취소 버튼 클릭시 새로고침
		$('.btnCancelCM').click(function(){
			location.reload();
		});
		
	});
	//게시글 작성자, 댓글, 답글 작성자의 각각 정보보기
	function empDetail(empNo) {
	    window.open("<c:url value='/mypage/empDetail?empNo='/>"+empNo,'empDetail', 'width=320,height=550,top=300,left=700,location=yes,resizable=yes');
	}
	//댓글+답글 수정 
	function btnCmEdit(index){
		var commentNo=$('#commentNo'+index).val();
		//alert(commentNo);
		var cmContent=$('#cmContent'+index).text();
		//alert(cmContent);
		$('#commentDiv'+index).empty();
		var result="<textarea class='form-control' id='editCM"+index+"' name='content' rows='3'>"+cmContent+"</textarea>";
		$('#commentDiv'+index).append(result);
		$('#editCM'+index).focus();
		$('#btnCmEdit'+index).hide();
		$('#realEditCM'+index).css("visibility", "visible");
		$('#btnCancel'+index).css("visibility","visible");
		
		$('#realEditCM'+index).click(function(){
			if($('#editCM'+index).val().length<10){
				alert('댓글 등록을 위해서는 최소 10글자 입력이 필요합니다.');
				$('#editCM'+index).focus();
				return false;
			}
			var content=$('#editCM'+index).val();
			var boardlistNo='<%= request.getParameter("boardlistNo") %>';
			var commentNo=$('#commentNo'+index).val();
			//alert(content+" : "+boardlistNo+" : "+commentNo);
			
			$.ajax({
	            url: "<c:url value='/board/ajaxUpdateBoardCM'/>",
	            type:'get',
				data:{
					content: content,
					boardlistNo: boardlistNo,
					commentNo: commentNo
				},
				dataType:'json',
	            success: function (res) {
	            	if(res>0){
                   		alert("댓글 수정이 완료되었습니다.");
                   		location.reload();
	            	}
	            },
	            error:function(xhr,status,error){
	                alert(status+" : "+error);
	            } 
	        });//ajax
		});
	}
	//댓글+답글 삭제
	function btnCmDel(index){
		if(confirm('댓글을 삭제하시겠습니까?')){
		var boardlistNo='<%= request.getParameter("boardlistNo") %>';
		var commentNo=$('#commentNo'+index).val();
			//alert(boardlistNo+" : "+commentNo);
			$.ajax({
	            url: "<c:url value='/board/ajaxDeleteBoardCM'/>",
	            type:'get',
				data:{
					boardlistNo: boardlistNo,
					commentNo: commentNo
				},
				dataType:'json',
	            success: function (res) {
	            	if(res>0){
                   		alert("댓글 삭제가 완료되었습니다.");
                   		location.reload();
	            	}
	            },
	            error:function(xhr,status,error){
	                alert(status+" : "+error);
	            } 
	        });//ajax
			
		}
	}
	//답글 등록
	function insertRCM(index){
		var email=$('#email').val();
		var name=$('#name').val();
		
		$('#textAreaDiv'+index).empty();
		$('#btnInsertRCMDiv'+index).empty();
		$('#empDiv'+index).empty();
		
		var result="<textarea class='form-control' id='commentRContent"+index+"' rows='3'></textarea>";
		$('#textAreaDiv'+index).append(result);
		
		var result2="<input type='button' id='btnInsertRCM"+index+"' value='등록' class='btn btn-outline-primary' style='height:82px; visibility: hidden;'/>"
     		+"&nbsp;<input type='button' id='btnCancelRCM"+index+"' value='취소' class='btn btn-outline-secondary btnCancelRCM' style='height:82px; visibility: hidden;'/>";
		$('#btnInsertRCMDiv'+index).append(result2);
		
		var result3="<span class='bold' style='color: black;'>"+name+"</span>&nbsp;"
        			+"<span class='text-500'>&lt;"+email+"&gt;</span>";
		$('#empDiv'+index).append(result3);
		$('#insertRCM'+index).hide();
		$('#btnInsertRCM'+index).css("visibility", "visible");
		$('#btnCancelRCM'+index).css("visibility","visible");
		
		
		$('.btnCancelRCM').click(function(){
			location.reload();
		});
		
		$('#btnInsertRCM'+index).click(function(){
			var content=$('#commentRContent'+index).val();
			var boardlistNo=$('#boardlistNo').val();
			var boardNo=$('#boardNo').val();
			var empNo=$('#empNo').val();
			var groupNo=$('#groupNo'+index).val();
			var sortNo=$('#sortNo'+index).val();
		//alert(content+" : "+boardlistNo+" : "+boardNo+" : "+empNo+" : "+groupNo+" : "+sortNo);
		
			if($('#commentRContent'+index).val().length<10){
				alert('답글 등록을 위해서는 최소 10글자 입력이 필요합니다.');
				$('#editCM'+index).focus();
				return false;
			}
		
			$.ajax({
	            url: "<c:url value='/board/ajaxReplyRCM'/>",
	            type:'get',
				data:{
					content: content,
					boardlistNo: boardlistNo,
					boardNo: boardNo,
					empNo: empNo,
					groupNo: groupNo,
					sortNo: sortNo,
				},
				dataType:'json',
	            success: function (res) {
	            	if(res>0){
                   		alert("답글 등록이 완료되었습니다.");
                   		location.reload();
	            	}
	            },
	            error:function(xhr,status,error){
	                alert(status+" : "+error);
	            } 
	        });//ajax
		});
		
	}
	//댓글 페이징처리
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
	//좋아요 활성화시 조회수 최초클릭 - 데이터 등록처리
	function deptBoardLikeOn(){
		var boardNo=$('#boardNo').val();
		var empNo=$('#empNo').val();
		//alert(boardNo+" : "+empNo);
		
		$.ajax({
            url: "<c:url value='/board/ajaxInsertDeptBoardLike'/>",
            type:'get',
			data:{
				boardNo: boardNo,
				empNo: empNo,
			},
			dataType:'json',
            success: function (res) {
            	if(res>0){
            		alert('좋아요 등록이 완료되었습니다.');
            		$('#heartDiv').empty();
            		$('#heart1').hide();
            		$('#heart2').hide();
            	var result="<a href='#' id='heart2' style='float: right;' onclick='deptBoardLikeOff();'>"
					+"<img id='heartimg' src='<c:url value='/images/hearton.png'/>' width='50px' height='50px'></a>";					
					$('#heartDiv').append(result);
					location.reload();
            	}
            },
            error:function(xhr,status,error){
                alert(status+" : "+error);
            } 
        });//ajax
		
	}
	
	//좋아요 활성화시 좋아요 취소버튼(좋아요 -1 업데이트)
	function deptBoardLikeOff(){
		var boardNo=$('#boardNo').val();
		var empNo=$('#empNo').val();
		//alert(boardNo+" : "+empNo);
		
		if(confirm('좋아요를 취소하시겠습니까?')){
			$.ajax({
	            url: "<c:url value='/board/ajaxUpdateDeptBoardLikeOff'/>",
	            type:'get',
				data:{
					boardNo: boardNo,
					empNo: empNo,
				},
				dataType:'json',
	            success: function (res) {
	            	if(res>0){
	            		$('#heartDiv').empty();
	            		$('#heart2').hide();
	            		$('#heart3').hide();
	               		var result="<a href='#' id='heart3' style='float: right;' onclick='deptBoardLikeOn2();'>"
	               			+"<img id='heartimg' src='<c:url value='/images/heartoff.png'/>' width='50px' height='50px'></a>";
	               		$('#heartDiv').append(result);
	               		location.reload();
	            	}
	            },
	            error:function(xhr,status,error){
	                alert(status+" : "+error);
	            } 
	        });//ajax
		}
	}
	//좋아요 활성화시 다시 좋아요 버튼 클릭(좋아요 +1 업데이트)
	function deptBoardLikeOn2(){
		var boardNo=$('#boardNo').val();
		var empNo=$('#empNo').val();
		//alert(boardNo+" : "+empNo);
		$.ajax({
            url: "<c:url value='/board/ajaxUpdateDeptBoardLikeOn'/>",
            type:'get',
			data:{
				boardNo: boardNo,
				empNo: empNo,
			},
			dataType:'json',
            success: function (res) {
            	if(res>0){
            		alert('좋아요 등록이 완료되었습니다.');
            		$('#heartDiv').empty();
            		$('#heart3').hide();
            		$('#heart2').hide();
               		var result="<a href='#' id='heart2' style='float: right;' onclick='deptBoardLikeOff();'>"
               			+"<img id='heartimg' src='<c:url value='/images/hearton.png'/>' width='50px' height='50px'></a>";
               		$('#heartDiv').append(result);
               		location.reload();
            	}
            },
            error:function(xhr,status,error){
                alert(status+" : "+error);
            } 
        });//ajax
	}
	//이전글, 다음글 조회수 증가 
	function updateReadCount(boardlistNo, boardNo){
		$.ajax({
            url: "<c:url value='/board/updateReadCount'/>",
            type:'get',
			data: {
				boardNo: boardNo
			},
			dataType:'json',
            success: function (res) {
            	var no='<%= request.getParameter("boardNo")%>';
            	if(res>0){
            		if(no>boardNo){
            			location.href="<c:url value='/board/deptBoardDetail?boardlistNo=${prevMap["BOARDLIST_NO"]}&boardNo=${prevMap["MAX(BOARD_NO)"]}'/>";
            		}else if(no<boardNo){
            			location.href="<c:url value='/board/deptBoardDetail?boardlistNo=${nextMap["BOARDLIST_NO"]}&boardNo=${nextMap["MIN(BOARD_NO)"]}'/>";
            		}
            	}
            },
            error:function(xhr,status,error){
                alert(status+" : "+error);
            } 
        });//ajax
	}
</script>
<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/board/deptBoardDetail'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage" value=${param.currentPage }>
	<input type="hidden" name="boardlistNo" value=${param.boardlistNo }>
	<input type="hidden" name="boardNo" value=${param.boardNo }>
</form>	
<div class="card mb-3" id="mybody">
            <div class="card-body d-flex justify-content-between ">
               <div class="d-lg-flex">
              	 <a class=" btn btn-falcon-default btn-sm" 
        			href="<c:url value='/board/deptBoard?boardlistNo=${boardlistVo.boardlistNo}'/>">
              	 	<span class="fas fa-arrow-left"></span>
              	 </a>
              	 <span class="mypagehyphen"></span>
              	 <h5 class="mb-0 "><span class="fas fa-file" style="margin: 0 10px;"></span>${boardlistVo.boardName} 게시판</h5>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header ">
              <div class="row">
                <div class="col-md d-flex">
                  <!-- 게시글 작성자 공개 여부 -->
               	  <c:if test="${boardlistVo.secflag=='Y'}">
                  <div class="avatar avatar-2xl">
                    <img class="rounded-circle" src="<c:url value='/images/${map["IMAGE"]}'/>" alt="사원 이미지"/>
                  </div>
                  </c:if>
                  <div class="flex-1 ms-2">
                    <h5 class="mb-0">${map['TITLE']}</h5>
                    <c:if test="${boardlistVo.secflag=='N'}">
                    익명
                    </c:if>
                    <c:if test="${boardlistVo.secflag=='Y'}">
                    <a class="text-800 fs--1" href="#" onclick="empDetail(${map['EMP_NO']});">
	                    <span class="bold" style="color: black;">${map['NAME']}</span>
	                    <span class="ms-1 text-500">&lt;${map['EMAIL']}&gt;</span>
                    </a>
                    </c:if>
                  </div>
                </div>
                <div class="col-md-auto ms-auto d-flex align-items-center ps-6 ps-md-3">
                 <!-- 좋아요 허용 여부 -->
                	<c:if test="${boardlistVo.boardLike=='Y' && sessionScope.empNo!=map['EMP_NO']}">
                		<c:if test="${empty likeVo}">
	                		<a href="#" id="heart1" style="float: right;" onclick="deptBoardLikeOn();">
								<img id="heartimg" src="<c:url value='/images/heartoff.png'/>" width="50px" height="50px">
							</a>
						</c:if>
						<c:if test="${likeVo.likeFlag=='Y'}">
	                		<a href="#" id="heart2" style="float: right;" onclick="deptBoardLikeOff();">
								<img id="heartimg" src="<c:url value='/images/hearton.png'/>" width="50px" height="50px">
							</a>
						</c:if>
                		<c:if test="${likeVo.likeFlag=='N'}">
	                		<a href="#" id="heart3" style="float: right;" onclick="deptBoardLikeOn2();">
								<img id="heartimg" src="<c:url value='/images/heartoff.png'/>" width="50px" height="50px">
							</a>
						</c:if>
						<div id="heartDiv"></div>
						<span class="mypagehyphen"></span>
                	</c:if>
                		<c:if test="${sessionScope.empNo==map['EMP_NO']}">
	                	<a href="<c:url value='/board/deptBoardEdit?boardlistNo=${boardlistVo.boardlistNo}&boardNo=${param.boardNo }'/>" class="btn btn-outline-warning">수정</a>
	               		<span class="mypagehyphen"></span>
	               		<button type="button" id="btnDelete" class="btn btn-outline-danger">삭제</button>
	               		</c:if>
               		&nbsp;
                	조회수 : ${map['READCOUNT']}
                	<span class="mypagehyphen"></span>
                	<c:if test="${boardlistVo.boardLike=='Y'}">
	                	추천수 : ${map['LIKECOUNT']}
	                	<span class="mypagehyphen"></span>
                	</c:if>
                	등록일 : <fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd a hh:mm:ss"/>
               		<span class="mypagehyphen"></span>
                </div>
              </div>
            </div>
            <div class="card-body" style="background: #f9fafd;">
                <div class="col-lg-12">
                  <div class="card shadow-none mb-3 ">
                    <div class="card-body mypageempdiv15">
                      <p>${map['CONTENT']}</p>
                    </div>
                  </div>
                   <!-- 게시글 첨부파일 업로드 허용 여부 -->
                  <c:if test="${boardlistVo.uploadFlag=='Y'}">
                  <div class="shadow-none mb-3 " style="background: #f9fafd;">
                      <h6 style="color: black;">첨부 파일</h6>
                      <c:if test="${empty pdsList}">
                      첨부파일이 없습니다.
                      </c:if>
                       <c:if test="${!empty pdsList }">
	                      <c:forEach var="pdsVo" items="${pdsList }" varStatus="status">
		                       <span><a href="<c:url value='/notice/download?boardNo=${pdsVo.boardNo}&fileName=${pdsVo.fileName}'/>" style="color: black;">
			                       <img alt="첨부파일 이미지" src="<c:url value='/images/file.gif'/>">
			                     	${fileInfoArr[status.index]}</a>
		                     	</span><br>
	                      </c:forEach>
                     </c:if>
                  </div>
                  </c:if>
                  <!-- 이전글과 다음글 -->
                  <div style="font-size: 18px;">
                	<c:if test="${empty prevMap['MAX(BOARD_NO)']}">
	                 이전 글이 없습니다.
	                </c:if>
                	<c:if test="${!empty prevMap['MAX(BOARD_NO)']}">
	                 <a style="color: black;" href="#" onclick="updateReadCount(${prevMap['BOARDLIST_NO']},${prevMap['MAX(BOARD_NO)']});">이전 글&nbsp;&nbsp;|&nbsp;&nbsp;${prevMap['TITLE']}</a>
	                </c:if>
	                <br>
	                <c:if test="${empty nextMap['MIN(BOARD_NO)']}">
	                 다음 글이 없습니다.
	                </c:if>
	                <c:if test="${!empty nextMap['MIN(BOARD_NO)']}">
                 	  <a style="color: black;" href="#" onclick="updateReadCount(${nextMap['BOARDLIST_NO']},${nextMap['MIN(BOARD_NO)']});">다음 글&nbsp;&nbsp;|&nbsp;&nbsp;${nextMap['TITLE']}</a>
               		</c:if>
                </div>
                  <div class="text-center">
                     <a class="btn btn-falcon-default" href="<c:url value='/board/deptBoard?boardlistNo=${boardlistVo.boardlistNo}'/>">
              	 	목록 가기
              	 	</a>
                  </div>
                </div>
            </div>
            
             <!-- 댓글 허용 여부 -->
            	<c:if test="${boardlistVo.commentFlag=='Y'}">
                <div class="card-header">
                  <h5 class="mb-0">댓글</h5>
                </div>
                <div class="card-body bg-light">
                  <div class="position-relative rounded-1 border bg-white dark__bg-1100 p-3">
                    <div class="position-absolute end-0 top-0 mt-2 me-3 z-1">
                    </div>
                    <div class="row">
                    <form id="frmComment">
                    <input type="hidden" value="${empVo.name}" id="name" name="name"/>
                    <input type="hidden" value="${empVo.email}" id="email" name="email"/>
                    <input type="hidden" value="${empVo.empNo}" id="empNo" name="empNo"/>
                    <input type="hidden" value="${param.boardlistNo}" id="boardlistNo" name="boardlistNo"/>
                    <input type="hidden" value="${param.boardNo}" id="boardNo" name="boardNo"/>
                      <div class="mb-3">
                		<div class="col-auto">
		                  <a href="#" onclick="empDetail(${empVo.empNo});">
		                    <span class="bold" style="color: black;">${empVo.name}</span>
		                    <span class="text-500">&lt;${empVo.email}&gt;</span>
                    	  </a>
                   	   </div>
                      </div>
                      <div id="CMDiv">
                        <textarea class="form-control" id="commentContent" name="content" rows="3"></textarea>
            			<input type="submit" id="btnInsertCM" value="등록" class="btn btn-outline-primary" style="height:82px;"/>
                      </div>
                      </form>
                      </div>
                    <br>
                   <c:if test="${!empty comList}">
                   <c:set var="i" value="0"></c:set>
                   <c:forEach var="comMap" items="${comList }">
					<div class="row">
					<!-- 댓/답구분 --> 
						<c:if test="${comMap['STEP']>0}">
							<c:forEach var="j" begin="1" end="${comMap['STEP']}"> 
							<!-- 1일때 10번 스페이스바 -->
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
						</c:if>
						<c:if test="${boardlistVo.secflag=='Y'}">
					    <div class="flex-1 position-relative ps-3">
					      <a href="#" onclick="empDetail(${comMap['EMP_NO']});">
					        <h6 class="fs-0 mb-0">${comMap['NAME']}
					          <span>[${comMap['DEPT_NAME']}]${comMap['POSITION_NAME']}</span>
					        </h6>
					      </a>
					      <span class="mb-1">${comMap['EMAIL']}</span>
					    </div>
					    </c:if>
					    <c:if test="${boardlistVo.secflag=='N'}">
					    <div class="flex-1 position-relative ps-3">
					    익명
					    </div>
					    </c:if>
						    <div class="col-md-7 text-end">
						    <input type="hidden" id="groupNo${i }" name="groupNo" value="${comMap['GROUPNO']}"/>
						    <input type="hidden" id="sortNo${i }" name="sortNo" value="${comMap['SORTNO']}"/>
						     <input type="hidden" id="commentNo${i }" name="commentNo" value="${comMap['COMMENT_NO']}"/>
						      <c:if test="${comMap['EMP_NO']==sessionScope.empNo}">
						      <input type="button" id="realEditCM${i }" class="btn btn-primary" value="수정" style="visibility: hidden;"/>
							  <span class='mypagehyphen'></span>
							  <input type="button" id="btnCancel${i }" class="btn btn-secondary btnCancelCM" value="취소" style="visibility: hidden;"/>
						      <button type="button" class="btn btn-primary" id="btnCmEdit${i }" onclick="btnCmEdit(${i })">수정</button>
						      </c:if>
						      <input onclick="insertRCM(${i })" id="insertRCM${i }" class="btn btn-outline-warning" type="button" value="답글달기">
						      등록일자 : <fmt:formatDate value="${comMap['REGDATE']}" pattern="yyyy-MM-dd a hh:mm:ss"/>
						       <c:if test="${comMap['EMP_NO']==sessionScope.empNo}">
						      	<button class="btn btn-link" onclick="btnCmDel(${i })" type="button"><span class="fas fa-times-circle text-danger" data-fa-transform="shrink-1"></span></button>
						    	</c:if>
						    </div>
						<div class="mb-3 mt-3" id="commentDiv${i }">
						<!-- 댓/답구분 --> 
						<c:if test="${comMap['STEP']>0}">
							<c:forEach var="j" begin="1" end="${comMap['STEP']}"> 
							<!-- 1일때 10번 스페이스바 -->
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
						</c:if>
					      <span class="text-1000 mb-0" id="cmContent${i }">${comMap['CONTENT']}</span>
					    </div>
					  </div>
					  <div class="border-bottom border-dashed my-3"></div>
                  	<div class="row mb-3 d-flex align-items-center">
                       <div class="mb-3">
                		<div class="col-auto" id="empDiv${i }"></div>
                      </div>
                      <div class="col-md-10 mypageempdiv1">
                     	<div id="textAreaDiv${i }"></div>
                      </div>
	                  <div class="col-auto mypageempdiv16">
	                  	<div id="btnInsertRCMDiv${i }" style="display: flex;"></div>
	                  </div>
                     </div>
					  <c:set var="i" value="${i+1 }"/>
					</c:forEach>
                  </c:if>
                 <!-- 댓글 페이징처리 구간 -->
                 <div class="card-footer d-flex justify-content-center">
					<div class="divPage" id="divPage">
						<!-- 페이지 번호 추가 -->		
						<!-- 이전 블럭으로 이동 -->
						<c:if test="${pagingInfo.firstPage>1 }">
							<a href="#" id="prevPage" onclick="pageFunc(${pagingInfo.firstPage-1})">
								<img src="<c:url value='/images/first.JPG'/>">
							</a>
						</c:if>	
										
						<!-- [1][2][3][4][5][6][7][8][9][10] -->
						<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">		
							<c:if test="${i == pagingInfo.currentPage }">		
								<span id="curPage">${i}</span>
					        	</c:if>
							<c:if test="${i != pagingInfo.currentPage }">		
						         <a href="#" id="otherPage" onclick="pageFunc(${i})">${i}</a>
						    </c:if>   		
						</c:forEach>
						
						<!-- 다음 블럭으로 이동 -->
						<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
					         <a href="#" id="nextPage" onclick="pageFunc(${pagingInfo.lastPage+1})">
								<img src="<c:url value='/images/last.JPG'/>">
							</a>
						</c:if>
						<!--  페이지 번호 끝 -->
					</div>
				</div>
               </div>
             </div>
             </c:if>
         </div>
<%@ include file="../inc/bottom.jsp"%>