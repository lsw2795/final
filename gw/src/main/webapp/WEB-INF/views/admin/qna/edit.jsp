<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp" %>

<form id="qnaEditForm" method="post" action='<c:url value='/admin/qna/edit'/>'>
    <h2 class="mb-0">Q&A 수정</h2>
    <div class="card-body p-0">
        <div class="border border-top-0 border-200">
            <input type="hidden" name="boardNo" value="${map['BOARD_NO']}">
            <input class="form-control border-1 rounded-1 outline-none px-x1" name="title" id="title" placeholder="제목" value="${map['TITLE']}" />
        </div>
        <div class="mb-3">
            <textarea class="form-control" name="content" cols="50" rows="20" placeholder="내용" form="qnaEditForm">${map['CONTENT']}</textarea>
        </div>
    </div>
    <button class="btn btn-primary btn-sm px-5 me-2" type="submit">수정</button>
</form>
<%@ include file="../../inc/adminBottom.jsp" %>