<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>
<form name="documentFrm" method="get" enctype="multipart/form-data" action="aa.jsp">
<div class="container p-0">
	<div class="row g-0">
		<div class="col-lg pe-lg-2 mb-3">
			<div class="card h-lg-100 overflow-hidden">
				<div class="card-header bg-light">전자결재
					<div class="row gx-2">
						<div class="col-sm-4">	
							<label class="form-label" for="documentNo">
		               			종류
		                	</label>
			                <select class="form-select" id="documentNo" >
			                	<option>결재종류</option>
			                	<option value="documentno">휴가신청</option>
			                	<option>기안서</option>
			                	<option>보고서</option>
			                </select>
		                </div>
		                <div class="col-sm-4">
		                		<label class="form-label">
		               				작성일
		                		</label><br>
		                		2023-08-04
		                </div>
		                <div class="col-sm-4">
		                		<label class="form-label">
		               				수정일
		                		</label><br>
		                		2023-08-04
		                </div>
	                </div>
				</div>
	                <div class="card-body">
	                    <div class="row gx-2">
	                    <div class="col-12 mb-3">
	                  		<label class="form-label" for="confirm_title">
	               				제목
	                    	</label>
	                    	<input class="form-control" id="confirm_title" type="text" placeholder="제목을 입력하세요" />
	                    </div>
	                    <div class="col-sm-6 mb-3">
	                    	<label class="form-label">
	                        	기안자
	                        </label><br>
	                        	기안자
	                    </div>
	                    <div class="col-sm-6 mb-3">
	                        <label class="form-label" for="confirmDocumentNo">
	                        	문서번호
	                        </label><br>
	                        20230804-ㅁ
	                    </div>
	                    <div class="col-sm-6 mb-3">
	                        <label class="form-label" for="deptName">
	                        	부서
	                        </label><br>
	                       		부서
	                    </div>
	                    <div class="col-sm-6 mb-3">
	                        <label class="form-label" for="positionName">
	                        	직책
	                        </label><br>
	                        	직책
	                    </div>
	                    <div class="col-sm-6">
	                    	<label class="form-label" for="deptNo">
	                        	합의부서
	                        </label>
	                        <select class="form-select" name="deptNo" id="deptNo" >
	                          	<option>GMT+14:00 Pacific/Kiritimati</option>
	                          	<option>GMT+14:00 Pacific/Kiritimati</option>
	                        </select>
	                    </div>
	                    <div class="col-sm-6">
	                        <label class="form-label" for="reperEmpName">
	                        	참조자
	                        </label>
	                        <input class="form-control" name="reperEmpName" id="reperEmpName" type="text" placeholder="클릭하세요"/>
	                    </div>
	                    <div class="col-12">
	                       	<div class="border-bottom border-dashed my-3"></div>
	                    </div>
	                    <div class="col-sm-4 mb-3">
	                        <label class="form-label" for="confirm1_Name">검토자</label>
	                        <input class="form-control" name="confirm1_Name" id="confirm1_Name" type="text" placeholder="City" />
	                    </div>
	                    <div class="col-sm-4 mb-3">
	                        <label class="form-label" for="confirm2_Name">확인자</label>
	                        <input class="form-control" name="confirm2_Name" id="confirm2_Name" type="text" placeholder="State" />
	                    </div>
	                    <div class="col-sm-4 mb-3">
	                        <label class="form-label" for="confirm3_Name">승인자</label>
	                        <input class="form-control" name="confirm3_Name" id="confirm3_Name" type="text" placeholder="Country" />
	                    </div>
	                    <div class="col-12">
	                        <label class="form-label" for="confirmContent">내용</label>
	                        <textarea class="form-control" name="confirmContent" id="confirmContent" rows="6"></textarea>
	                    </div>
	                    <div class="col-12 mt-1">
	                        <label class="form-label mb-0" for="confirmFile">첨부파일</label>
	                        <input class="form-control" name="confirmFile" id="confirmFile" type="file"/>
	                    </div>
	                    <div class="col-12 mt-1">
	                        <label class="form-label mb-0"  for="confirmFile2">첨부파일</label>
	                        <input class="form-control" name="confirmFile2" id="confirmFile2" type="file"/>
	                    </div>
	                    <div class="col-12 mt-1">
	                        <label class="form-label mb-0" for="confirmFile3">첨부파일</label>
	                        <input class="form-control" name="confirmFile3" id="confirmFile3" type="file"/>
	                    </div>
	                    <div class="col-sm-2 m-auto mt-3">
	                        <input class="form-control" id="event-state" type="submit" value="작성" placeholder="State" />
	                    </div>
	                </div>
	        	</div>
			</div>
		</div>
	</div>
</div>
</form>
<%@ include file = "../inc/bottom.jsp" %>