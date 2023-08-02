<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/top.jsp" %>

                <div class="dropdown-menu dropdown-caret dropdown-caret dropdown-menu-end py-0" aria-labelledby="navbarDropdownUser">
                  <div class="bg-white dark__bg-1000 rounded-2 py-2">
                    <a class="dropdown-item fw-bold text-warning" href="#!"><span class="fas fa-crown me-1"></span><span>Go Pro</span></a>

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
          <form class="card">
            <div class="card-header bg-light">
              <h5 class="mb-0">Q&A 수정</h5>
            </div>
            <div class="card-body p-0">
              <div class="border border-top-0 border-200">
                <input class="form-control border-0 rounded-0 outline-none px-x1" id="email-to" type="email" aria-describedby="email-to" placeholder="제목" />
              </div>
              <div class="border border-y-0 border-200">
                <input class="form-control border-0 rounded-0 outline-none px-x1" id="email-subject" type="text" aria-describedby="email-subject" placeholder="내용" />
              </div>
              <div class="min-vh-50">
                <textarea class="tinymce d-none" data-tinymce="data-tinymce" name="content"></textarea>
              </div>
              <div class="bg-light px-x1 py-3">
                <div class="d-inline-flex flex-column">
                  <div class="border px-2 rounded-3 d-flex flex-between-center bg-white dark__bg-1000 my-1 fs--1"><span class="fs-1 far fa-image"></span><span class="ms-2">winter.jpg (873kb)</span><a class="text-300 p-1 ms-6" href="#!" data-bs-toggle="tooltip" data-bs-placement="right" title="Detach"><span class="fas fa-times"></span></a></div>
                  <div class="border px-2 rounded-3 d-flex flex-between-center bg-white dark__bg-1000 my-1 fs--1"><span class="fs-1 far fa-file-archive"></span><span class="ms-2">coffee.zip (342kb)</span><a class="text-300 p-1 ms-6" href="#!" data-bs-toggle="tooltip" data-bs-placement="right" title="Detach"><span class="fas fa-times"></span></a></div>
                </div>
              </div>
            </div>
            <div class="card-footer border-top border-200 d-flex flex-between-center">
              <div class="d-flex align-items-center">
                <button class="btn btn-primary btn-sm px-5 me-2" type="submit">수정</button>
                <input class="d-none" id="email-attachment" type="file" />
                <label class="me-2 btn btn-light btn-sm mb-0 cursor-pointer" for="email-attachment" data-bs-toggle="tooltip" data-bs-placement="top" title="Attach files"><span class="fas fa-paperclip fs-1" data-fa-transform="down-2"></span></label>
                <input class="d-none" id="email-image" type="file" accept="image/*" />
                <label class="btn btn-light btn-sm mb-0 cursor-pointer" for="email-image" data-bs-toggle="tooltip" data-bs-placement="top" title="Attach images"><span class="fas fa-image fs-1" data-fa-transform="down-2"></span></label>
              </div>
              <div class="d-flex align-items-center">
                <div class="dropdown font-sans-serif me-2 btn-reveal-trigger">
                  <button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal dropdown-caret-none" id="email-options" type="button" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-v" data-fa-transform="down-2"></span></button>
                  <div class="dropdown-menu dropdown-menu-end border py-2" aria-labelledby="email-options"><a class="dropdown-item" href="#!">Print</a><a class="dropdown-item" href="#!">Check spelling</a><a class="dropdown-item" href="#!">Plain text mode</a>
                    <div class="dropdown-divider"></div><a class="dropdown-item" href="#!">Archive</a>
                  </div>
                </div>
                <button class="btn btn-light btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete"><span class="fas fa-trash"></span></button>
              </div>
            </div>
          </form>
        
<%@ include file = "../inc/bottom.jsp" %>