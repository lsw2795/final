<!DOCTYPE html>
<html data-bs-theme="light" lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Falcon | Dashboard &amp; Web App Template</title>


    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/favicon.ico">
    <link rel="manifest" href="assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="assets/js/config.js"></script>
    <script src="vendors/simplebar/simplebar.min.js"></script>


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="vendors/prism/prism-okaidia.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
    <link href="vendors/simplebar/simplebar.min.css" rel="stylesheet">
    <link href="assets/css/theme-rtl.css" rel="stylesheet" id="style-rtl">
    <link href="assets/css/theme.css" rel="stylesheet" id="style-default">
    <link href="assets/css/user-rtl.css" rel="stylesheet" id="user-style-rtl">
    <link href="assets/css/user.css" rel="stylesheet" id="user-style-default">
    <script>
      var isRTL = JSON.parse(localStorage.getItem('isRTL'));
      if (isRTL) {
        var linkDefault = document.getElementById('style-default');
        var userLinkDefault = document.getElementById('user-style-default');
        linkDefault.setAttribute('disabled', true);
        userLinkDefault.setAttribute('disabled', true);
        document.querySelector('html').setAttribute('dir', 'rtl');
      } else {
        var linkRTL = document.getElementById('style-rtl');
        var userLinkRTL = document.getElementById('user-style-rtl');
        linkRTL.setAttribute('disabled', true);
        userLinkRTL.setAttribute('disabled', true);
      }
    </script>
  </head>


  <body>

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <div class="container" data-layout="container">
        <script>
          var isFluid = JSON.parse(localStorage.getItem('isFluid'));
          if (isFluid) {
            var container = document.querySelector('[data-layout]');
            container.classList.remove('container');
            container.classList.add('container-fluid');
          }
        </script>
        <nav class="navbar navbar-light navbar-vertical navbar-expand-xl">
          <script>
            var navbarStyle = localStorage.getItem("navbarStyle");
            if (navbarStyle && navbarStyle !== 'transparent') {
              document.querySelector('.navbar-vertical').classList.add(`navbar-${navbarStyle}`);
            }
          </script>
          <div class="d-flex align-items-center">
            <div class="toggle-icon-wrapper">

              <button class="btn navbar-toggler-humburger-icon navbar-vertical-toggle" data-bs-toggle="tooltip" data-bs-placement="left" title="Toggle Navigation"><span class="navbar-toggle-icon"><span class="toggle-line"></span></span></button>

            </div><a class="navbar-brand" href="index.jsp">
              <div class="d-flex align-items-center py-3"><img class="me-2" src="assets/img/icons/spot-illustrations/falcon.png" alt="" width="40" /><span class="font-sans-serif">falcon</span>
              </div>
            </a>
          </div>
          <div class="collapse navbar-collapse" id="navbarVerticalCollapse">
            <div class="navbar-vertical-content scrollbar">
              <ul class="navbar-nav flex-column mb-3" id="navbarVerticalNav">
                <li class="nav-item">
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#dashboard" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="dashboard">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-chart-pie"></span></span><span class="nav-link-text ps-1">Dashboard</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="dashboard">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Default</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="dashboard/analytics.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Analytics</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="dashboard/crm.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">CRM</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="dashboard/e-commerce.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">E commerce</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="dashboard/lms.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">LMS</span><span class="badge rounded-pill ms-2 badge-subtle-success">New</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="dashboard/project-management.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Management</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="dashboard/saas.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">SaaS</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="dashboard/support-desk.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Support desk</span><span class="badge rounded-pill ms-2 badge-subtle-success">New</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                </li>
                <li class="nav-item">
                  <!-- label-->
                  <div class="row navbar-vertical-label-wrapper mt-3 mb-2">
                    <div class="col-auto navbar-vertical-label">App
                    </div>
                    <div class="col ps-0">
                      <hr class="mb-0 navbar-vertical-divider" />
                    </div>
                  </div>
                  <!-- parent pages--><a class="nav-link" href="app/calendar.jsp" role="button">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-calendar-alt"></span></span><span class="nav-link-text ps-1">Calendar</span>
                    </div>
                  </a>
                  <!-- parent pages--><a class="nav-link" href="app/chat.jsp" role="button">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-comments"></span></span><span class="nav-link-text ps-1">Chat</span>
                    </div>
                  </a>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#email" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="email">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-envelope-open"></span></span><span class="nav-link-text ps-1">Email</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="email">
                    <li class="nav-item"><a class="nav-link" href="app/email/inbox.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Inbox</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/email/email-detail.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Email detail</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/email/compose.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Compose</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#events" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="events">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-calendar-day"></span></span><span class="nav-link-text ps-1">Events</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="events">
                    <li class="nav-item"><a class="nav-link" href="app/events/create-an-event.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Create an event</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/events/event-detail.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Event detail</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/events/event-list.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Event list</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#e-commerce" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="e-commerce">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-shopping-cart"></span></span><span class="nav-link-text ps-1">E commerce</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="e-commerce">
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#product" data-bs-toggle="collapse" aria-expanded="false" aria-controls="e-commerce">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Product</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="product">
                        <li class="nav-item"><a class="nav-link" href="app/e-commerce/product/product-list.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Product list</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="app/e-commerce/product/product-grid.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Product grid</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="app/e-commerce/product/product-details.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Product details</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="app/e-commerce/product/add-product.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Add product</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                      </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#orders" data-bs-toggle="collapse" aria-expanded="false" aria-controls="e-commerce">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Orders</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="orders">
                        <li class="nav-item"><a class="nav-link" href="app/e-commerce/orders/order-list.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Order list</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="app/e-commerce/orders/order-details.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Order details</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                      </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/e-commerce/customers.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Customers</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/e-commerce/customer-details.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Customer details</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/e-commerce/shopping-cart.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Shopping cart</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/e-commerce/checkout.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Checkout</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/e-commerce/billing.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Billing</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/e-commerce/invoice.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Invoice</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#e-learning" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="e-learning">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-graduation-cap"></span></span><span class="nav-link-text ps-1">E learning</span><span class="badge rounded-pill ms-2 badge-subtle-success">New</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="e-learning">
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#course" data-bs-toggle="collapse" aria-expanded="false" aria-controls="e-learning">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Course</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="course">
                        <li class="nav-item"><a class="nav-link" href="app/e-learning/course/course-list.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Course list</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="app/e-learning/course/course-grid.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Course grid</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="app/e-learning/course/course-details.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Course details</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="app/e-learning/course/create-a-course.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Create a course</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                      </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/e-learning/student-overview.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Student overview</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/e-learning/trainer-profile.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Trainer profile</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link" href="app/kanban.jsp" role="button">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fab fa-trello"></span></span><span class="nav-link-text ps-1">Kanban</span>
                    </div>
                  </a>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#social" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="social">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-share-alt"></span></span><span class="nav-link-text ps-1">Social</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="social">
                    <li class="nav-item"><a class="nav-link" href="app/social/feed.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Feed</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/social/activity-log.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Activity log</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/social/notifications.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Notifications</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/social/followers.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Followers</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#support-desk" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="support-desk">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-ticket-alt"></span></span><span class="nav-link-text ps-1">Support desk</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="support-desk">
                    <li class="nav-item"><a class="nav-link" href="app/support-desk/table-view.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Table view</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/support-desk/card-view.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Card view</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/support-desk/contacts.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Contacts</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/support-desk/contact-details.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Contact details</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/support-desk/tickets-preview.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Tickets preview</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/support-desk/quick-links.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Quick links</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="app/support-desk/reports.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Reports</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                </li>
                <li class="nav-item">
                  <!-- label-->
                  <div class="row navbar-vertical-label-wrapper mt-3 mb-2">
                    <div class="col-auto navbar-vertical-label">Pages
                    </div>
                    <div class="col ps-0">
                      <hr class="mb-0 navbar-vertical-divider" />
                    </div>
                  </div>
                  <!-- parent pages--><a class="nav-link" href="pages/starter.jsp" role="button">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-flag"></span></span><span class="nav-link-text ps-1">Starter</span>
                    </div>
                  </a>
                  <!-- parent pages--><a class="nav-link" href="pages/landing.jsp" role="button">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-globe"></span></span><span class="nav-link-text ps-1">Landing</span>
                    </div>
                  </a>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#authentication" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="authentication">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-lock"></span></span><span class="nav-link-text ps-1">Authentication</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="authentication">
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#simple" data-bs-toggle="collapse" aria-expanded="false" aria-controls="authentication">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Simple</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="simple">
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/simple/login.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Login</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/simple/logout.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Logout</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/simple/register.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Register</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/simple/forgot-password.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Forgot password</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/simple/confirm-mail.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Confirm mail</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/simple/reset-password.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Reset password</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/simple/lock-screen.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Lock screen</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                      </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#card" data-bs-toggle="collapse" aria-expanded="false" aria-controls="authentication">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Card</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="card">
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/card/login.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Login</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/card/logout.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Logout</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/card/register.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Register</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/card/forgot-password.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Forgot password</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/card/confirm-mail.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Confirm mail</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/card/reset-password.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Reset password</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/card/lock-screen.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Lock screen</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                      </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#split" data-bs-toggle="collapse" aria-expanded="false" aria-controls="authentication">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Split</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="split">
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/split/login.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Login</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/split/logout.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Logout</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/split/register.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Register</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/split/forgot-password.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Forgot password</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/split/confirm-mail.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Confirm mail</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/split/reset-password.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Reset password</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="pages/authentication/split/lock-screen.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Lock screen</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                      </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="pages/authentication/wizard.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Wizard</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#authentication-modal" data-bs-toggle="modal">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Modal</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#user" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="user">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-user"></span></span><span class="nav-link-text ps-1">User</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="user">
                    <li class="nav-item"><a class="nav-link" href="pages/user/profile.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Profile</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="pages/user/settings.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Settings</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#pricing" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="pricing">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-tags"></span></span><span class="nav-link-text ps-1">Pricing</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="pricing">
                    <li class="nav-item"><a class="nav-link" href="pages/pricing/pricing-default.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Pricing default</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="pages/pricing/pricing-alt.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Pricing alt</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#faq" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="faq">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-question-circle"></span></span><span class="nav-link-text ps-1">Faq</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="faq">
                    <li class="nav-item"><a class="nav-link" href="pages/faq/faq-basic.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Faq basic</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="pages/faq/faq-alt.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Faq alt</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="pages/faq/faq-accordion.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Faq accordion</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#errors" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="errors">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-exclamation-triangle"></span></span><span class="nav-link-text ps-1">Errors</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="errors">
                    <li class="nav-item"><a class="nav-link" href="pages/errors/404.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">404</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="pages/errors/500.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">500</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#miscellaneous" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="miscellaneous">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-thumbtack"></span></span><span class="nav-link-text ps-1">Miscellaneous</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="miscellaneous">
                    <li class="nav-item"><a class="nav-link" href="pages/miscellaneous/associations.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Associations</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="pages/miscellaneous/invite-people.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Invite people</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="pages/miscellaneous/privacy-policy.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Privacy policy</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#Layouts" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="Layouts">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="far fa-window-restore"></span></span><span class="nav-link-text ps-1">Layouts</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="Layouts">
                    <li class="nav-item"><a class="nav-link" href="demo/navbar-vertical.jsp" target="_blank">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Navbar vertical</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="demo/navbar-top.jsp" target="_blank">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Top nav</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="demo/navbar-double-top.jsp" target="_blank">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Double top</span><span class="badge rounded-pill ms-2 badge-subtle-success">New</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="demo/combo-nav.jsp" target="_blank">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Combo nav</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                </li>
                <li class="nav-item">
                  <!-- label-->
                  <div class="row navbar-vertical-label-wrapper mt-3 mb-2">
                    <div class="col-auto navbar-vertical-label">Modules
                    </div>
                    <div class="col ps-0">
                      <hr class="mb-0 navbar-vertical-divider" />
                    </div>
                  </div>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#forms" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="forms">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-file-alt"></span></span><span class="nav-link-text ps-1">Forms</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="forms">
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#basic" data-bs-toggle="collapse" aria-expanded="false" aria-controls="forms">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Basic</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="basic">
                        <li class="nav-item"><a class="nav-link" href="modules/forms/basic/form-control.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Form control</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/forms/basic/input-group.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Input group</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/forms/basic/select.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Select</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/forms/basic/checks.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Checks</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/forms/basic/range.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Range</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/forms/basic/layout.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Layout</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                      </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#advance" data-bs-toggle="collapse" aria-expanded="false" aria-controls="forms">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Advance</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="advance">
                        <li class="nav-item"><a class="nav-link" href="modules/forms/advance/advance-select.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Advance select</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/forms/advance/date-picker.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Date picker</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/forms/advance/editor.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Editor</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/forms/advance/emoji-button.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Emoji button</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/forms/advance/file-uploader.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">File uploader</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/forms/advance/input-mask.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Input mask</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/forms/advance/range-slider.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Range slider</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/forms/advance/rating.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Rating</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                      </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/forms/floating-labels.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Floating labels</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/forms/wizard.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Wizard</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/forms/validation.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Validation</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#tables" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="tables">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-table"></span></span><span class="nav-link-text ps-1">Tables</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="tables">
                    <li class="nav-item"><a class="nav-link" href="modules/tables/basic-tables.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Basic tables</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/tables/advance-tables.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Advance tables</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/tables/bulk-select.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Bulk select</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#charts" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="charts">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-chart-line"></span></span><span class="nav-link-text ps-1">Charts</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="charts">
                    <li class="nav-item"><a class="nav-link" href="modules/charts/chartjs.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Chartjs</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/charts/d3js.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">D3js</span><span class="badge rounded-pill ms-2 badge-subtle-success">New</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#eCharts" data-bs-toggle="collapse" aria-expanded="false" aria-controls="charts">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">ECharts</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="eCharts">
                        <li class="nav-item"><a class="nav-link" href="modules/charts/echarts/line-charts.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Line charts</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/charts/echarts/bar-charts.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Bar charts</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/charts/echarts/candlestick-charts.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Candlestick charts</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/charts/echarts/geo-map.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Geo map</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/charts/echarts/scatter-charts.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Scatter charts</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/charts/echarts/pie-charts.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Pie charts</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/charts/echarts/gauge-charts.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Gauge charts</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/charts/echarts/radar-charts.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Radar charts</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/charts/echarts/heatmap-charts.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Heatmap charts</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/charts/echarts/how-to-use.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">How to use</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                      </ul>
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#icons" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="icons">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-shapes"></span></span><span class="nav-link-text ps-1">Icons</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="icons">
                    <li class="nav-item"><a class="nav-link" href="modules/icons/font-awesome.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Font awesome</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/icons/bootstrap-icons.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Bootstrap icons</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/icons/feather.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Feather</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/icons/material-icons.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Material icons</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#maps" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="maps">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-map"></span></span><span class="nav-link-text ps-1">Maps</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="maps">
                    <li class="nav-item"><a class="nav-link" href="modules/maps/google-map.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Google map</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/maps/leaflet-map.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Leaflet map</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#components" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="components">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-puzzle-piece"></span></span><span class="nav-link-text ps-1">Components</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="components">
                    <li class="nav-item"><a class="nav-link" href="modules/components/accordion.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Accordion</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/alerts.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Alerts</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/anchor.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Anchor</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/animated-icons.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Animated icons</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/background.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Background</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/badges.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Badges</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/bottom-bar.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Bottom bar</span><span class="badge rounded-pill ms-2 badge-subtle-success">New</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/breadcrumbs.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Breadcrumbs</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/buttons.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Buttons</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/calendar.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Calendar</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/cards.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Cards</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#carousel" data-bs-toggle="collapse" aria-expanded="false" aria-controls="components">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Carousel</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="carousel">
                        <li class="nav-item"><a class="nav-link" href="modules/components/carousel/bootstrap.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Bootstrap</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/components/carousel/swiper.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Swiper</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                      </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/collapse.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Collapse</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/cookie-notice.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Cookie notice</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/countup.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Countup</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/draggable.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Draggable</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/dropdowns.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Dropdowns</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/jquery-components.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Jquery</span><span class="badge rounded-pill ms-2 badge-subtle-success">New</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/list-group.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">List group</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/modals.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Modals</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#navs-_and_-Tabs" data-bs-toggle="collapse" aria-expanded="false" aria-controls="components">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Navs &amp; Tabs</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="navs-_and_-Tabs">
                        <li class="nav-item"><a class="nav-link" href="modules/components/navs-and-tabs/navs.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Navs</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/components/navs-and-tabs/navbar.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Navbar</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/components/navs-and-tabs/vertical-navbar.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Navbar vertical</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/components/navs-and-tabs/top-navbar.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Top nav</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/components/navs-and-tabs/double-top-navbar.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Double top</span><span class="badge rounded-pill ms-2 badge-subtle-success">New</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/components/navs-and-tabs/combo-navbar.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Combo nav</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/components/navs-and-tabs/tabs.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Tabs</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                      </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/offcanvas.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Offcanvas</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#pictures" data-bs-toggle="collapse" aria-expanded="false" aria-controls="components">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Pictures</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="pictures">
                        <li class="nav-item"><a class="nav-link" href="modules/components/pictures/avatar.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Avatar</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/components/pictures/images.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Images</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/components/pictures/figures.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Figures</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/components/pictures/hoverbox.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Hoverbox</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/components/pictures/lightbox.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Lightbox</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                      </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/progress-bar.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Progress bar</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/placeholder.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Placeholder</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/pagination.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Pagination</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/popovers.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Popovers</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/scrollspy.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Scrollspy</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/search.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Search</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/spinners.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Spinners</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/timeline.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Timeline</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/toasts.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Toasts</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/tooltips.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Tooltips</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/treeview.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Treeview</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/components/typed-text.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Typed text</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#videos" data-bs-toggle="collapse" aria-expanded="false" aria-controls="components">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Videos</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="videos">
                        <li class="nav-item"><a class="nav-link" href="modules/components/videos/embed.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Embed</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="modules/components/videos/plyr.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Plyr</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                      </ul>
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#utilities" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="utilities">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-fire"></span></span><span class="nav-link-text ps-1">Utilities</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="utilities">
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/borders.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Borders</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/clearfix.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Clearfix</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/colors.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Colors</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/colored-links.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Colored links</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/display.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Display</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/flex.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Flex</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/float.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Float</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/grid.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Grid</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/overlayscrollbar.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Overlay scrollbar</span><span class="badge rounded-pill ms-2 badge-subtle-success">New</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/position.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Position</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/spacing.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Spacing</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/sizing.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Sizing</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/stretched-link.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Stretched link</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/text-truncation.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Text truncation</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/typography.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Typography</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/vertical-align.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Vertical align</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="modules/utilities/visibility.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Visibility</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link" href="widgets.jsp" role="button">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-poll"></span></span><span class="nav-link-text ps-1">Widgets</span>
                    </div>
                  </a>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#multi-level" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="multi-level">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-layer-group"></span></span><span class="nav-link-text ps-1">Multi level</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="multi-level">
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#level-two" data-bs-toggle="collapse" aria-expanded="false" aria-controls="multi-level">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Level two</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="level-two">
                        <li class="nav-item"><a class="nav-link" href="#!.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Item 1</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#!.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Item 2</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                      </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#level-three" data-bs-toggle="collapse" aria-expanded="false" aria-controls="multi-level">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Level three</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="level-three">
                        <li class="nav-item"><a class="nav-link" href="#!.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Item 3</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link dropdown-indicator" href="#item-4" data-bs-toggle="collapse" aria-expanded="false" aria-controls="level-three">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Item 4</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                          <ul class="nav collapse" id="item-4">
                            <li class="nav-item"><a class="nav-link" href="#!.jsp">
                                <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Item 5</span>
                                </div>
                              </a>
                              <!-- more inner pages-->
                            </li>
                            <li class="nav-item"><a class="nav-link" href="#!.jsp">
                                <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Item 6</span>
                                </div>
                              </a>
                              <!-- more inner pages-->
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link dropdown-indicator" href="#level-four" data-bs-toggle="collapse" aria-expanded="false" aria-controls="multi-level">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Level four</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                      <ul class="nav collapse" id="level-four">
                        <li class="nav-item"><a class="nav-link" href="#!.jsp">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Item 6</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                        </li>
                        <li class="nav-item"><a class="nav-link dropdown-indicator" href="#item-7" data-bs-toggle="collapse" aria-expanded="false" aria-controls="level-four">
                            <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Item 7</span>
                            </div>
                          </a>
                          <!-- more inner pages-->
                          <ul class="nav collapse" id="item-7">
                            <li class="nav-item"><a class="nav-link" href="#!.jsp">
                                <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Item 8</span>
                                </div>
                              </a>
                              <!-- more inner pages-->
                            </li>
                            <li class="nav-item"><a class="nav-link dropdown-indicator" href="#item-9" data-bs-toggle="collapse" aria-expanded="false" aria-controls="item-7">
                                <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Item 9</span>
                                </div>
                              </a>
                              <!-- more inner pages-->
                              <ul class="nav collapse" id="item-9">
                                <li class="nav-item"><a class="nav-link" href="#!.jsp">
                                    <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Item 10</span>
                                    </div>
                                  </a>
                                  <!-- more inner pages-->
                                </li>
                                <li class="nav-item"><a class="nav-link" href="#!.jsp">
                                    <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Item 11</span>
                                    </div>
                                  </a>
                                  <!-- more inner pages-->
                                </li>
                              </ul>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </li>
                <li class="nav-item">
                  <!-- label-->
                  <div class="row navbar-vertical-label-wrapper mt-3 mb-2">
                    <div class="col-auto navbar-vertical-label">Documentation
                    </div>
                    <div class="col ps-0">
                      <hr class="mb-0 navbar-vertical-divider" />
                    </div>
                  </div>
                  <!-- parent pages--><a class="nav-link" href="documentation/getting-started.jsp" role="button">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-rocket"></span></span><span class="nav-link-text ps-1">Getting started</span>
                    </div>
                  </a>
                  <!-- parent pages--><a class="nav-link dropdown-indicator" href="#customization" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="customization">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-wrench"></span></span><span class="nav-link-text ps-1">Customization</span>
                    </div>
                  </a>
                  <ul class="nav collapse" id="customization">
                    <li class="nav-item"><a class="nav-link" href="documentation/customization/configuration.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Configuration</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="documentation/customization/styling.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Styling</span><span class="badge rounded-pill ms-2 badge-subtle-success">Updated</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="documentation/customization/dark-mode.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Dark mode</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                    <li class="nav-item"><a class="nav-link" href="documentation/customization/plugin.jsp">
                        <div class="d-flex align-items-center"><span class="nav-link-text ps-1">Plugin</span>
                        </div>
                      </a>
                      <!-- more inner pages-->
                    </li>
                  </ul>
                  <!-- parent pages--><a class="nav-link" href="documentation/faq.jsp" role="button">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-question-circle"></span></span><span class="nav-link-text ps-1">Faq</span>
                    </div>
                  </a>
                  <!-- parent pages--><a class="nav-link" href="documentation/gulp.jsp" role="button">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fab fa-gulp"></span></span><span class="nav-link-text ps-1">Gulp</span>
                    </div>
                  </a>
                  <!-- parent pages--><a class="nav-link" href="documentation/design-file.jsp" role="button">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-palette"></span></span><span class="nav-link-text ps-1">Design file</span>
                    </div>
                  </a>
                  <!-- parent pages--><a class="nav-link active" href="changelog.jsp" role="button">
                    <div class="d-flex align-items-center"><span class="nav-link-icon"><span class="fas fa-code-branch"></span></span><span class="nav-link-text ps-1">Changelog</span>
                    </div>
                  </a>
                </li>
              </ul>
              <div class="settings mb-3">
                <div class="card shadow-none">
                  <div class="card-body alert mb-0" role="alert">
                    <div class="btn-close-falcon-container">
                      <button class="btn btn-link btn-close-falcon p-0" aria-label="Close" data-bs-dismiss="alert"></button>
                    </div>
                    <div class="text-center"><img src="assets/img/icons/spot-illustrations/navbar-vertical.png" alt="" width="80" />
                      <p class="fs--2 mt-2">Loving what you see? <br />Get your copy of <a href="#!">Falcon</a></p>
                      <div class="d-grid"><a class="btn btn-sm btn-purchase" href="https://themes.getbootstrap.com/product/falcon-admin-dashboard-webapp-template/" target="_blank">Purchase</a></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </nav>
        <div class="content">
          <nav class="navbar navbar-light navbar-glass navbar-top navbar-expand">

            <button class="btn navbar-toggler-humburger-icon navbar-toggler me-1 me-sm-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarVerticalCollapse" aria-controls="navbarVerticalCollapse" aria-expanded="false" aria-label="Toggle Navigation"><span class="navbar-toggle-icon"><span class="toggle-line"></span></span></button>
            <a class="navbar-brand me-1 me-sm-3" href="index.jsp">
              <div class="d-flex align-items-center"><img class="me-2" src="assets/img/icons/spot-illustrations/falcon.png" alt="" width="40" /><span class="font-sans-serif">falcon</span>
              </div>
            </a>
            <ul class="navbar-nav align-items-center d-none d-lg-block">
              <li class="nav-item">
                <div class="search-box" data-list='{"valueNames":["title"]}'>
                  <form class="position-relative" data-bs-toggle="search" data-bs-display="static">
                    <input class="form-control search-input fuzzy-search" type="search" placeholder="Search..." aria-label="Search" />
                    <span class="fas fa-search search-box-icon"></span>

                  </form>
                  <div class="btn-close-falcon-container position-absolute end-0 top-50 translate-middle shadow-none" data-bs-dismiss="search">
                    <button class="btn btn-link btn-close-falcon p-0" aria-label="Close"></button>
                  </div>
                  <div class="dropdown-menu border font-base start-0 mt-2 py-0 overflow-hidden w-100">
                    <div class="scrollbar list py-3" style="max-height: 24rem;">
                      <h6 class="dropdown-header fw-medium text-uppercase px-x1 fs--2 pt-0 pb-2">Recently Browsed</h6><a class="dropdown-item fs--1 px-x1 py-1 hover-primary" href="app/events/event-detail.jsp">
                        <div class="d-flex align-items-center">
                          <span class="fas fa-circle me-2 text-300 fs--2"></span>

                          <div class="fw-normal title">Pages <span class="fas fa-chevron-right mx-1 text-500 fs--2" data-fa-transform="shrink-2"></span> Events</div>
                        </div>
                      </a>
                      <a class="dropdown-item fs--1 px-x1 py-1 hover-primary" href="app/e-commerce/customers.jsp">
                        <div class="d-flex align-items-center">
                          <span class="fas fa-circle me-2 text-300 fs--2"></span>

                          <div class="fw-normal title">E-commerce <span class="fas fa-chevron-right mx-1 text-500 fs--2" data-fa-transform="shrink-2"></span> Customers</div>
                        </div>
                      </a>

                      <hr class="text-200 dark__text-900" />
                      <h6 class="dropdown-header fw-medium text-uppercase px-x1 fs--2 pt-0 pb-2">Suggested Filter</h6><a class="dropdown-item px-x1 py-1 fs-0" href="app/e-commerce/customers.jsp">
                        <div class="d-flex align-items-center"><span class="badge fw-medium text-decoration-none me-2 badge-subtle-warning">customers:</span>
                          <div class="flex-1 fs--1 title">All customers list</div>
                        </div>
                      </a>
                      <a class="dropdown-item px-x1 py-1 fs-0" href="app/events/event-detail.jsp">
                        <div class="d-flex align-items-center"><span class="badge fw-medium text-decoration-none me-2 badge-subtle-success">events:</span>
                          <div class="flex-1 fs--1 title">Latest events in current month</div>
                        </div>
                      </a>
                      <a class="dropdown-item px-x1 py-1 fs-0" href="app/e-commerce/product/product-grid.jsp">
                        <div class="d-flex align-items-center"><span class="badge fw-medium text-decoration-none me-2 badge-subtle-info">products:</span>
                          <div class="flex-1 fs--1 title">Most popular products</div>
                        </div>
                      </a>

                      <hr class="text-200 dark__text-900" />
                      <h6 class="dropdown-header fw-medium text-uppercase px-x1 fs--2 pt-0 pb-2">Files</h6><a class="dropdown-item px-x1 py-2" href="#!">
                        <div class="d-flex align-items-center">
                          <div class="file-thumbnail me-2"><img class="border h-100 w-100 object-fit-cover rounded-3" src="assets/img/products/3-thumb.png" alt="" /></div>
                          <div class="flex-1">
                            <h6 class="mb-0 title">iPhone</h6>
                            <p class="fs--2 mb-0 d-flex"><span class="fw-semi-bold">Antony</span><span class="fw-medium text-600 ms-2">27 Sep at 10:30 AM</span></p>
                          </div>
                        </div>
                      </a>
                      <a class="dropdown-item px-x1 py-2" href="#!">
                        <div class="d-flex align-items-center">
                          <div class="file-thumbnail me-2"><img class="img-fluid" src="assets/img/icons/zip.png" alt="" /></div>
                          <div class="flex-1">
                            <h6 class="mb-0 title">Falcon v1.8.2</h6>
                            <p class="fs--2 mb-0 d-flex"><span class="fw-semi-bold">John</span><span class="fw-medium text-600 ms-2">30 Sep at 12:30 PM</span></p>
                          </div>
                        </div>
                      </a>

                      <hr class="text-200 dark__text-900" />
                      <h6 class="dropdown-header fw-medium text-uppercase px-x1 fs--2 pt-0 pb-2">Members</h6><a class="dropdown-item px-x1 py-2" href="pages/user/profile.jsp">
                        <div class="d-flex align-items-center">
                          <div class="avatar avatar-l status-online me-2">
                            <img class="rounded-circle" src="assets/img/team/1.jpg" alt="" />

                          </div>
                          <div class="flex-1">
                            <h6 class="mb-0 title">Anna Karinina</h6>
                            <p class="fs--2 mb-0 d-flex">Technext Limited</p>
                          </div>
                        </div>
                      </a>
                      <a class="dropdown-item px-x1 py-2" href="pages/user/profile.jsp">
                        <div class="d-flex align-items-center">
                          <div class="avatar avatar-l me-2">
                            <img class="rounded-circle" src="assets/img/team/2.jpg" alt="" />

                          </div>
                          <div class="flex-1">
                            <h6 class="mb-0 title">Antony Hopkins</h6>
                            <p class="fs--2 mb-0 d-flex">Brain Trust</p>
                          </div>
                        </div>
                      </a>
                      <a class="dropdown-item px-x1 py-2" href="pages/user/profile.jsp">
                        <div class="d-flex align-items-center">
                          <div class="avatar avatar-l me-2">
                            <img class="rounded-circle" src="assets/img/team/3.jpg" alt="" />

                          </div>
                          <div class="flex-1">
                            <h6 class="mb-0 title">Emma Watson</h6>
                            <p class="fs--2 mb-0 d-flex">Google</p>
                          </div>
                        </div>
                      </a>

                    </div>
                    <div class="text-center mt-n3">
                      <p class="fallback fw-bold fs-1 d-none">No Result Found.</p>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
            <ul class="navbar-nav navbar-nav-icons ms-auto flex-row align-items-center">
              <li class="nav-item px-2">
                <div class="theme-control-toggle fa-icon-wait">
                  <input class="form-check-input ms-0 theme-control-toggle-input" id="themeControlToggle" type="checkbox" data-theme-control="theme" value="dark" />
                  <label class="mb-0 theme-control-toggle-label theme-control-toggle-light" for="themeControlToggle" data-bs-toggle="tooltip" data-bs-placement="left" title="Switch to light theme"><span class="fas fa-sun fs-0"></span></label>
                  <label class="mb-0 theme-control-toggle-label theme-control-toggle-dark" for="themeControlToggle" data-bs-toggle="tooltip" data-bs-placement="left" title="Switch to dark theme"><span class="fas fa-moon fs-0"></span></label>
                </div>
              </li>
              <li class="nav-item d-none d-sm-block">
                <a class="nav-link px-0 notification-indicator notification-indicator-warning notification-indicator-fill fa-icon-wait" href="app/e-commerce/shopping-cart.jsp"><span class="fas fa-shopping-cart" data-fa-transform="shrink-7" style="font-size: 33px;"></span><span class="notification-indicator-number">1</span></a>

              </li>
              <li class="nav-item dropdown">
                <a class="nav-link notification-indicator notification-indicator-primary px-0 fa-icon-wait" id="navbarDropdownNotification" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-hide-on-body-scroll="data-hide-on-body-scroll"><span class="fas fa-bell" data-fa-transform="shrink-6" style="font-size: 33px;"></span></a>
                <div class="dropdown-menu dropdown-caret dropdown-caret dropdown-menu-end dropdown-menu-card dropdown-menu-notification dropdown-caret-bg" aria-labelledby="navbarDropdownNotification">
                  <div class="card card-notification shadow-none">
                    <div class="card-header">
                      <div class="row justify-content-between align-items-center">
                        <div class="col-auto">
                          <h6 class="card-header-title mb-0">Notifications</h6>
                        </div>
                        <div class="col-auto ps-0 ps-sm-3"><a class="card-link fw-normal" href="#">Mark all as read</a></div>
                      </div>
                    </div>
                    <div class="scrollbar-overlay" style="max-height:19rem">
                      <div class="list-group list-group-flush fw-normal fs--1">
                        <div class="list-group-title border-bottom">NEW</div>
                        <div class="list-group-item">
                          <a class="notification notification-flush notification-unread" href="#!">
                            <div class="notification-avatar">
                              <div class="avatar avatar-2xl me-3">
                                <img class="rounded-circle" src="assets/img/team/1-thumb.png" alt="" />

                              </div>
                            </div>
                            <div class="notification-body">
                              <p class="mb-1"><strong>Emma Watson</strong> replied to your comment : "Hello world 😍"</p>
                              <span class="notification-time"><span class="me-2" role="img" aria-label="Emoji">💬</span>Just now</span>

                            </div>
                          </a>

                        </div>
                        <div class="list-group-item">
                          <a class="notification notification-flush notification-unread" href="#!">
                            <div class="notification-avatar">
                              <div class="avatar avatar-2xl me-3">
                                <div class="avatar-name rounded-circle"><span>AB</span></div>
                              </div>
                            </div>
                            <div class="notification-body">
                              <p class="mb-1"><strong>Albert Brooks</strong> reacted to <strong>Mia Khalifa's</strong> status</p>
                              <span class="notification-time"><span class="me-2 fab fa-gratipay text-danger"></span>9hr</span>

                            </div>
                          </a>

                        </div>
                        <div class="list-group-title border-bottom">EARLIER</div>
                        <div class="list-group-item">
                          <a class="notification notification-flush" href="#!">
                            <div class="notification-avatar">
                              <div class="avatar avatar-2xl me-3">
                                <img class="rounded-circle" src="assets/img/icons/weather-sm.jpg" alt="" />

                              </div>
                            </div>
                            <div class="notification-body">
                              <p class="mb-1">The forecast today shows a low of 20&#8451; in California. See today's weather.</p>
                              <span class="notification-time"><span class="me-2" role="img" aria-label="Emoji">🌤️</span>1d</span>

                            </div>
                          </a>

                        </div>
                        <div class="list-group-item">
                          <a class="border-bottom-0 notification-unread  notification notification-flush" href="#!">
                            <div class="notification-avatar">
                              <div class="avatar avatar-xl me-3">
                                <img class="rounded-circle" src="assets/img/logos/oxford.png" alt="" />

                              </div>
                            </div>
                            <div class="notification-body">
                              <p class="mb-1"><strong>University of Oxford</strong> created an event : "Causal Inference Hilary 2019"</p>
                              <span class="notification-time"><span class="me-2" role="img" aria-label="Emoji">✌️</span>1w</span>

                            </div>
                          </a>

                        </div>
                        <div class="list-group-item">
                          <a class="border-bottom-0 notification notification-flush" href="#!">
                            <div class="notification-avatar">
                              <div class="avatar avatar-xl me-3">
                                <img class="rounded-circle" src="assets/img/team/10.jpg" alt="" />

                              </div>
                            </div>
                            <div class="notification-body">
                              <p class="mb-1"><strong>James Cameron</strong> invited to join the group: United Nations International Children's Fund</p>
                              <span class="notification-time"><span class="me-2" role="img" aria-label="Emoji">🙋‍</span>2d</span>

                            </div>
                          </a>

                        </div>
                      </div>
                    </div>
                    <div class="card-footer text-center border-top"><a class="card-link d-block" href="app/social/notifications.jsp">View all</a></div>
                  </div>
                </div>

              </li>
              <li class="nav-item dropdown px-1">
                <a class="nav-link fa-icon-wait nine-dots p-1" id="navbarDropdownMenu" role="button" data-hide-on-body-scroll="data-hide-on-body-scroll" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="43" viewBox="0 0 16 16" fill="none">
                    <circle cx="2" cy="2" r="2" fill="#6C6E71"></circle>
                    <circle cx="2" cy="8" r="2" fill="#6C6E71"></circle>
                    <circle cx="2" cy="14" r="2" fill="#6C6E71"></circle>
                    <circle cx="8" cy="8" r="2" fill="#6C6E71"></circle>
                    <circle cx="8" cy="14" r="2" fill="#6C6E71"></circle>
                    <circle cx="14" cy="8" r="2" fill="#6C6E71"></circle>
                    <circle cx="14" cy="14" r="2" fill="#6C6E71"></circle>
                    <circle cx="8" cy="2" r="2" fill="#6C6E71"></circle>
                    <circle cx="14" cy="2" r="2" fill="#6C6E71"></circle>
                  </svg></a>
                <div class="dropdown-menu dropdown-caret dropdown-caret dropdown-menu-end dropdown-menu-card dropdown-caret-bg" aria-labelledby="navbarDropdownMenu">
                  <div class="card shadow-none">
                    <div class="scrollbar-overlay nine-dots-dropdown">
                      <div class="card-body px-3">
                        <div class="row text-center gx-0 gy-0">
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="pages/user/profile.jsp" target="_blank">
                              <div class="avatar avatar-2xl"> <img class="rounded-circle" src="assets/img/team/3.jpg" alt="" /></div>
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2">Account</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="https://themewagon.com/" target="_blank"><img class="rounded" src="assets/img/nav-icons/themewagon.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Themewagon</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="https://mailbluster.com/" target="_blank"><img class="rounded" src="assets/img/nav-icons/mailbluster.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Mailbluster</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/google.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Google</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/spotify.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Spotify</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/steam.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Steam</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/github-light.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Github</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/discord.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Discord</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/xbox.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">xbox</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/trello.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Kanban</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/hp.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Hp</p>
                            </a></div>
                          <div class="col-12">
                            <hr class="my-3 mx-n3 bg-200" />
                          </div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/linkedin.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Linkedin</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/twitter.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Twitter</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/facebook.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Facebook</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/instagram.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Instagram</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/pinterest.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Pinterest</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/slack.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Slack</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="assets/img/nav-icons/deviantart.png" alt="" width="40" height="40" />
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Deviantart</p>
                            </a></div>
                          <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="app/events/event-detail.jsp" target="_blank">
                              <div class="avatar avatar-2xl">
                                <div class="avatar-name rounded-circle bg-primary-subtle text-primary"><span class="fs-2">E</span></div>
                              </div>
                              <p class="mb-0 fw-medium text-800 text-truncate fs--2">Events</p>
                            </a></div>
                          <div class="col-12"><a class="btn btn-outline-primary btn-sm mt-4" href="#!">Show more</a></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </li>
              <li class="nav-item dropdown"><a class="nav-link pe-0 ps-2" id="navbarDropdownUser" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <div class="avatar avatar-xl">
                    <img class="rounded-circle" src="assets/img/team/3-thumb.png" alt="" />

                  </div>
                </a>
                <div class="dropdown-menu dropdown-caret dropdown-caret dropdown-menu-end py-0" aria-labelledby="navbarDropdownUser">
                  <div class="bg-white dark__bg-1000 rounded-2 py-2">
                    <a class="dropdown-item fw-bold text-warning" href="#!"><span class="fas fa-crown me-1"></span><span>Go Pro</span></a>

                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#!">Set status</a>
                    <a class="dropdown-item" href="pages/user/profile.jsp">Profile &amp; account</a>
                    <a class="dropdown-item" href="#!">Feedback</a>

                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="pages/user/settings.jsp">Settings</a>
                    <a class="dropdown-item" href="pages/authentication/card/logout.jsp">Logout</a>
                  </div>
                </div>
              </li>
            </ul>
          </nav>
          <div class="card mb-3">
            <div class="bg-holder d-none d-lg-block bg-card" style="background-image:url(assets/img/icons/spot-illustrations/corner-4.png);">
            </div>
            <!--/.bg-holder-->

            <div class="card-body position-relative">
              <div class="row">
                <div class="col-lg-8">
                  <h3>Changelog</h3>
                </div>
              </div>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-body">
              <div class="alert alert-warning p-4 mb-0" role="alert">
                <div class="d-flex"><span class="fab fa-intentionally-kept fs-3"></span>
                  <div class="flex-1 ms-3">
                    <h4 class="alert-heading">Before you update!</h4>
                    <p class="mb-0">Backup your files and read the changelog before updating Falcon on your project. If you come across with any problems with Falcon template during the update, feel free to contact us at <a href="mailto:support@themewagon.com">support@themewagon.com</a>.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.17.0</code> - Orange-breasted falcon</h5>
              <p class="mb-0">10 May, 2023</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Page: <code>e-commerce/product/add-product.jsp</code></li>
                <li>JS: <code>src/js/advance-ajax-table.js </code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Bootstrap to <code>5.3.0-alpha3</code></li>
                <li>
                  DOC: Ajax table example in <code>public/modules/tables/advance-tables.jsp</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Minor bugs.</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.16.0</code> - Red-footed falcon</h5>
              <p class="mb-0">23 Feb, 2023</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Plugin: <code>inputmask</code></li>
                <li>Plugin: <code>noUiSlider</code></li>
                <li>Doc: <code>public/modules/forms/advance/input-mask.jsp</code></li>
                <li>Doc: <code>public/modules/forms/advance/range-slider.jsp</code></li>
                <li>CSS variables for Navbar vertical variants</li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Plugin: <code>@joeattardi/emoji-button </code>is replaced by <code>picmo</code></li>
                <li>Doc: <code>public/modules/forms/advance/emoji-button.jsp</code></li>
                <li>Doc: <code>public/modules/components/navs-and-tabs/vertical-navbar.jsp</code></li>
                <li>SCSS: <code>src/scss/theme/_variables-dark.scss</code></li>
                <li>SCSS: <code>src/scss/theme/_variables.scss</code></li>
                <li>SCSS: <code>src/scss/theme/root/_light.scss</code></li>
                <li>SCSS: <code>src/scss/theme/root/_dark.scss</code></li>
                <li>SCSS: <code>src/scss/theme/root/_dark.scss</code></li>
                <li>SCSS: <code>src/scss/theme/_navbar-vertical.scss</code></li>
                <li>SCSS: <code>src/scss/theme/mixins/_navbar-vertical.scss</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Minor bugs.</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.15.0</code> - Prairie falcon</h5>
              <p class="mb-0">06 Feb, 2023</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>SCSS: <code>src/scss/theme/_variables-dark.scss</code></li>
                <li>Utilities:
                  <ul>
                    <li>Text emphasis colors: <code>text-{color}-emphasis</code></li>
                    <li>Subtle border colors: <code>border-{color}-subtle</code></li>
                  </ul>
                </li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Bootstrap to <code>5.3.0-alpha1</code></li>
                <li>Progress bars <a href="https://prium.github.io/falcon/v3.15.0/modules/components/progress-bar.jsp">see documentation</a></li>
                <li>Dark Mode Toggle <a href="https://prium.github.io/falcon/v3.15.0/documentation/customization/dark-mode.jsp">see documentation</a></li>
                <li>Styling <a href="https://prium.github.io/falcon/v3.15.0/documentation/customization/styling.jsp">see documentation</a></li>
                <li>JS: <code>src/js/config.js </code></li>
                <li>JS: <code>src/js/theme-control.js </code></li>
                <li>Utility classes:
                  <ul>
                    <li> <code>bg-soft-{color} </code>is now <code>bg-{color}-subtle</code></li>
                    <li><code>z-index-* </code>is now <code>z-*</code></li>
                    <li><code>border-start-{sm|md|lg|xl|2xl}-{values}</code></li>
                    <li><code>border-end-{sm|md|lg|xl|2xl}-{values}</code></li>
                    <li><code>border-top-{sm|md|lg|xl|2xl}-{values}</code></li>
                    <li><code>border-bottom-{sm|md|lg|xl|2xl}-{values}</code></li>
                  </ul>
                </li>
                <li>Removed:
                  <ul>
                    <li>SCSS: <code>src/scss/theme/_form-wizard.scss</code></li>
                    <li>SCSS: <code>src/scss/theme/_form.scss</code></li>
                    <li>SCSS: <code>src/scss/theme/_double-top-nav-layout.scss</code></li>
                    <li>SCSS: <code>src/scss/theme/_cursor.scss</code></li>
                    <li>SCSS: <code>src/scss/theme/_alert.scss</code></li>
                    <li>SCSS: <code>src/scss/theme/mixins/_alert.scss</code></li>
                    <li>
                      Utilities: responsive <code>border-color</code></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.14.0</code> - Black falcon</h5>
              <p class="mb-0">17 Nov, 2022</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Page: <code>public/dashboard/support-desk.jsp</code></li>
                <li>Page: <code>public/app/support-desk/table-view.jsp</code></li>
                <li>Page: <code>public/app/support-desk/card-view.jsp</code></li>
                <li>Page: <code>public/app/support-desk/contacts.jsp</code></li>
                <li>Page: <code>public/app/support-desk/contact-details.jsp</code></li>
                <li>Page: <code>public/app/support-desk/tickets-preview.jsp</code></li>
                <li>Page: <code>public/app/support-desk/quick-links.jsp</code></li>
                <li>Page: <code>public/app/support-desk/reports.jsp</code></li>
                <li>SCSS: <code>src/scss/theme/_progress.scss</code></li>
                <li>SCSS: <code>src/scss/theme/_summarised-tab.scss</code></li>
                <li>SCSS: <code>src/scss/theme/_support-desk.scss</code></li>
                <li>JS: <code>src/js/charts/echarts/unresolved-tickets.js</code></li>
                <li>JS: <code>src/js/charts/echarts/number-of-tickets.js</code></li>
                <li>JS: <code>src/js/charts/echarts/customer-satisfaction.js</code></li>
                <li>JS: <code>src/js/charts/echarts/distribution-of-performance.js</code></li>
                <li>JS: <code>src/js/charts/echarts/satisfaction-survey.js</code></li>
                <li>JS: <code>src/js/charts/echarts/top-customer.js</code></li>
                <li>JS: <code>src/js/charts/echarts/received-tickets.js</code></li>
                <li>JS: <code>src/js/charts/echarts/ticket-volume.js</code></li>
                <li>JS: <code>src/js/hide-on-collapse.js</code></li>
                <li>JS: <code>src/js/unresolved-tickets-tab.js</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Padding updated p-card to p-x1</li>
                <li>SCSS: <code>src/scss/theme/_card.scss</code></li>
                <li>SCSS: <code>src/scss/theme/root/_light.scss</code></li>
                <li>SCSS: <code>src/scss/theme/root/_dark.scss</code></li>
                <li>SCSS: <code>src/scss/theme/root/_variables.scss</code></li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"> <code class="fw-bold fs-1">v3.13.0</code> - Eleonora's falcon</h5>
              <p class="mb-0">16 Oct, 2022</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Layout: <strong>Navbar Double Top</strong></li>
                <li>jQuery support components</li>
                <li>Page: <code>public/modules/components/jquery-components.jsp</code></li>
                <li>Plugin: <code>datatables.net</code></li>
                <li>Plugin: <code>select2</code></li>
                <li>SCSS: <code>src/scss/theme/_double-top-nav-layout.scss</code></li>
                <li>JS: <code>src/js/datatables.js</code></li>
                <li>JS: <code>src/js/select2.js</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Bootstrap to <code>5.2.2</code></li>
                <li>JS: <code>src/js/theme-control.js</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Minor bugs.</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.12.0</code> - Gyrfalcon</h5>
              <p class="mb-0">20 Sep, 2022</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Bottom bar component</li>
                <li>Page:<code>public/dashboard/lms.jsp</code></li>
                <li>Page:<code>public/app/e-learning/student-overview.jsp</code></li>
                <li>Page:<code>public/app/e-learning/trainer-profile.jsp</code></li>
                <li>Page:<code>public/app/e-learning/course/course-list.jsp</code></li>
                <li>Page:<code>public/app/e-learning/course/course-grid.jsp</code></li>
                <li>Page:<code>public/app/e-learning/course/course-details.jsp</code></li>
                <li>Page:<code>public/app/e-learning/course/create-a-course.jsp</code></li>
                <li>Plugin:<code>simplebar.js</code></li>
                <li>Plugin:<code>D3.js</code></li>
                <li>SCSS:<code>src/scss/theme/_bottom-bar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_collapse.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_offcanvas.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_focus.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_e-learning.scss</code></li>
                <li>JS:<code>src/js/bottom-bar.js</code></li>
                <li>JS:<code>src/js/charts/d3/*.js</code></li>
                <li>JS:<code>src/js/charts/chartjs/chart-half-doughnut.js</code></li>
                <li>JS:<code>src/js/charts/echarts/average-enrollment-rate.js</code></li>
                <li>JS:<code>src/js/charts/echarts/assignment-scores.js</code></li>
                <li>JS:<code>src/js/charts/echarts/browsed-courses.js</code></li>
                <li>JS:<code>src/js/charts/echarts/course-enrollments.js</code></li>
                <li>JS:<code>src/js/charts/echarts/course-status.js</code></li>
                <li>JS:<code>src/js/charts/echarts/marketing-expenses.js</code></li>
                <li>JS:<code>src/js/charts/echarts/user-by-location-lms.js</code></li>
                <li>JS:<code>src/js/charts/echarts/weekly-goals-lms.js</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Bootstrap to<code>5.2.1</code></li>
                <li>Plugin:<code>overlayscrollbars.js</code>replaced with<code>simplebar.js</code></li>
                <li>SCSS:<code>src/scss/theme/root/_light.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_dark.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_variables.scss</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>TinyMCE validation.</li>
                <li>Auto scrolling bug on top searchbar input.</li>
                <li>Scroll to target ID.</li>
                <li>Minor bugs.</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.11.0</code> - Amur falcon</h5>
              <p class="mb-0">27 July, 2022</p>
            </div>
            <div class="card-body bg-light">
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Bootstrap to<code>5.2.0</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_full-calendar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_reboot.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_animations.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_leaflet.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_light.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_dark.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_variables.scss</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Emoji border color.</li>
                <li>Minor bugs.</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.10.0</code> - Barbary falcon</h5>
              <p class="mb-0">01 July, 2022</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>SCSS:<code>src/scss/theme/_maps.scss</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li><code>Bootstrap to 5.2.0-beta1</code></li>
                <li>All scss files</li>
                <li>CSS variable for grays</li>
                <li>Doc:<a href="https://prium.github.io/falcon/v3.10.0/documentation/customization/styling.jsp">Styling</a></li>
                <li><code>bg-{color}</code>classes replaced with<code>text-{color}</code>in<code>hr</code>tags.</li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Border dashed style</li>
                <li>Advance select style in RTL</li>
                <li>Other minor bugs</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.9.0</code> - Grey kestrel</h5>
              <p class="mb-0">28 April, 2022</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Add bootstrap validation for Advance select and Date picker</li>
                <li>Add filter in advance table.</li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>DOC:<code>public/modules/forms/advance/advance-select.jsp</code></li>
                <li>DOC:<code>public/modules/forms/advance/date-picker.jsp</code></li>
                <li>DOC:<code>public/modules/tables/advance-tables.jsp</code></li>
                <li>JS:<code>src/js/list.js</code></li>
                <li>JS:<code>src/js/choices.js</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_full-calendar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_swiper.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_dark.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_navbar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_navbar-top.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_choices.scss</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Vertical navbar card style in dark mode</li>
                <li>Dropdown caret issue</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.8.0</code> - Peregrine falcon</h5>
              <p class="mb-0">07 March, 2022</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Reset button on setting panel</li>
                <li>Page: <code>public/documentation/faq.jsp</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>JS:<code>src/js/config.js</code></li>
                <li>JS:<code>src/js/theme-control.js</code></li>
                <li>SCSS:<code>src/scss/theme/root/_dark.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_light.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_colors.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_variables.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_utilities.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_mixins.scss</code></li>
                <li>SCSS: Removed<code>src/scss/theme/mixins/_utilities.scss</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Color opacity issue</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.7.0</code> - Oriental hobby</h5>
              <p class="mb-0">19 January, 2022</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Timeline component</li>
                <li>SCSS:<code>src/scss/theme/_timeline.scss</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>SCSS:<code>src/scss/theme/_navbar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_variables.scss</code></li>
                <li>JSON:<code>package.json</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Nine dot dropdown issue</li>
              </ul>
            </div>
          </div>
          <!-- ------------------------------------------------------------------->
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.6.0</code> - Nankeen kestrel</h5>
              <p class="mb-0">14 December, 2021</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>9 dot menu on top navbar</li>
                <li>JS:<code>src/js/scroll.js</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Add<code>data-hide-on-body-scroll</code>attribute to the notification dropdown link</li>
                <li>JS:<code>src/js/theme.js</code></li>
                <li>Page:<code>public/widgets.jsp</code></li>
                <li>SCSS:<code>src/scss/theme/_navbar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_navbar-vertical.scss</code></li>
                <li>JSON:<code>package.json</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Page jump issue in ipad</li>
              </ul>
            </div>
          </div>
          <!-- ------------------------------------------------------------------->
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.5.1</code> - Lesser falcon</h5>
              <p class="mb-0">29 November, 2021</p>
            </div>
            <div class="card-body bg-light">
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>JS:<code>src/js/fullcalendar.js</code></li>
                <li>JS:<code>src/js/charts/echarts/examples/step-line-chart.js</code></li>
                <li>JS:<code>src/js/charts/echarts/examples/gradient-bar-chart.js</code></li>
                <li>DOC:<code>geo-map.jsp</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_full-calendar.scss</code></li>
                <li>JSON:<code>package.json</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Running project table</li>
                <li>Dropdown issue</li>
                <li>Other minor bugs</li>
              </ul>
            </div>
          </div>
          <!-- ------------------------------------------------------------------->
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.5.0</code> - Bateleur falcon</h5>
              <p class="mb-0">02 November, 2021</p>
            </div>
            <div class="card-body bg-light">
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Bootstrap to<code>v5.1.3</code></li>
                <li>JS:<code>src/js/charts/echarts/sales-by-pos-location.js</code></li>
                <li>SCSS:<code>src/scss/theme/root/_dark.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_variables.scss</code></li>
                <li>JSON:<code>package.json</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Placeholder dark mode color</li>
                <li>Sales by pos location chart color</li>
                <li>Other minor bugs</li>
              </ul>
            </div>
          </div>
          <!-- ------------------------------------------------------------------->
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.4.0</code> - Laggar falcon</h5>
              <p class="mb-0">19 September, 2021</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>PAGE:<code>public/modules/components/treeview.jsp</code></li>
                <li>SCSS:<code>src/scss/theme/_treeview.scss</code></li>
                <li>JS:<code>src/js/treeview.js</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>JS:<code>src/js/theme.js</code></li>
                <li>JS:<code>src/js/dropzone.js</code></li>
                <li>JS:<code>src/js/charts/echarts/returning-customer-rate.js</code></li>
                <li>SCSS:<code>src/scss/theme/_theme.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_variables.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_dropzone.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_full-calendar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_dark.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_light.scss</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Returning Customer Rate chart legend issue</li>
                <li>Other minor bugs</li>
              </ul>
            </div>
          </div>
          <!-- ------------------------------------------------------------------->
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.3.0</code> - Lanner falcon</h5>
              <p class="mb-0">23 August, 2021</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>PAGE:<code>public/modules/components/placeholder.jsp</code></li>
                <li>PAGE:<code>public/modules/components/offcanvas.jsp</code></li>
                <li>JS:<code>src/js/charts/echarts/bandwidth-saved.js</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Bootstrap to<code>v5.1.0</code></li>
                <li>Plugin: Removed<code>progressbar.js</code></li>
                <li>Bandwidth Saved progressbar is converted to<code>echarts</code>from<code>progressbar.js</code></li>
                <li>Settings Panel is converted to<code>offcanvas</code>from<code>modal</code></li>
                <li>Removed<code>Side Panel</code>component</li>
                <li>Removed<code>Advance Progessbar</code>component</li>
                <li>JS: Removed<code>src/js/settings-panel.js</code></li>
                <li>JS: Removed<code>src/js/progressbar.js</code></li>
                <li>JS:<code>src/js/config.js</code></li>
                <li>JS:<code>src/js/theme.js</code></li>
                <li>JS:<code>src/js/utils.js</code></li>
                <li>SCSS: Removed<code>src/scss/theme/_modal.scss</code></li>
                <li>SCSS: Removed<code>src/scss/theme/plugins/_progressbar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_variables.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_light.scss</code></li>
                <li>SCSS:<code>src/scss/_bootstrap.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_echarts.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_chat.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_choices.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_avatar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_functions.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_popover.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_plugins.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_settings-panel.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_theme.scss</code></li>
                <li>SCSS:<code>src/scss/theme/mixins/_utilities.scss</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Search box dropdown menu hr color in dark mode.</li>
                <li>Search box close button color in dark mode.</li>
                <li>SCSS compiling deprecated warning.</li>
                <li>Other minor bugs</li>
              </ul>
            </div>
          </div>
          <!-- ------------------------------------------------------------------->
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.2.0</code> - Aplomado falcon</h5>
              <p class="mb-0">23 June, 2021</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Added multiple echarts example</li>
                <li>PAGE:<code>public/dashboard/crm.jsp</code></li>
                <li>JS:<code>public/assets/data/world.js</code></li>
                <li>JS:<code>public/assets/data/usa.js</code></li>
                <li>JS:<code>src/js/charts/echarts/closed-vs-goal.js</code></li>
                <li>JS:<code>src/js/charts/echarts/line-payment.js</code></li>
                <li>JS:<code>src/js/charts/echarts/real-time-users.js</code></li>
                <li>JS:<code>src/js/charts/echarts/lead-conversion.js</code></li>
                <li>JS:<code>src/js/charts/echarts/crm-revenue.js</code></li>
                <li>JS:<code>src/js/charts/echarts/deal-storage-funnel.js</code></li>
                <li>JS:<code>src/js/charts/echarts/location-by-session-crm.js</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Bootstrap to<code>v5.0.2</code></li>
                <li>Plugin:<code>echarts</code></li>
                <li>Plugin:<code>chart.js</code></li>
                <li>Line payment chart is converted from<code>chart.js</code>to<code>echarts</code></li>
                <li>Real time user chart is converted from<code>chart.js</code>to<code>echarts</code></li>
                <li>JS:<code>src/js/popover.js</code></li>
                <li>JS:<code>src/js/charts/echarts/traffic-channels.js</code></li>
                <li>JS:<code>src/js/tinymce.js</code></li>
                <li>JS:<code>src/js/charts/echarts/echarts-utils.js</code></li>
                <li>JS:<code>src/js/charts/echarts/session-by-country-map.js</code></li>
                <li>JS:<code>src/js/charts/echarts/total-order.js</code></li>
                <li>JS:<code>src/js/charts/echarts/weekly-sales.js</code></li>
                <li>JS:<code>src/js/charts/echarts/returning-customer-rate.js</code></li>
                <li>JS:<code>src/js/charts/echarts/gross-revenue.js</code></li>
                <li>JS:<code>src/js/charts/echarts/traffic-channels.js</code></li>
                <li>JS:<code>src/js/theme-control.js</code></li>
                <li>JS:<code>src/js/theme.js</code></li>
                <li>JS:<code>gulp/watch.gulp.js</code></li>
                <li>JS:<code>gulp/script.gulp.js</code></li>
                <li>SCSS:<code>src/scss/theme/mixins/_button.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_buttons.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_dropdown.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_variables.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_echarts.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_list.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_dark.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_light.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_flatpickr.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_dashboard.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_forms.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_navbar-top.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_notification.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_hover.scss</code></li>
                <li>SUSS:<code>src/scss/theme/plugins/_tinymce.scss</code></li>
                <li>JSON:<code>package.json</code></li>
                <li>JSON:<code>vendors.json</code></li>
                <li>JSON:<code>gulp/gulp.json</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Tinymce dark mode issue</li>
                <li>Table dropdown issue in ipad</li>
                <li>Disabled button color issue</li>
                <li>Other minor bugs</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.1.0</code> - Saker falcon</h5>
              <p class="mb-0">2 June, 2021</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>HTML:<code>public/modules/forms/floating-labels.jsp</code></li>
                <li>Added support for Apple M1 chip</li>
                <li>Add<code>@mr-hope/gulp-sass</code>package for compiling SCSS</li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Plugin:<code>@fortawesome/fontawesome-free</code></li>
                <li>Plugin:<code>@joeattardi/emoji-button</code></li>
                <li>Plugin:<code>@popperjs/core</code></li>
                <li>Plugin:<code>anchor-js</code></li>
                <li>Plugin:<code>dropzone</code></li>
                <li>Plugin:<code>fullcalendar</code></li>
                <li>Plugin:<code>glightbox</code></li>
                <li>Plugin:<code>leaflet.markercluster</code></li>
                <li>Plugin:<code>list.js</code></li>
                <li>Plugin:<code>lottie-web</code></li>
                <li>Plugin:<code>plyr</code></li>
                <li>Plugin:<code>swiper</code></li>
                <li>Plugin:<code>tinymce</code></li>
                <li>Plugin:<code>typed.js</code></li>
                <li>Remove<code>gulp-sass</code>package</li>
                <li>JS:<code>gulp/style.gulp.js</code></li>
                <li>JS:<code>src/js/calendar/template.js</code></li>
                <li>JS:<code>src/js/chat.js</code></li>
                <li>JS:<code>src/js/search.js</code></li>
                <li>JS:<code>src/js/list.js</code></li>
                <li>SCSS:<code>src/scss/theme/_navbar-top.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_calendar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_chat.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_notification.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_full-calendar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_icon.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_dark.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_light.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_forms.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_reboot.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_variables.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_dashboard.scss</code></li>
                <li>JSON:<code>vendors.json</code></li>
                <li>JSON:<code>package.json</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Search suggestion toggle issue in top navbar</li>
                <li>Notification dropdown height in Firefox</li>
                <li>Other minor bugs.</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0</code> - Prairie falcon</h5>
              <p class="mb-0">23 May, 2021</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>HTML:<code>public/dashboard/analytics.jsp</code></li>
                <li>HTML:<code>public/dashboard/e-commerce.jsp</code></li>
                <li>HTML:<code>public/dashboard/project-management.jsp</code></li>
                <li>HTML:<code>public/dashboard/saas.jsp</code></li>
                <li>JS:<code>src/js/charts/echarts/audience.js</code></li>
                <li>JS:<code>src/js/charts/echarts/active-users-report.js</code></li>
                <li>JS:<code>src/js/charts/echarts/basic-echarts.js</code></li>
                <li>JS:<code>src/js/charts/echarts/bounce-rate.js</code></li>
                <li>JS:<code>src/js/charts/echarts/candle-chart.js</code></li>
                <li>JS:<code>src/js/charts/echarts/gross-revenue.js</code></li>
                <li>JS:<code>src/js/charts/echarts/market-share-ecommerce.js</code></li>
                <li>JS:<code>src/js/charts/echarts/report-for-this-week.js</code></li>
                <li>JS:<code>src/js/charts/echarts/returning-customer-rate.js</code></li>
                <li>JS:<code>src/js/charts/echarts/sales-by-pos-location.js</code></li>
                <li>JS:<code>src/js/charts/echarts/session-by-country-map.js</code></li>
                <li>JS:<code>src/js/charts/echarts/session-by-country.js</code></li>
                <li>JS:<code>src/js/charts/echarts/session-by-browser.js</code></li>
                <li>JS:<code>src/js/charts/echarts/total-sales-ecommerce.js</code></li>
                <li>JS:<code>src/js/charts/echarts/traffic-channels.js</code></li>
                <li>JS:<code>src/js/charts/echarts/users-by-time.js</code></li>
                <li>JS:<code>src/js/calendar/management-calendar.js</code></li>
                <li>JS:<code>src/js/calendar/management-events.js</code></li>
                <li>JS:<code>gulp/link.gulp.js</code></li>
                <li>JS:<code>src/js/charts/chartjs/product-share-doughnut.js</code></li>
                <li>SCSS:<code>src/scss/theme/_audience-tab.scss</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>
                  Bootstrapto<code>v5.0.1</code></li>
                <li>JS:<code>src/js/theme.js</code></li>
                <li>JS:<code>src/js/utils.js</code></li>
                <li>JS:<code>src/js/navbar-darken-on-scroll.js</code></li>
                <li>JS:<code>src/js/fullcalendar.js</code></li>
                <li>JS:<code>src/js/navbar-top.js</code></li>
                <li>JS:<code>src/js/calendar/index.js</code></li>
                <li>JS:<code>src/js/calendar/template.js</code></li>
                <li>JS:<code>src/js/calendar/events.js</code></li>
                <li>JS:<code>src/js/charts/echarts/echarts.js</code></li>
                <li>JS:<code>src/js/charts/chartjs/chart-line-payment.js</code></li>
                <li>JS:<code>src/js/list.js</code></li>
                <li>JS:<code>src/js/search.js</code></li>
                <li>JS:<code>src/js/charts/echarts/total-sales.js</code></li>
                <li>JS:<code>gulp/product.gulp.js</code></li>
                <li>JS:<code>gulp/pug.gulp.js</code></li>
                <li>SCSS:<code>src/scss/theme/_theme.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_full-calendar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_echarts.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_mixed.scss</code></li>
                <li>SCSS:<code>src/scss/theme/helpers/_background.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_dark.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_light.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_avatar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_calendar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_forms.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_dashboard.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_card.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_variables.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_timeline.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_utilities.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_calendar.scss</code></li>
                <li>JSON:<code>vendors.json</code></li>
                <li>JSON:<code>gulp/gulp.json</code></li>
                <li>JSON:<code>package.json</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Other minor bugs</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-beta7</code> - Taita falcon</h5>
              <p class="mb-0">24 April, 2021</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>JS:<code>gulp/product.gulp.js</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>JS:<code>src/js/list.js</code></li>
                <li>JS:<code>src/js/rater.js</code></li>
                <li>JS:<code>src/js/tinymce.js</code></li>
                <li>JS:<code>src/js/googleMap.js</code></li>
                <li>JS:<code>src/js/navbar-darken-on-scroll.js</code></li>
                <li>JS:<code>src/js/wizard.js</code></li>
                <li>JS:<code>gulp/pug.gulp.js</code></li>
                <li>JS:<code>gulpfile.js</code></li>
                <li>JSON:<code>gulp/gulp.json</code></li>
                <li>JSON:<code>package.json</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_tinymce.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_landing.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_navbar-vertical.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_search-box.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_buttons.scss</code></li>
                <li>SCSS:<code>src/scss/theme/helpers/_background.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_flatpickr.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_full-calendar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_browser-support.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_kanban.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_notification.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_choices.scss</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Other minor bugs</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-beta6</code> - Merlin falcon</h5>
              <p class="mb-0">8 April, 2021</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>JS:<code>src/js/charts/chartjs/chart-bar.js</code></li>
                <li>JS:<code>src/js/charts/chartjs/chart-combo.js</code></li>
                <li>JS:<code>src/js/charts/chartjs/chart-doughnut.js</code></li>
                <li>JS:<code>src/js/charts/chartjs/chart-line-payment.js</code></li>
                <li>JS:<code>src/js/charts/chartjs/chart-pie.js</code></li>
                <li>JS:<code>src/js/charts/chartjs/chart-polar.js</code></li>
                <li>JS:<code>src/js/charts/chartjs/chart-radar.js</code></li>
                <li>JS:<code>src/js/charts/chartjs/chart-real-time-user.js</code></li>
                <li>JS:<code>src/js/charts/chartjs/chart-scatter.js</code></li>
                <li>JS:<code>src/js/charts/chartjs/chartjs-utils.js</code></li>
                <li>JS:<code>src/js/dropdown-menu.js</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>HTML:<code>public/modules/charts/chartjs.jsp</code></li>
                <li>HTML:<code>public/modules/tables/basic-tables.jsp</code></li>
                <li>HTML:<code>public/modules/forms/basic/layout.jsp</code></li>
                <li>HTML:<code>public/modules/forms/basic/form-control.jsp</code></li>
                <li>JS:<code>src/js/utils.js</code></li>
                <li>JS:<code>src/js/theme.js</code></li>
                <li>JS:<code>src/js/flatpickr.js</code></li>
                <li>JS:<code>gulp/pug.gulp.js</code></li>
                <li>SCSS:<code>src/scss/theme/_nav-tab.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_dark.scss</code></li>
                <li>SCSS:<code>src/scss/theme/root/_light.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_variables.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_card.scss</code></li>
                <li>SCSS:<code>src/scss/theme/helpers/_flex.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_navbar-top.scss</code></li>
                <li>JSON:<code>package.json</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Dropdown clipping on table</li>
                <li>Other minor bugs</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-beta5</code> - Sooty falcon</h5>
              <p class="mb-0">25 March, 2021</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Multiple icons set added with example</li>
                <li>Page:<code>public/plugins/Overlayscrollbars.jsp</code></li>
                <li>JS:<code>src/js/icons.js</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li><strong>Bootsrap</strong> version updated from<code>v5.0.0-beta2</code> to<code>v5.0.0-beta3</code></li>
                <li>File structure updated</li>
                <li>JS:<code>src/js/navbar-vertical.js</code></li>
                <li>JS:<code>src/js/toast.js</code></li>
                <li>JS:<code>src/js/list.js</code></li>
                <li>JS:<code>src/js/tooltip.js</code></li>
                <li>JS:<code>src/js/theme.js</code></li>
                <li>JS:<code>gulp/pug.gulp.js</code></li>
                <li>SCSS:<code>src/scss/theme/_settings-panel.scss</code></li>
                <li>SCSS:<code>src/scss/theme/plugins/_echarts.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_navbar-vertical.scss</code></li>
                <li>JSON:<code>gulp/gulp.json</code></li>
                <li>JSON:<code>package.json</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Other minor bugs</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-beta4</code> - Bat falcon</h5>
              <p class="mb-0">15 March, 2021</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Page:<code>public/plugins/Overlayscrollbars.jsp</code></li>
                <li>JS:<code>src/js/scrollbar.js</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Scrollbar plugin updated to OverlayScrollbars from Simplebar.</li>
                <li>SCSS:<code>src/scss/theme/_functions.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_scrollbar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_navbar-top.scss</code></li>
                <li>JS:<code>src/js/dropdown-on-hover.js</code></li>
                <li>JS:<code>src/js/theme.js</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Scrollbar on top navbar</li>
                <li>Other minor bugs</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-beta3</code> - Pied</h5>
              <p class="mb-0">9 March, 2021</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Page:<code>public/plugins/simplebar.jsp</code></li>
                <li>Page:<code>public/forms/form-wizard.jsp</code></li>
                <li>SCSS:<code>src/scss/theme/_form-wizard.scss</code></li>
                <li>JS:<code>src/js/simplebar.js</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>SCSS:<code>src/scss/theme/_functions.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_navbar-vertical.scss</code></li>
                <li>SCSS:<code>src/scss/theme/mixins/_navbar-vertical.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_scrollbar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_variables.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_theme.scss</code></li>
                <li>JS:<code>src/js/wizard.js</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Scrollbar style</li>
                <li>Icons jumping issue when navbar collapsed</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-beta2</code> - Greater Kestrels</h5>
              <p class="mb-0">23 February, 2021</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Page:<code>public/plugins/chartjs.jsp</code></li>
                <li>JS:<code>src/js/form-validation.js</code></li>
                <li>JS:<code>src/js/charts/chart-bar.js</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Feature: Reposition the settings panel toggler</li>
                <li>SCSS:<code>src/scss/theme/_settings-panel.scss</code></li>
                <li>Bootstrap: updated to<strong>bootstrap-beta2</strong>-<a href="https://getbootstrap.com/docs/5.0/migration/#v500-beta2">see migration</a></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Bootstrap form validation</li>
                <li>Flatpicker enable in mobile device</li>
                <li>Dropzone preview icon other file</li>
                <li>TinyMCE: text color issue in mobile device</li>
                <li>Some minor issues</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-beta1</code> - Red-necked</h5>
              <p class="mb-0">02 February, 2021</p>
            </div>
            <div class="card-body bg-light">
              <div class="alert alert-success" role="alert">
                <div class="d-flex"><span class="fas fa-exclamation-triangle fs-1"></span>
                  <div class="flex-1 ms-3">This is a massive update.</div>
                </div>
              </div>
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Feature: Redesign navbar-vertical, navbar-top</li>
                <li>Page:<code>public/documentation/configuration.jsp</code></li>
                <li>Page:<code>public/documentation/styling.jsp</code></li>
                <li>JS:<code>src/js/dropdown-on-hover.js</code></li>
                <li>Bootstrap: updated to bootstrap-beta1 -<a href="https://getbootstrap.com/docs/5.0/migration/#v500-beta1">see migration</a></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>SCSS:<code>src/scss/theme/_navbar-vertical.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_navbar-top.scss</code></li>
                <li>SCSS:<code>src/scss/mixins/_navbar-vertical.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_navbar.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_function.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_mixins.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_mixed.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_mixed.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_theme.scss</code></li>
                <li>SCSS:<code>src/scss/theme.scss</code></li>
                <li>SCSS:<code>src/scss/theme/_variables.scss</code></li>
                <li>SCSS: Remove underscore from<code>src/scss/_user.scss</code></li>
                <li>JS:<code>src/js/config.js</code></li>
                <li>Gulp:<code>gulp/gulp.json</code></li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-alpha11</code> - Banded kestrel</h5>
              <p class="mb-0">17 January, 2021</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Feature: Dark Mood<a href="documentation/customization/dark-mode.jsp"> (Documentation)</a></li>
                <li>Introduced CSS variables</li>
                <li>SCSS:<code>.dark__bg-{colors}</code>,<code>.dark__text-{colors}</code>,<code>.dark</code>,<code>.light</code></li>
                <li>JS:<code> src/js/theme-control.js</code></li>
                <li>HTML: Replace all the bootstrap-alpha2 classes with bootstrap-alpha3 classes -<a href="https://getbootstrap.com/docs/5.0/migration/#v500-alpha3">see migration</a></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>SCSS: Almost all scss file</li>
                <li>JS:<code>src/js/config.js</code></li>
                <li>JS:<code>src/js/charts/**/*.js</code></li>
                <li>JS:<code>src/js/leaflet-active-user.js</code></li>
                <li>JS:<code>src/js/googleMap.js</code></li>
                <li>JS:<code>src/js/emoji-button.js</code></li>
                <li>JS:<code>src/js/list.js</code></li>
                <li>JS:<code>src/js/utils.js</code></li>
                <li>JS:<code>src/js/navbar-darken-on-scroll.js</code></li>
                <li>JS:<code>src/js/progressbar.js</code></li>
                <li>Gulp:<code>src/gulp/gulp.json</code></li>
                <li>Gulp:<code>src/gulp/watch.gulp.js</code></li>
                <li>Gulp:<code>src/gulp/script.gulp.js</code></li>
                <li>page:<code>public/home/*.jsp</code></li>
                <li>page:<code>public/email/*.jsp</code></li>
                <li>page:<code>public/authentication/**/*.jsp</code></li>
                <li>page:<code>public/calendar.jsp</code></li>
                <li>page:<code>public/chat.jsp</code></li>
                <li>page:<code>public/kanban.jsp</code></li>
                <li>page:<code>public/widgets.jsp</code></li>
                <li>page:<code>public/pages/event-create.jsp</code></li>
                <li>page:<code>public/pages/event-detail.jsp</code></li>
                <li>page:<code>public/pages/invoice.jsp</code></li>
                <li>page:<code>public/pages/people.jsp</code></li>
                <li>page:<code>public/pages/privacy-policy.jsp</code></li>
                <li>page:<code>public/pages/notifications.jsp</code></li>
                <li>page:<code>public/utilities/clearfix.jsp</code></li>
                <li>page:<code>public/utilities/borders.jsp</code></li>
                <li>page:<code>public/utilities/colors.jsp</code></li>
                <li>page:<code>public/utilities/embed.jsp</code></li>
                <li>page:<code>public/components/background.jsp</code></li>
                <li>page:<code>public/components/badges.jsp</code></li>
                <li>page:<code>public/components/buttons.jsp</code></li>
                <li>page:<code>public/components/toasts.jsp</code></li>
                <li>page:<code>public/components/hoverbox.jsp</code></li>
                <li>page:<code>public/components/dropdowns.jsp</code></li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-alpha10</code> - Merlin</h5>
              <p class="mb-0">11 November, 2020</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>page:<code>pages/privacy-policy.jsp</code></li>
                <li>page:<code>pages/faq/faq-basic.jsp</code></li>
                <li>page:<code>pages/faq/faq-alt.jsp</code></li>
                <li>page:<code>pages/faq/faq-accordion.jsp</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>SCSS:<code>_full-calendar.scss</code></li>
                <li>SCSS:<code>_mixed.scss</code></li>
                <li>Docs: Add dropcap and text transformation in typography.jsp</li>
                <li>Docs: modals.jsp</li>
                <li>Docs: tables.jsp</li>
                <li>Docs: page-headers.jsp</li>
                <li>Page: Add order and customer page links in dashboard-alt.jsp</li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Progress bar animation</li>
                <li>Margin bottom in forms and component pages</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-alpha9</code> - Fox kestrel</h5>
              <p class="mb-0">2 November, 2020</p>
            </div>
            <div class="card-body bg-light">
              <h6>Add</h6>
              <ul class="bullet-inside ps-0">
                <li>Testimonial section in landing page</li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>SCSS:<code>_colored-link.scss</code></li>
                <li>SCSS:<code>_browser-support.scss</code></li>
                <li>SCSS:<code>_button.scss</code></li>
                <li>JS:<code> navbar-vertical.js</code></li>
                <li>Docs: Add brand colors in colors.jsp</li>
                <li>Docs: Navbar vertical event</li>
                <li>Button right align in orders.jsp</li>
                <li>Page:<code>checkout.jsp page</code></li>
                <li>Page: class name of links in footer of landing.jsp</li>
                <li>Class name of dropdown link in navbar top</li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Navbar vertical toggle hover</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-alpha8</code>- Brown</h5>
              <p class="mb-0">25 October, 2020</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Autocomplete search</li>
                <li>Component:<code>components/cookie-notice.jsp</code></li>
                <li>JS:<code>search.js</code></li>
                <li>JS:<code>cookie-notice.js</code></li>
                <li>SCSS:<code>_cookie-notice.scss</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>SCSS:<code>_search-box.scss</code></li>
                <li>SCSS:<code>_swiper.scss</code></li>
                <li>SCSS: Rename<code>_fullcalendar.scss</code>to<code>_full-calendar.scss</code></li>
                <li>SCSS:<code>_hover.scss</code></li>
                <li>JS:<code>swiper.js</code></li>
                <li>JS:<code>list.js</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Swiper slider width issue when navbar vertical collapsed</li>
                <li>Product slider height with relative to content</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-alpha7</code>- Spotted kestrel</h5>
              <p class="mb-0">13 October, 2020</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Page:<code>calendar.jsp</code></li>
                <li>Page:<code>authentication/wizard.jsp</code></li>
                <li>Page:<code>e-commerce/product-grid.jsp</code></li>
                <li>Page:<code>e-commerce/product-details.jsp</code></li>
                <li>Plugin:<code>fullCalendar</code>JavaScript plugin</li>
                <li>Plugin:<code>dayjs</code>JavaScript plugin</li>
                <li>Plugin:<code>lottie</code>JavaScript plugin</li>
                <li>Plugin:<code>Swiper</code>JavaScript plugin</li>
                <li>Plugin:<code>Rater</code>JavaScript plugin</li>
                <li>SCSS:<code>_fullcalendar.scss</code></li>
                <li>SCSS:<code>_wizard.scss</code></li>
                <li>SCSS:<code>_lottie.scss</code></li>
                <li>SCSS:<code>_rater.scss</code></li>
                <li>JS:<code>rater.js</code></li>
                <li>JS:<code>fullcalendar.js</code></li>
                <li>JS:<code>calendar/index.js</code></li>
                <li>JS:<code>calendar/events.js</code></li>
                <li>JS:<code>calendar/template.js</code></li>
                <li>JS:<code>swiper.js</code></li>
                <li>JS:<code>wizard.js</code></li>
                <li>JS:<code>lottie.js</code></li>
                <li><code>transform-middle</code>,<code>transform-middle-x</code>,<code>transform-middle-y</code>classes with responsive support</li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Bootstrap to<code>v5.0.0-alpha2</code></li>
                <li>Removed<code>t-0</code>,<code>r-0</code>,<code>b-0</code>,<code>t-0</code>classes.</li>
                <li>Removed<code>absolute-centered</code>,<code>absolute-vertical-centered</code>,<code>absolute-sm-vertical-centered</code>classes.</li>
                <li><code>.close</code>to<code>.btn-close</code>class.</li>
                <li>SCSS:<code>_anchor.scss</code></li>
                <li>SCSS:<code>_variables.scss</code></li>
                <li>SCSS:<code>_position.scss</code></li>
                <li>SCSS:<code>_utilities.scss</code></li>
                <li>SCSS:<code>_mixed.scss</code></li>
                <li>SCSS:<code>.a-0</code>to<code>.all-0</code></li>
                <li>SCSS:<code>_borders.scss</code></li>
                <li>SCSS:<code>_buttons.scss</code></li>
                <li>SCSS: Removed<code>.border-2x</code>class.</li>
                <li>SCSS: Replace<code>.border-{top|right|bottom|left}-2x</code>to<code>.border-{top|right|bottom|left}-2</code></li>
                <li>JS:<code>navbar-vertical.js</code></li>
                <li>JS:<code>echarts.js</code></li>
                <li>HTML:<code>widget.jsp</code></li>
                <li>HTML: Updated source link of<code>flatpickr.js</code>from HTML file</li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Removed<code>_tiny-slider.scss</code></li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-alpha6</code>- Mauritius kestrel</h5>
              <p class="mb-0">16 September, 2020</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Page:<code>chat.jsp</code></li>
                <li>Page:<code>kanban.jsp</code></li>
                <li>Plugin:<code>draggable</code>JavaScript plugin</li>
                <li>Plugin:<code>Emoji Button</code>JavaScript plugin</li>
                <li>SCSS:<code>_chat.scss</code></li>
                <li>SCSS:<code>_kanban.scss</code></li>
                <li>JS:<code>chat.js</code></li>
                <li>JS:<code>draggable.js</code></li>
                <li>JS:<code>emoji-button.js</code></li>
                <li>JS:<code>kanban.js</code></li>
                <li>Large border radius of different corners</li>
                <li>Grays link colors</li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>SCSS:<code>_variables.scss</code></li>
                <li>SCSS:<code>_utilities.scss</code></li>
                <li>SCSS:<code>_hover.scss</code></li>
                <li>SCSS:<code>_mixed.scss</code></li>
                <li>SCSS: Rename<code>_pointer.scss</code>to<code>_cursor.scss</code></li>
                <li>Utilities:<code>border.jsp</code></li>
                <li>Utilities:<code>colored-link.jsp</code></li>
                <li><code>package.json</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Negative margin issue</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-alpha5</code>- Eurasian hobby</h5>
              <p class="mb-0">9 September, 2020</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Page:<code>e-commerce/checkout.jsp</code></li>
                <li>Page:<code>e-commerce/customers.jsp</code></li>
                <li>Page:<code>e-commerce/orders.jsp</code></li>
                <li>Page:<code>e-commerce/product-list.jsp</code></li>
                <li>Page:<code>e-commerce/shopping-cart.jsp</code></li>
                <li>Plugin:<code>List.js</code>JavaScript plugin</li>
                <li>Layout:<strong>Navbar Top</strong></li>
                <li>Layout:<strong>Navbar Combo</strong></li>
                <li>Navbar Vertical Variations</li>
                <li>JS:<code>navbar-combo.js</code></li>
                <li>JS:<code>list.js</code></li>
                <li>JS:<code>quantity.js</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>Improve Pug codes</li>
                <li>JS:<code>demo-mode.js</code></li>
                <li>SCSS:<code>_navbar-vertical.scss</code></li>
                <li>SCSS:<code>_mixed.scss</code></li>
                <li>SCSS:<code>_variables.scss</code></li>
                <li>SCSS:<code>_functions.scss</code></li>
                <li>SCSS:<code>_mixins.scss</code></li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-alpha4</code>- Seychelles kestrel</h5>
              <p class="mb-0">24 August, 2020</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Page:<code>home/landing.jsp</code></li>
                <li>Page:<code>email/inbox.jsp</code></li>
                <li>Page:<code>email/email-details.jsp</code></li>
                <li>Page:<code>email/compose.jsp</code></li>
                <li>Authentication: Split Layout</li>
                <li>Plugin:<code>type.js</code>JavaScript plugin</li>
                <li>Plugin:<code>tinymce.js</code>JavaScript plugin</li>
                <li>JS:<code>bulk-select.js</code></li>
                <li>JS:<code>navbar-darken-on-scroll.js</code></li>
                <li>JS:<code>node.js</code></li>
                <li>JS:<code>scroll-to-top.js</code></li>
                <li>JS:<code>tinymce.js</code></li>
                <li>JS:<code>typed.js</code></li>
                <li>SCSS:<code> _landing.scss</code></li>
                <li>SCSS:<code>_navbar-standard.scss</code></li>
                <li>SCSS:<code>plugins/_tinymce.scss</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>SCSS:<code>_mixed.scss</code></li>
                <li>SCSS:<code>_variables.scss</code></li>
                <li>SCSS:<code>_hover.scss</code></li>
              </ul>
              <h6>Fix</h6>
              <ul class="bullet-inside ps-0">
                <li>Scroll padding top issue</li>
                <li>Switch input color</li>
                <li>Popover file location from node_modules</li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-alpha3</code> - Malagasy's kestrel</h5>
              <p class="mb-0">13 August, 2020</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Settings Panel</li>
                <li>Page:<code>dashboard-alt.jsp</code></li>
                <li>Page:<code>event-create.jsp</code></li>
                <li>Page:<code>event-detail.jsp</code></li>
                <li>Page:<code>InvitePeople.jsp</code></li>
                <li>Page:<code>invoice.jsp</code></li>
                <li>Page:<code>pricing.jsp</code></li>
                <li>Page:<code>pricing-alt.jsp</code></li>
                <li>Plugin:<code>CountUp.js</code></li>
                <li>Plugin:<code>Choices</code></li>
                <li>Plugin:<code>Dropzone</code></li>
                <li>Plugin:<code>Leaflet</code></li>
                <li>Plugin:<code>Google Map</code></li>
                <li>JS:<code>config.js</code></li>
                <li>JS:<code>demo-mode.js</code></li>
                <li>JS:<code>dropzone.js</code></li>
                <li>JS:<code>choices.js</code></li>
                <li>JS:<code>countup.js</code></li>
                <li>JS:<code>settings-panel.js</code></li>
                <li>JS:<code>googleMap.js</code></li>
                <li>JS:<code>copy-link.js</code></li>
                <li>JS:<code>charts/chart-line-payment.js</code></li>
                <li>JS:<code>charts/chart-real-time-user.js</code></li>
                <li>SCSS:<code>plugins/_choices.scss</code></li>
                <li>SCSS:<code>plugins/_dropzone.scss</code></li>
                <li>SCSS:<code>plugins/_glightbox.scss</code></li>
                <li>SCSS:<code>plugins/_leaflet.scss</code></li>
                <li>Design File(Figma)</li>
                <li><code>README.md</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>JS:<code>utils.js</code></li>
                <li>JS:<code>navbar-vertical.js</code></li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">v3.0.0-alpha2</code> - Dickinson's kestrel</h5>
              <p class="mb-0">6 August, 2020</p>
            </div>
            <div class="card-body bg-light">
              <h6>New</h6>
              <ul class="bullet-inside ps-0">
                <li>Page:<code>feed.jsp</code></li>
                <li>Page:<code>billing.jsp</code></li>
                <li>Plugin:<code>glightbox</code></li>
                <li>Plugin:<code>Plyr</code></li>
                <li>SCSS:<code>_plyr.scss</code></li>
                <li>JS:<code>glightbox.js</code></li>
                <li>JS:<code>plyr.js</code></li>
              </ul>
              <h6>Update</h6>
              <ul class="bullet-inside ps-0">
                <li>SCSS:<code>_flex.scss</code></li>
                <li>SCSS:<code>_dropdown.scss</code></li>
                <li>SCSS:<code>_position.scss</code></li>
                <li>JS:<code>src/js/theme.js</code></li>
              </ul>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-header">
              <h5 class="mb-2"><code class="fw-bold fs-1">3-alpha</code> - Initial Release</h5>
              <p class="mb-0">24 July, 2020</p>
            </div>
            <div class="card-body bg-light">
              <p class="mb-0">Nothing to see here.</p>
            </div>
          </div>
          <footer class="footer">
            <div class="row g-0 justify-content-between fs--1 mt-4 mb-3">
              <div class="col-12 col-sm-auto text-center">
                <p class="mb-0 text-600">Thank you for creating with Falcon <span class="d-none d-sm-inline-block">| </span><br class="d-sm-none" /> 2023 &copy; <a href="https://themewagon.com">Themewagon</a></p>
              </div>
              <div class="col-12 col-sm-auto text-center">
                <p class="mb-0 text-600">v3.17.0</p>
              </div>
            </div>
          </footer>
        </div>
        <div class="modal fade" id="authentication-modal" tabindex="-1" role="dialog" aria-labelledby="authentication-modal-label" aria-hidden="true">
          <div class="modal-dialog mt-6" role="document">
            <div class="modal-content border-0">
              <div class="modal-header px-5 position-relative modal-shape-header bg-shape">
                <div class="position-relative z-1" data-bs-theme="light">
                  <h4 class="mb-0 text-white" id="authentication-modal-label">Register</h4>
                  <p class="fs--1 mb-0 text-white">Please create your free Falcon account</p>
                </div>
                <button class="btn-close btn-close-white position-absolute top-0 end-0 mt-2 me-2" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body py-4 px-5">
                <form>
                  <div class="mb-3">
                    <label class="form-label" for="modal-auth-name">Name</label>
                    <input class="form-control" type="text" autocomplete="on" id="modal-auth-name" />
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="modal-auth-email">Email address</label>
                    <input class="form-control" type="email" autocomplete="on" id="modal-auth-email" />
                  </div>
                  <div class="row gx-2">
                    <div class="mb-3 col-sm-6">
                      <label class="form-label" for="modal-auth-password">Password</label>
                      <input class="form-control" type="password" autocomplete="on" id="modal-auth-password" />
                    </div>
                    <div class="mb-3 col-sm-6">
                      <label class="form-label" for="modal-auth-confirm-password">Confirm Password</label>
                      <input class="form-control" type="password" autocomplete="on" id="modal-auth-confirm-password" />
                    </div>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="modal-auth-register-checkbox" />
                    <label class="form-label" for="modal-auth-register-checkbox">I accept the <a href="#!">terms </a>and <a href="#!">privacy policy</a></label>
                  </div>
                  <div class="mb-3">
                    <button class="btn btn-primary d-block w-100 mt-3" type="submit" name="submit">Register</button>
                  </div>
                </form>
                <div class="position-relative mt-5">
                  <hr />
                  <div class="divider-content-center">or register with</div>
                </div>
                <div class="row g-2 mt-2">
                  <div class="col-sm-6"><a class="btn btn-outline-google-plus btn-sm d-block w-100" href="#"><span class="fab fa-google-plus-g me-2" data-fa-transform="grow-8"></span> google</a></div>
                  <div class="col-sm-6"><a class="btn btn-outline-facebook btn-sm d-block w-100" href="#"><span class="fab fa-facebook-square me-2" data-fa-transform="grow-8"></span> facebook</a></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->


    <div class="offcanvas offcanvas-end settings-panel border-0" id="settings-offcanvas" tabindex="-1" aria-labelledby="settings-offcanvas">
      <div class="offcanvas-header settings-panel-header bg-shape">
        <div class="z-1 py-1" data-bs-theme="light">
          <div class="d-flex justify-content-between align-items-center mb-1">
            <h5 class="text-white mb-0 me-2"><span class="fas fa-palette me-2 fs-0"></span>Settings</h5>
            <button class="btn btn-primary btn-sm rounded-pill mt-0 mb-0" data-theme-control="reset" style="font-size:12px"> <span class="fas fa-redo-alt me-1" data-fa-transform="shrink-3"></span>Reset</button>
          </div>
          <p class="mb-0 fs--1 text-white opacity-75"> Set your own customized style</p>
        </div>
        <button class="btn-close btn-close-white z-1 mt-0" type="button" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body scrollbar-overlay px-x1 h-100" id="themeController">
        <h5 class="fs-0">Color Scheme</h5>
        <p class="fs--1">Choose the perfect color mode for your app.</p>
        <div class="btn-group d-block w-100 btn-group-navbar-style">
          <div class="row gx-2">
            <div class="col-6">
              <input class="btn-check" id="themeSwitcherLight" name="theme-color" type="radio" value="light" data-theme-control="theme" />
              <label class="btn d-inline-block btn-navbar-style fs--1" for="themeSwitcherLight"> <span class="hover-overlay mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0" src="assets/img/generic/falcon-mode-default.jpg" alt=""/></span><span class="label-text">Light</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="themeSwitcherDark" name="theme-color" type="radio" value="dark" data-theme-control="theme" />
              <label class="btn d-inline-block btn-navbar-style fs--1" for="themeSwitcherDark"> <span class="hover-overlay mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0" src="assets/img/generic/falcon-mode-dark.jpg" alt=""/></span><span class="label-text"> Dark</span></label>
            </div>
          </div>
        </div>
        <hr />
        <div class="d-flex justify-content-between">
          <div class="d-flex align-items-start"><img class="me-2" src="assets/img/icons/left-arrow-from-left.svg" width="20" alt="" />
            <div class="flex-1">
              <h5 class="fs-0">RTL Mode</h5>
              <p class="fs--1 mb-0">Switch your language direction </p><a class="fs--1" href="documentation/customization/configuration.jsp">RTL Documentation</a>
            </div>
          </div>
          <div class="form-check form-switch">
            <input class="form-check-input ms-0" id="mode-rtl" type="checkbox" data-theme-control="isRTL" />
          </div>
        </div>
        <hr />
        <div class="d-flex justify-content-between">
          <div class="d-flex align-items-start"><img class="me-2" src="assets/img/icons/arrows-h.svg" width="20" alt="" />
            <div class="flex-1">
              <h5 class="fs-0">Fluid Layout</h5>
              <p class="fs--1 mb-0">Toggle container layout system </p><a class="fs--1" href="documentation/customization/configuration.jsp">Fluid Documentation</a>
            </div>
          </div>
          <div class="form-check form-switch">
            <input class="form-check-input ms-0" id="mode-fluid" type="checkbox" data-theme-control="isFluid" />
          </div>
        </div>
        <hr />
        <div class="d-flex align-items-start"><img class="me-2" src="assets/img/icons/paragraph.svg" width="20" alt="" />
          <div class="flex-1">
            <h5 class="fs-0 d-flex align-items-center">Navigation Position</h5>
            <p class="fs--1 mb-2">Select a suitable navigation system for your web application </p>
            <div>
              <select class="form-select form-select-sm" aria-label="Navbar position" data-theme-control="navbarPosition">
                <option value="vertical" data-page-url="modules/components/navs-and-tabs/vertical-navbar.jsp">Vertical</option>
                <option value="top" data-page-url="modules/components/navs-and-tabs/top-navbar.jsp">Top</option>
                <option value="combo" data-page-url="modules/components/navs-and-tabs/combo-navbar.jsp">Combo</option>
                <option value="double-top" data-page-url="modules/components/navs-and-tabs/double-top-navbar.jsp">Double Top</option>
              </select>
            </div>
          </div>
        </div>
        <hr />
        <h5 class="fs-0 d-flex align-items-center">Vertical Navbar Style</h5>
        <p class="fs--1 mb-0">Switch between styles for your vertical navbar </p>
        <p> <a class="fs--1" href="modules/components/navs-and-tabs/vertical-navbar.jsp#navbar-styles">See Documentation</a></p>
        <div class="btn-group d-block w-100 btn-group-navbar-style">
          <div class="row gx-2">
            <div class="col-6">
              <input class="btn-check" id="navbar-style-transparent" type="radio" name="navbarStyle" value="transparent" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-transparent"> <img class="img-fluid img-prototype" src="assets/img/generic/default.png" alt="" /><span class="label-text"> Transparent</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="navbar-style-inverted" type="radio" name="navbarStyle" value="inverted" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-inverted"> <img class="img-fluid img-prototype" src="assets/img/generic/inverted.png" alt="" /><span class="label-text"> Inverted</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="navbar-style-card" type="radio" name="navbarStyle" value="card" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-card"> <img class="img-fluid img-prototype" src="assets/img/generic/card.png" alt="" /><span class="label-text"> Card</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="navbar-style-vibrant" type="radio" name="navbarStyle" value="vibrant" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-vibrant"> <img class="img-fluid img-prototype" src="assets/img/generic/vibrant.png" alt="" /><span class="label-text"> Vibrant</span></label>
            </div>
          </div>
        </div>
        <div class="text-center mt-5"><img class="mb-4" src="assets/img/icons/spot-illustrations/47.png" alt="" width="120" />
          <h5>Like What You See?</h5>
          <p class="fs--1">Get Falcon now and create beautiful dashboards with hundreds of widgets.</p><a class="mb-3 btn btn-primary" href="https://themes.getbootstrap.com/product/falcon-admin-dashboard-webapp-template/" target="_blank">Purchase</a>
        </div>
      </div>
    </div><a class="card setting-toggle" href="#settings-offcanvas" data-bs-toggle="offcanvas">
      <div class="card-body d-flex align-items-center py-md-2 px-2 py-1">
        <div class="bg-primary-subtle position-relative rounded-start" style="height:34px;width:28px">
          <div class="settings-popover"><span class="ripple"><span class="fa-spin position-absolute all-0 d-flex flex-center"><span class="icon-spin position-absolute all-0 d-flex flex-center">
                  <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M19.7369 12.3941L19.1989 12.1065C18.4459 11.7041 18.0843 10.8487 18.0843 9.99495C18.0843 9.14118 18.4459 8.28582 19.1989 7.88336L19.7369 7.59581C19.9474 7.47484 20.0316 7.23291 19.9474 7.03131C19.4842 5.57973 18.6843 4.28943 17.6738 3.20075C17.5053 3.03946 17.2527 2.99914 17.0422 3.12011L16.393 3.46714C15.6883 3.84379 14.8377 3.74529 14.1476 3.3427C14.0988 3.31422 14.0496 3.28621 14.0002 3.25868C13.2568 2.84453 12.7055 2.10629 12.7055 1.25525V0.70081C12.7055 0.499202 12.5371 0.297594 12.2845 0.257272C10.7266 -0.105622 9.16879 -0.0653007 7.69516 0.257272C7.44254 0.297594 7.31623 0.499202 7.31623 0.70081V1.23474C7.31623 2.09575 6.74999 2.8362 5.99824 3.25599C5.95774 3.27861 5.91747 3.30159 5.87744 3.32493C5.15643 3.74527 4.26453 3.85902 3.53534 3.45302L2.93743 3.12011C2.72691 2.99914 2.47429 3.03946 2.30587 3.20075C1.29538 4.28943 0.495411 5.57973 0.0322686 7.03131C-0.051939 7.23291 0.0322686 7.47484 0.242788 7.59581L0.784376 7.8853C1.54166 8.29007 1.92694 9.13627 1.92694 9.99495C1.92694 10.8536 1.54166 11.6998 0.784375 12.1046L0.242788 12.3941C0.0322686 12.515 -0.051939 12.757 0.0322686 12.9586C0.495411 14.4102 1.29538 15.7005 2.30587 16.7891C2.47429 16.9504 2.72691 16.9907 2.93743 16.8698L3.58669 16.5227C4.29133 16.1461 5.14131 16.2457 5.8331 16.6455C5.88713 16.6767 5.94159 16.7074 5.99648 16.7375C6.75162 17.1511 7.31623 17.8941 7.31623 18.7552V19.2891C7.31623 19.4425 7.41373 19.5959 7.55309 19.696C7.64066 19.7589 7.74815 19.7843 7.85406 19.8046C9.35884 20.0925 10.8609 20.0456 12.2845 19.7729C12.5371 19.6923 12.7055 19.4907 12.7055 19.2891V18.7346C12.7055 17.8836 13.2568 17.1454 14.0002 16.7312C14.0496 16.7037 14.0988 16.6757 14.1476 16.6472C14.8377 16.2446 15.6883 16.1461 16.393 16.5227L17.0422 16.8698C17.2527 16.9907 17.5053 16.9504 17.6738 16.7891C18.7264 15.7005 19.4842 14.4102 19.9895 12.9586C20.0316 12.757 19.9474 12.515 19.7369 12.3941ZM10.0109 13.2005C8.1162 13.2005 6.64257 11.7893 6.64257 9.97478C6.64257 8.20063 8.1162 6.74905 10.0109 6.74905C11.8634 6.74905 13.3792 8.20063 13.3792 9.97478C13.3792 11.7893 11.8634 13.2005 10.0109 13.2005Z" fill="#2A7BE4"></path>
                  </svg></span></span></span></div>
        </div><small class="text-uppercase text-primary fw-bold bg-primary-subtle py-2 pe-2 ps-1 rounded-end">customize</small>
      </div>
    </a>


    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="vendors/popper/popper.min.js"></script>
    <script src="vendors/bootstrap/bootstrap.min.js"></script>
    <script src="vendors/anchorjs/anchor.min.js"></script>
    <script src="vendors/is/is.min.js"></script>
    <script src="vendors/prism/prism.js"></script>
    <script src="vendors/fontawesome/all.min.js"></script>
    <script src="vendors/lodash/lodash.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="vendors/list.js/list.min.js"></script>
    <script src="assets/js/theme.js"></script>

  </body>

</html>