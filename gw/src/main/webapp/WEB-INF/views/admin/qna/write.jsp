<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file='../../inc/adminTop.jsp'%>
<style>
    h2.mb-0 {
        color: white;
    }

    input#title, textarea#exampleFormControlTextarea1 {
        background: white;
        color: black;
    }

    input#title::placeholder, textarea#exampleFormControlTextarea1::placeholder {
        color: gray;
    }
</style>

<div class="dropdown-menu dropdown-caret dropdown-caret dropdown-menu-end py-0"
     aria-labelledby="navbarDropdownUser">
    <div class="bg-white dark__bg-1000 rounded-2 py-2">
        <a class="dropdown-item fw-bold text-warning" href="#!">
            <span class="fas fa-crown me-1"></span>
            <span>Go Pro</span>
        </a>

        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="#!">Set status</a>
        <a class="dropdown-item" href="../../pages/user/profile.jsp">Profile &amp; account</a>
        <a class="dropdown-item" href="#!">Feedback</a>

        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="../../pages/user/settings.jsp">Settings</a>
        <a class="dropdown-item" href="../../pages/authentication/card/logout.jsp">Logout</a>
    </div>
</div>
</li>
</ul>
</nav>
<form id="qnaForm" method="post" action='<c:url value='/admin/qna/write'/>'>
    <button style="background: white" class="btn btn-falcon-default btn-sm" type="button">
        <a href="<c:url value='/admin/qna/list'/>">
            <svg class="svg-inline--fa fa-arrow-left fa-w-14" aria-hidden="true" focusable="false"
                 data-prefix="fas" data-icon="arrow-left" role="img"
                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg="">
                <path fill="currentColor"
                      d="M257.5 445.1l-22.2 22.2c-9.4 9.4-24.6 9.4-33.9 0L7 273c-9.4-9.4-9.4-24.6 0-33.9L201.4 44.7c9.4-9.4 24.6-9.4 33.9 0l22.2 22.2c9.5 9.5 9.3 25-.4 34.3L136.6 216H424c13.3 0 24 10.7 24 24v32c0 13.3-10.7 24-24 24H136.6l120.5 114.8c9.8 9.3 10 24.8.4 34.3z"></path>
            </svg>
        </a>
    </button>
    <h5 style="display: inline-block;" class="mb-0">Q&A 등록</h5><br>
    <div style="margin-top: 5px;" class="card-body p-0">
        <div class="border border-top-0 border-200">
            <input class="form-control border-1 rounded-1 outline-none px-x1"
                   name="title" id="title" aria-describedby="email-to"
                   placeholder="질문의 제목을 입력하세요" />
        </div>
        <div class="mb-3">
            <textarea class="form-control" id="exampleFormControlTextarea1"
                      name="content" cols="50" rows="20" placeholder="질문의 내용을 입력하세요" form="qnaForm"></textarea>
        </div>
    </div>
    <div class="card-footer border-top border-200 d-flex flex-between-center">
        <div class="d-flex align-items-center">
            <button class="btn btn-primary btn-sm px-5 me-2" type="submit">등록</button>
        </div>
        <div class="d-flex align-items-center">

        </div>
</form>
<%@ include file='../../inc/adminBottom.jsp'%>