<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/adminTop.jsp" %>
<style>
    .title {
        position: left;
        left: 10px;
        position: absolute;
        left: 100px;
        top: 10px;
    }

    html, body {
        color: white;
    }
</style>

<script type="text/javascript">
    function deleteQna() {
        if (confirm("질문을 삭제하시겠습니까?")) {
            location.href = "<c:url value='/admin/qna/delete?boardNo=${map.BOARD_NO}'/>";
        }
    }
</script>

<div class="row g-3">
    <div class="col-xxl-12 col-xl-8">
        <div class="card">
            <div class="card-header d-flex flex-between-center">
                <button class="btn btn-falcon-default btn-sm" type="button">
                    <a href="<c:url value='/admin/qna/list'/>"><span class="fas fa-arrow-left"></span></a>
                </button>
                <div class="d-flex">
                    <h2 class="title">Q&A 게시판</h2>
                    <!-- 로그인한 사원과 게시글 작성자와 같을 경우에만 질문 수정 버튼이 보임 -->
                    <a href="<c:url value='/admin/qna/edit?boardNo=${map.BOARD_NO}'/>">
                        <button class="btn btn-falcon-default btn-sm" type="button">
                            <span class="fas fa-pen" data-fa-transform="shrink-2 down-1"></span>
                            <span class="d-none d-md-inline-block ms-1">질문 수정</span>
                        </button>
                    </a>
                    <button onclick="deleteQna()" class="btn btn-falcon-default btn-sm ms-2 d-none d-sm-block" type="button">
                        <span class="fas fa-trash-alt" data-fa-transform="shrink-2 down-1"></span>
                        <span class="d-none d-md-inline-block ms-1">삭제</span>
                    </button>
                    <div class="dropdown font-sans-serif ms-2">
                    </div>
                </div>
            </div>
        </div>
        <div class="card mt-3">
            <div class="card-header bg-light">
                <h1><span class="fas me-2 fa-question-circle"></span><span>${map['TITLE']}</span></h1>
            </div>
            <div class="card-body">
                <!-- 질문 글  -->
                <div class="d-md-flex d-xl-inline-block d-xxl-flex align-items-center justify-content-between mb-x1">
                    <div class="d-flex align-items-center gap-2">
                        <a href="../../app/support-desk/contact-details.jsp">
                            <div class="avatar avatar-2xl">
                                <c:if test="${!empty map['IMAGE']}">
                                    <img class="rounded-circle" src="<c:url value='/images/${map["IMAGE"]}'/>" alt="글쓴 사원 이미지" />
                                </c:if>
                                <c:if test="${empty map['IMAGE']}">
                                    <div class="avatar avatar-2xl">
                                        <img class="rounded-circle" src="<c:url value='/images/noImage.jpg'/>"  />
                                    </div>
                                </c:if>
                            </div>
                        </a>
                        <p class="mb-0"><a class="fw-semi-bold mb-0 text-800" href="../../app/support-desk/contact-details.jsp">${map['NAME']}</a><a class="mb-0 fs--1 d-block text-500" href="mailto:emma@watson.com">${map['EMAIL']}</a></p>
                    </div>
                    <p class="mb-0 fs--2 fs-sm--1 fw-semi-bold mt-2 mt-md-0 mt-xl-2 mt-xxl-0 ms-5"><fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd"/><span class="mx-1">|</span><span class="fst-italic"><fmt:formatDate value="${map['REGDATE']}" pattern="a h:mm"/></span><span class="fas fa-star ms-2 text-warning"></span></p>
                </div>
                <!-- 글 줄바꿈 처리  -->
                <% pageContext.setAttribute("newLine", "\r\n"); %>
                <c:set var="content" value="${fn:replace(map['CONTENT'], newLine, '<br>')}" />
                <div id="content">
                    ${content}
                </div>
                <!-- 질문 글 끝  -->
                <div class="my-5 position-relative text-center">
                    <hr class="position-absolute top-50 border-300 w-100 my-0" /><span class="position-relative bg-white dark__bg-card-dark px-3 z-1">
                      <button class="btn btn-sm btn-outline-secondary rounded-pill border-300 px-lg-5">답변 내용</button></span>
                </div>
                <!-- 답변 반복 시작 -->
                <c:forEach var="replyMap" items="${replyList}">
                    <div class="d-md-flex d-xl-inline-block d-xxl-flex align-items-center justify-content-between mb-x1">
                        <div class="d-flex align-items-center gap-2">
                            <c:if test="${!empty replyMap['IMAGE']}">
                                <div class="avatar avatar-2xl">
                                    <img class="rounded-circle" src="<c:url value='/images/${replyMap["IMAGE"]}'/>"  />
                                </div>
                            </c:if>
                            <c:if test="${empty replyMap['IMAGE']}">
                                <div class="avatar avatar-2xl">
                                    <img class="rounded-circle" src="<c:url value='/images/noImage.jpg'/>"  />
                                </div>
                            </c:if>
                            </a>
                            <p class="mb-0"><a class="fw-semi-bold mb-0 text-800" href="../../app/support-desk/contact-details.jsp">${replyMap['NAME']}</a>
                                <a class="mb-0 fs--1 d-block text-500" href="mailto:mike@support.com">${replyMap['EMAIL']}</a></p>
                        </div>
                        <p class="mb-0 fs--2 fs-sm--1 fw-semi-bold mt-2 mt-md-0 mt-xl-2 mt-xxl-0 ms-5"><fmt:formatDate value="${replyMap['REGDATE']}" pattern="yyyy-MM-dd"/><span class="mx-1">|</span><span class="fst-italic"><fmt:formatDate value="${replyMap['REGDATE']}" pattern="a h:mm"/></span><span class="fas fa-star ms-2 text-warning"></span></p>
                    </div>
                    <div class="border-bottom mb-5 pb-5">
                        <!-- 답변 글 줄바꿈 처리  -->
                        <% pageContext.setAttribute("newLine", "\r\n"); %>
                        <c:set var="content" value="${fn:replace(replyMap['CONTENT'], newLine, '<br>')}" />
                        <div id="content">
                            ${content}
                        </div>
                    </div>
                </c:forEach>
                <!-- 답변 반복 끝  -->
            </div>
        </div>
    </div>
</div>
<%@ include file="../../inc/adminBottom.jsp" %>