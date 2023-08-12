<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/css/PDScss.css'/>">

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
                        <dd>${map['NAME']}</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd HH:mm:ss"/></dd>
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
            <div class="bt_wrap">
                <a href="<c:url value='/pds/list'/>" class="on">목록</a>
                <a href="<c:url value='/pds/edit?boardNo=${map["BOARD_NO"] }'/>">수정</a>
            </div>
        </div>
    </div>

<%@ include file="../inc/bottom.jsp"%>