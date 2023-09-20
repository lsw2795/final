<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/css/PDScss.css'/>">
<script type="text/javascript">
	$(function() {
		$('#deletePds').click(function() {
			if(confirm("자료를 삭제하시겠습니까?")){
				location.href = "<c:url value="/pds/delete?boardNo=${map['BOARD_NO']}"/>"
			}
		});
		
	});
</script>

<style>
    .file_list .file_input {
        width: 700px;
    }
</style>

<div class="board_wrap">
    <div class="board_title">
        <strong>자료실</strong>
        <p>사내 자료실입니다.</p>
    </div>
    <div class="board_view_wrap">
        <div class="board_view">
            <div class="title">
                ${map['TITLE']}
            </div>
            <div class="info">
                <dl>
                    <dt>번호</dt>
                    <dd>${map['BOARD_NO']}</dd>
                </dl>
                <dl>
                    <dt>작성자</dt>
                    <dd>${map['NAME']}(${map['DEPTNAME']}팀)</dd>
                </dl>
                <dl>
                    <dt>작성일</dt>
                    <dd><fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd HH:mm:ss" /></dd>
                </dl>
                <dl>
                    <dt>조회</dt>
                    <dd>${map['READCOUNT']}</dd>
                </dl>
            </div>
            <div class="cont">
                ${map['CONTENT']}
            </div>
        </div>

        <div class="file_list">
            <div>
                <div class="file_input">
                    <c:if test="${!empty fileList}">
                        <c:forEach var="vo" items="${fileList}" varStatus="status">
                            <div>
                                <span>
                                    <img src="<c:url value='/images/file.gif' />" alt="파일 이미지">
                                    <a href="<c:url value='/pds/download?boardNo=${vo.boardNo}&fileName=${vo.fileName}' />">
                                        ${fileInfoArr[status.index]}
                                    </a>
                                </span>
                                | <span>다운:${vo.downloadCount}</span>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>

        <div class="bt_wrap">
            <a href="<c:url value='/pds/list' />" class="on">목록</a>
            <c:if test="${sessionScope.empNo==map['EMP_NO']}">
                <a href="<c:url value='/pds/edit?boardNo=${map["BOARD_NO"]}'/>">수정</a>
            </c:if>
            <c:if test="${sessionScope.empNo==map['EMP_NO']}">
                <a href="#" id="deletePds">삭제</a>
            </c:if>
        </div>
    </div>
</div>

<%@ include file="../inc/bottom.jsp" %>