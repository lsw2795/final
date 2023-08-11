<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<div class="card mb-3">
            <div class="card-body d-flex justify-content-between">
              <div><a class="btn btn-falcon-default btn-sm" href="../../app/email/inbox.jsp" data-bs-toggle="tooltip" data-bs-placement="top" title="Back to inbox"><span class="fas fa-arrow-left"></span></a><span class="mx-1 mx-sm-2 text-300">|</span>
                <button class="btn btn-falcon-default btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Archive"><span class="fas fa-archive"></span></button>
                <button class="btn btn-falcon-default btn-sm ms-1 ms-sm-2" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete"><span class="fas fa-trash-alt"></span></button>
                <button class="btn btn-falcon-default btn-sm ms-1 ms-sm-2" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Mark as unread"><span class="fas fa-envelope"></span></button>
                <button class="btn btn-falcon-default btn-sm ms-1 ms-sm-2" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Snooze"><span class="fas fa-clock"></span></button>
                <button class="btn btn-falcon-default btn-sm ms-1 ms-sm-2 d-none d-sm-inline-block" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Print"><span class="fas fa-print"></span></button>
              </div>
              <div class="d-flex">
                <div class="d-none d-md-block"><small>2 of 354</small>
                  <button class="btn btn-falcon-default btn-sm ms-2" type="button"><span class="fas fa-chevron-left"></span></button>
                  <button class="btn btn-falcon-default btn-sm ms-2" type="button"><span class="fas fa-chevron-right"></span></button>
                </div>
                <div class="dropdown font-sans-serif">
                  <button class="btn btn-falcon-default text-600 btn-sm dropdown-toggle dropdown-caret-none ms-2" type="button" id="email-settings" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false"><span class="fas fa-cog"></span></button>
                  <div class="dropdown-menu dropdown-menu-end border py-2" aria-labelledby="email-settings"><a class="dropdown-item" href="#!">Configure inbox</a>
                    <div class="dropdown-divider"></div><a class="dropdown-item" href="#!">Settings</a><a class="dropdown-item" href="#!">Themes</a>
                    <div class="dropdown-divider"></div><a class="dropdown-item" href="#!">Send feedback</a><a class="dropdown-item" href="#!">Help</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header">
              <div class="row">
                <div class="col-md d-flex">
                  <div class="avatar avatar-2xl">
                    <img class="rounded-circle" src="../../assets/img/team/1.jpg" alt="" />

                  </div>
                  <div class="flex-1 ms-2">
                    <h5 class="mb-0">Women work wondersâ¦ on your marketing skills</h5><a class="text-800 fs--1" href="#!"><span class="fw-semi-bold">Emma Watson</span><span class="ms-1 text-500">&lt;emma@watson.com&gt;</span></a>
                  </div>
                </div>
                <div class="col-md-auto ms-auto d-flex align-items-center ps-6 ps-md-3"><small>8:40 AM (9 hours ago)</small><span class="fas fa-star text-warning fs--1 ms-2"></span></div>
              </div>
            </div>
            <div class="card-body bg-light">
              <div class="row justify-content-center">
                <div class="col-lg-8 col-xxl-6">
                  <div class="card shadow-none mb-3"><img class="card-img-top" src="../../assets/img/icons/spot-illustrations/international-women-s-day-2.png" alt="" />
                    <div class="card-body">
                      <h3 class="fw-semi-bold">Happy International Womenâs Day!</h3>
                      <p>On International Womenâs Day, we at ThemeWagon want you to discover the skills you can learn from our amazing women digital marketing instructors.</p>
                      <p>That's not all, when you enroll in one of their courses, use promo code: <code>GirlPower20</code> and get <a class="fw-semi-bold" href="#!">20% off</a> as our Women's Day gift to you. This offer <a class="fw-semi-bold" href="#!">expires in 7 days</a> âso pick your courseâand enroll today!</p>
                      <div class="text-center">
                        <button class="btn btn-success btn-lg my-3" type="button">Browse Courses</button><small class="d-block">For any technical issues faced, please contact <a href="#!">Customer Support</a>.</small>
                      </div>
                    </div>
                  </div>
                  <div class="text-center">
                    <div class="icon-group justify-content-center"><a class="icon-item text-facebook" href="#!"><span class="fab fa-facebook-f"></span></a><a class="icon-item text-twitter" href="#!"><span class="fab fa-twitter"></span></a><a class="icon-item text-google-plus" href="#!"><span class="fab fa-google-plus-g"></span></a><a class="icon-item text-linkedin" href="#!"><span class="fab fa-linkedin-in"></span></a><a class="icon-item text-700" href="#!"><span class="fab fa-medium-m"></span></a></div><small>If you wish to unsubscribe from all future emails, please click <a href="#!">here</a>.</small>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-footer">
              <div class="row justify-content-between">
                <div class="col"><a class="btn btn-falcon-default btn-sm" href="../../app/email/compose.jsp"><span class="fas fa-reply" data-fa-transform="down-2"></span><span class="d-none d-sm-inline-block ms-1">Reply</span></a><a class="btn btn-falcon-default btn-sm ms-2" href="../../app/email/compose.jsp"><span class="fas fa-location-arrow" data-fa-transform="down-2"></span><span class="d-none d-sm-inline-block ms-1">Forward</span></a></div>
                <div class="col-auto d-flex align-items-center"><small>2 of 354</small>
                  <button class="btn btn-falcon-default btn-sm ms-2" type="button"><span class="fas fa-chevron-left"></span></button>
                  <button class="btn btn-falcon-default btn-sm ms-2" type="button"><span class="fas fa-chevron-right"></span></button>
                </div>
              </div>
            </div>
          </div>


<%@ include file="../inc/bottom.jsp"%>