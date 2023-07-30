<!DOCTYPE html>
<html class="navbar-vertical-collapsed" data-bs-theme="light" lang="en-US" dir="ltr">

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
    <link rel="apple-touch-icon" sizes="180x180" href="../../../assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../../../assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../../../assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="../../../assets/img/favicons/favicon.ico">
    <link rel="manifest" href="../../../assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="../../../assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="../../../assets/js/config.js"></script>
    <script src="../../../vendors/simplebar/simplebar.min.js"></script>


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="../../../vendors/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="../../../vendors/glightbox/glightbox.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
    <link href="../../../vendors/simplebar/simplebar.min.css" rel="stylesheet">
    <link href="../../../assets/css/theme-rtl.css" rel="stylesheet" id="style-rtl">
    <link href="../../../assets/css/theme.css" rel="stylesheet" id="style-default">
    <link href="../../../assets/css/user-rtl.css" rel="stylesheet" id="user-style-rtl">
    <link href="../../../assets/css/user.css" rel="stylesheet" id="user-style-default">
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
        <nav class="navbar navbar-light navbar-glass navbar-top navbar-expand-lg">

          <button class="btn navbar-toggler-humburger-icon navbar-toggler me-1 me-sm-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarStandard" aria-controls="navbarStandard" aria-expanded="false" aria-label="Toggle Navigation"><span class="navbar-toggle-icon"><span class="toggle-line"></span></span></button>
          <a class="navbar-brand me-1 me-sm-3" href="../../../index.jsp">
            <div class="d-flex align-items-center"><img class="me-2" src="../../../assets/img/icons/spot-illustrations/falcon.png" alt="" width="40" /><span class="font-sans-serif">falcon</span>
            </div>
          </a>
          <div class="collapse navbar-collapse scrollbar" id="navbarStandard">
            <ul class="navbar-nav" data-top-nav-dropdowns="data-top-nav-dropdowns">
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="dashboards">Dashboard</a>
                <div class="dropdown-menu dropdown-caret dropdown-menu-card border-0 mt-0" aria-labelledby="dashboards">
                  <div class="bg-white dark__bg-1000 rounded-3 py-2"><a class="dropdown-item link-600 fw-medium" href="../../../index.jsp">Default</a><a class="dropdown-item link-600 fw-medium" href="../../../dashboard/analytics.jsp">Analytics</a><a class="dropdown-item link-600 fw-medium" href="../../../dashboard/crm.jsp">CRM</a><a class="dropdown-item link-600 fw-medium" href="../../../dashboard/e-commerce.jsp">E commerce</a><a class="dropdown-item link-600 fw-medium" href="../../../dashboard/lms.jsp">LMS<span class="badge rounded-pill ms-2 badge-subtle-success">New</span></a><a class="dropdown-item link-600 fw-medium" href="../../../dashboard/project-management.jsp">Management</a><a class="dropdown-item link-600 fw-medium" href="../../../dashboard/saas.jsp">SaaS</a><a class="dropdown-item link-600 fw-medium" href="../../../dashboard/support-desk.jsp">Support desk<span class="badge rounded-pill ms-2 badge-subtle-success">New</span></a>
                  </div>
                </div>
              </li>
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="apps">App</a>
                <div class="dropdown-menu dropdown-caret dropdown-menu-card border-0 mt-0" aria-labelledby="apps">
                  <div class="card navbar-card-app shadow-none dark__bg-1000">
                    <div class="card-body scrollbar max-h-dropdown"><img class="img-dropdown" src="../../../assets/img/icons/spot-illustrations/authentication-corner.png" width="130" alt="" />
                      <div class="row">
                        <div class="col-6 col-md-4">
                          <div class="nav flex-column"><a class="nav-link py-1 link-600 fw-medium" href="../../../app/calendar.jsp">Calendar</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/chat.jsp">Chat</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-learning/trainer-profile.jsp">Trainer profile</a>
                            <p class="nav-link text-700 mb-0 fw-bold">Social</p><a class="nav-link py-1 link-600 fw-medium" href="../../../app/kanban.jsp">Kanban</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/social/feed.jsp">Feed</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/social/activity-log.jsp">Activity log</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/social/notifications.jsp">Notifications</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/social/followers.jsp">Followers</a>
                            <p class="nav-link text-700 mb-0 fw-bold">Support Desk</p><a class="nav-link py-1 link-600 fw-medium" href="../../../app/support-desk/table-view.jsp">Table view</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/support-desk/card-view.jsp">Card view</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/support-desk/contacts.jsp">Contacts</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/support-desk/contact-details.jsp">Contact details</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/support-desk/tickets-preview.jsp">Tickets preview</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/support-desk/quick-links.jsp">Quick links</a>
                          </div>
                        </div>
                        <div class="col-6 col-md-4">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">E-Learning</p><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-commerce/invoice.jsp">Invoice</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-learning/course/course-list.jsp">Course list</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-learning/course/course-grid.jsp">Course grid</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-learning/course/course-details.jsp">Course details</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-learning/course/create-a-course.jsp">Create a course</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-learning/student-overview.jsp">Student overview</a>
                            <p class="nav-link text-700 mb-0 fw-bold">Events</p><a class="nav-link py-1 link-600 fw-medium" href="../../../app/events/create-an-event.jsp">Create an event</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/events/event-detail.jsp">Event detail</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/events/event-list.jsp">Event list</a>
                            <p class="nav-link text-700 mb-0 fw-bold">Email</p><a class="nav-link py-1 link-600 fw-medium" href="../../../app/email/inbox.jsp">Inbox</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/email/email-detail.jsp">Email detail</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/email/compose.jsp">Compose</a>
                          </div>
                        </div>
                        <div class="col-6 col-md-4">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">E-Commerce</p><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-commerce/product/product-list.jsp">Product list</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-commerce/product/product-grid.jsp">Product grid</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-commerce/product/product-details.jsp">Product details</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-commerce/product/add-product.jsp">Add product</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-commerce/orders/order-list.jsp">Order list</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-commerce/orders/order-details.jsp">Order details</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-commerce/customers.jsp">Customers</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-commerce/customer-details.jsp">Customer details</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-commerce/shopping-cart.jsp">Shopping cart</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-commerce/checkout.jsp">Checkout</a><a class="nav-link py-1 link-600 fw-medium" href="../../../app/e-commerce/billing.jsp">Billing</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="pagess">Pages</a>
                <div class="dropdown-menu dropdown-caret dropdown-menu-card border-0 mt-0" aria-labelledby="pagess">
                  <div class="card navbar-card-pages shadow-none dark__bg-1000">
                    <div class="card-body scrollbar max-h-dropdown"><img class="img-dropdown" src="../../../assets/img/icons/spot-illustrations/authentication-corner.png" width="130" alt="" />
                      <div class="row">
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">Simple Auth</p><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/simple/login.jsp">Login</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/simple/logout.jsp">Logout</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/simple/register.jsp">Register</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/simple/forgot-password.jsp">Forgot password</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/simple/confirm-mail.jsp">Confirm mail</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/simple/reset-password.jsp">Reset password</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/simple/lock-screen.jsp">Lock screen</a>
                          </div>
                        </div>
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">Card Auth</p><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/card/login.jsp">Login</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/card/logout.jsp">Logout</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/card/register.jsp">Register</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/card/forgot-password.jsp">Forgot password</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/card/confirm-mail.jsp">Confirm mail</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/card/reset-password.jsp">Reset password</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/card/lock-screen.jsp">Lock screen</a>
                          </div>
                        </div>
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">Split Auth</p><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/split/login.jsp">Login</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/split/logout.jsp">Logout</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/split/register.jsp">Register</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/split/forgot-password.jsp">Forgot password</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/split/confirm-mail.jsp">Confirm mail</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/split/reset-password.jsp">Reset password</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/split/lock-screen.jsp">Lock screen</a>
                          </div>
                        </div>
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">Layouts</p><a class="nav-link py-1 link-600 fw-medium" href="../../../demo/navbar-vertical.jsp">Navbar vertical</a><a class="nav-link py-1 link-600 fw-medium" href="../../../demo/navbar-top.jsp">Top nav</a><a class="nav-link py-1 link-600 fw-medium" href="../../../demo/navbar-double-top.jsp">Double top<span class="badge rounded-pill ms-2 badge-subtle-success">New</span></a><a class="nav-link py-1 link-600 fw-medium" href="../../../demo/combo-nav.jsp">Combo nav</a>
                            <p class="nav-link text-700 mb-0 fw-bold">Others</p><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/starter.jsp">Starter</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/landing.jsp">Landing</a>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">User</p><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/user/profile.jsp">Profile</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/user/settings.jsp">Settings</a>
                          </div>
                        </div>
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">Pricing</p><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/pricing/pricing-default.jsp">Pricing default</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/pricing/pricing-alt.jsp">Pricing alt</a>
                          </div>
                        </div>
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">Errors</p><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/errors/404.jsp">404</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/errors/500.jsp">500</a>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">Miscellaneous</p><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/miscellaneous/associations.jsp">Associations</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/miscellaneous/invite-people.jsp">Invite people</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/miscellaneous/privacy-policy.jsp">Privacy policy</a>
                          </div>
                        </div>
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">FAQ</p><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/faq/faq-basic.jsp">Faq basic</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/faq/faq-alt.jsp">Faq alt</a><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/faq/faq-accordion.jsp">Faq accordion</a>
                          </div>
                        </div>
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">Other Auth</p><a class="nav-link py-1 link-600 fw-medium" href="../../../pages/authentication/wizard.jsp">Wizard</a><a class="nav-link py-1 link-600 fw-medium" href="../../../#authentication-modal" data-bs-toggle="modal">Modal</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="moduless">Modules</a>
                <div class="dropdown-menu dropdown-caret dropdown-menu-card border-0 mt-0" aria-labelledby="moduless">
                  <div class="card navbar-card-components shadow-none dark__bg-1000">
                    <div class="card-body scrollbar max-h-dropdown"><img class="img-dropdown" src="../../../assets/img/icons/spot-illustrations/authentication-corner.png" width="130" alt="" />
                      <div class="row">
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">Components</p><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/icons/feather.jsp">Feather</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/icons/material-icons.jsp">Material icons</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/maps/google-map.jsp">Google map</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/maps/leaflet-map.jsp">Leaflet map</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/accordion.jsp">Accordion</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/alerts.jsp">Alerts</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/anchor.jsp">Anchor</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/animated-icons.jsp">Animated icons</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/background.jsp">Background</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/badges.jsp">Badges</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/bottom-bar.jsp">Bottom bar<span class="badge rounded-pill ms-2 badge-subtle-success">New</span></a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/breadcrumbs.jsp">Breadcrumbs</a>
                          </div>
                        </div>
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column mt-md-4 pt-md-1"><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/buttons.jsp">Buttons</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/calendar.jsp">Calendar</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/cards.jsp">Cards</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/carousel/bootstrap.jsp">Bootstrap carousel</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/carousel/swiper.jsp">Swiper</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/collapse.jsp">Collapse</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/cookie-notice.jsp">Cookie notice</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/countup.jsp">Countup</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/draggable.jsp">Draggable</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/dropdowns.jsp">Dropdowns</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/jquery-components.jsp">Jquery<span class="badge rounded-pill ms-2 badge-subtle-success">New</span></a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/list-group.jsp">List group</a>
                          </div>
                        </div>
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column mt-xxl-4 pt-xxl-1"><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/modals.jsp">Modals</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/navs-and-tabs/navs.jsp">Navs</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/navs-and-tabs/navbar.jsp">Navbar</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/navs-and-tabs/vertical-navbar.jsp">Navbar vertical</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/navs-and-tabs/top-navbar.jsp">Top nav</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/navs-and-tabs/double-top-navbar.jsp">Double top<span class="badge rounded-pill ms-2 badge-subtle-success">New</span></a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/navs-and-tabs/combo-navbar.jsp">Combo nav</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/navs-and-tabs/tabs.jsp">Tabs</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/offcanvas.jsp">Offcanvas</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/pictures/avatar.jsp">Avatar</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/pictures/images.jsp">Images</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/pictures/figures.jsp">Figures</a>
                          </div>
                        </div>
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column mt-xxl-4 pt-xxl-1"><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/pictures/hoverbox.jsp">Hoverbox</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/pictures/lightbox.jsp">Lightbox</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/progress-bar.jsp">Progress bar</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/placeholder.jsp">Placeholder</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/pagination.jsp">Pagination</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/popovers.jsp">Popovers</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/scrollspy.jsp">Scrollspy</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/search.jsp">Search</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/spinners.jsp">Spinners</a>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">Forms</p><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/basic/form-control.jsp">Form control</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/basic/input-group.jsp">Input group</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/basic/select.jsp">Select</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/basic/checks.jsp">Checks</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/basic/range.jsp">Range</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/basic/layout.jsp">Layout</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/advance/advance-select.jsp">Advance select</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/advance/date-picker.jsp">Date picker</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/advance/editor.jsp">Editor</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/advance/emoji-button.jsp">Emoji button</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/advance/file-uploader.jsp">File uploader</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/advance/input-mask.jsp">Input mask</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/advance/range-slider.jsp">Range slider</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/advance/rating.jsp">Rating</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/floating-labels.jsp">Floating labels</a>
                          </div>
                        </div>
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">Tables</p><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/wizard.jsp">Wizard</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/forms/validation.jsp">Validation</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/tables/basic-tables.jsp">Basic tables</a>
                            <p class="nav-link text-700 mb-0 fw-bold">Charts</p><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/tables/advance-tables.jsp">Advance tables</a>
                            <p class="nav-link text-700 mb-0 fw-bold">ECharts</p><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/tables/bulk-select.jsp">Bulk select</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/charts/chartjs.jsp">Chartjs</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/charts/d3js.jsp">D3js<span class="badge rounded-pill ms-2 badge-subtle-success">New</span></a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/charts/echarts/line-charts.jsp">Line charts</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/charts/echarts/bar-charts.jsp">Bar charts</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/charts/echarts/candlestick-charts.jsp">Candlestick charts</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/charts/echarts/geo-map.jsp">Geo map</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/charts/echarts/scatter-charts.jsp">Scatter charts</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/charts/echarts/pie-charts.jsp">Pie charts</a>
                          </div>
                        </div>
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column">
                            <p class="nav-link text-700 mb-0 fw-bold">Utilities</p><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/timeline.jsp">Timeline</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/toasts.jsp">Toasts</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/tooltips.jsp">Tooltips</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/treeview.jsp">Treeview</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/typed-text.jsp">Typed text</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/videos/embed.jsp">Embed</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/components/videos/plyr.jsp">Plyr</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/utilities/borders.jsp">Borders</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/utilities/clearfix.jsp">Clearfix</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/utilities/colors.jsp">Colors</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/utilities/colored-links.jsp">Colored links</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/utilities/display.jsp">Display</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/utilities/flex.jsp">Flex</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/utilities/float.jsp">Float</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/utilities/grid.jsp">Grid</a>
                          </div>
                        </div>
                        <div class="col-6 col-xxl-3">
                          <div class="nav flex-column pt-xxl-1">
                            <p class="nav-link text-700 mb-0 fw-bold">Icons</p><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/charts/echarts/gauge-charts.jsp">Gauge charts</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/charts/echarts/radar-charts.jsp">Radar charts</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/charts/echarts/heatmap-charts.jsp">Heatmap charts</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/charts/echarts/how-to-use.jsp">How to use</a>
                            <p class="nav-link text-700 mb-0 fw-bold">Maps</p><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/icons/font-awesome.jsp">Font awesome</a><a class="nav-link py-1 link-600 fw-medium" href="../../../modules/icons/bootstrap-icons.jsp">Bootstrap icons</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="documentations">Documentation</a>
                <div class="dropdown-menu dropdown-caret dropdown-menu-card border-0 mt-0" aria-labelledby="documentations">
                  <div class="bg-white dark__bg-1000 rounded-3 py-2"><a class="dropdown-item link-600 fw-medium" href="../../../documentation/getting-started.jsp">Getting started</a><a class="dropdown-item link-600 fw-medium" href="../../../documentation/customization/configuration.jsp">Configuration</a><a class="dropdown-item link-600 fw-medium" href="../../../documentation/customization/styling.jsp">Styling<span class="badge rounded-pill ms-2 badge-subtle-success">Updated</span></a><a class="dropdown-item link-600 fw-medium" href="../../../documentation/customization/dark-mode.jsp">Dark mode</a><a class="dropdown-item link-600 fw-medium" href="../../../documentation/customization/plugin.jsp">Plugin</a><a class="dropdown-item link-600 fw-medium" href="../../../documentation/faq.jsp">Faq</a><a class="dropdown-item link-600 fw-medium" href="../../../documentation/gulp.jsp">Gulp</a><a class="dropdown-item link-600 fw-medium" href="../../../documentation/design-file.jsp">Design file</a><a class="dropdown-item link-600 fw-medium" href="../../../changelog.jsp">Changelog</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
          <ul class="navbar-nav navbar-nav-icons ms-auto flex-row align-items-center">
            <li class="nav-item px-2">
              <div class="theme-control-toggle fa-icon-wait">
                <input class="form-check-input ms-0 theme-control-toggle-input" id="themeControlToggle" type="checkbox" data-theme-control="theme" value="dark" />
                <label class="mb-0 theme-control-toggle-label theme-control-toggle-light" for="themeControlToggle" data-bs-toggle="tooltip" data-bs-placement="left" title="Switch to light theme"><span class="fas fa-sun fs-0"></span></label>
                <label class="mb-0 theme-control-toggle-label theme-control-toggle-dark" for="themeControlToggle" data-bs-toggle="tooltip" data-bs-placement="left" title="Switch to dark theme"><span class="fas fa-moon fs-0"></span></label>
              </div>
            </li>
            <li class="nav-item d-none d-sm-block">
              <a class="nav-link px-0 notification-indicator notification-indicator-warning notification-indicator-fill fa-icon-wait" href="../../../app/e-commerce/shopping-cart.jsp"><span class="fas fa-shopping-cart" data-fa-transform="shrink-7" style="font-size: 33px;"></span><span class="notification-indicator-number">1</span></a>

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
                              <img class="rounded-circle" src="../../../assets/img/team/1-thumb.png" alt="" />

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
                              <img class="rounded-circle" src="../../../assets/img/icons/weather-sm.jpg" alt="" />

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
                              <img class="rounded-circle" src="../../../assets/img/logos/oxford.png" alt="" />

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
                              <img class="rounded-circle" src="../../../assets/img/team/10.jpg" alt="" />

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
                  <div class="card-footer text-center border-top"><a class="card-link d-block" href="../../../app/social/notifications.jsp">View all</a></div>
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
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="../../../pages/user/profile.jsp" target="_blank">
                            <div class="avatar avatar-2xl"> <img class="rounded-circle" src="../../../assets/img/team/3.jpg" alt="" /></div>
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2">Account</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="https://themewagon.com/" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/themewagon.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Themewagon</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="https://mailbluster.com/" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/mailbluster.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Mailbluster</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/google.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Google</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/spotify.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Spotify</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/steam.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Steam</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/github-light.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Github</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/discord.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Discord</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/xbox.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">xbox</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/trello.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Kanban</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/hp.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Hp</p>
                          </a></div>
                        <div class="col-12">
                          <hr class="my-3 mx-n3 bg-200" />
                        </div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/linkedin.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Linkedin</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/twitter.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Twitter</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/facebook.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Facebook</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/instagram.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Instagram</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/pinterest.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Pinterest</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/slack.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Slack</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="#!" target="_blank"><img class="rounded" src="../../../assets/img/nav-icons/deviantart.png" alt="" width="40" height="40" />
                            <p class="mb-0 fw-medium text-800 text-truncate fs--2 pt-1">Deviantart</p>
                          </a></div>
                        <div class="col-4"><a class="d-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none" href="../../../app/events/event-detail.jsp" target="_blank">
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
                  <img class="rounded-circle" src="../../../assets/img/team/3-thumb.png" alt="" />

                </div>
              </a>
              <div class="dropdown-menu dropdown-caret dropdown-caret dropdown-menu-end py-0" aria-labelledby="navbarDropdownUser">
                <div class="bg-white dark__bg-1000 rounded-2 py-2">
                  <a class="dropdown-item fw-bold text-warning" href="#!"><span class="fas fa-crown me-1"></span><span>Go Pro</span></a>

                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#!">Set status</a>
                  <a class="dropdown-item" href="../../../pages/user/profile.jsp">Profile &amp; account</a>
                  <a class="dropdown-item" href="#!">Feedback</a>

                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="../../../pages/user/settings.jsp">Settings</a>
                  <a class="dropdown-item" href="../../../pages/authentication/card/logout.jsp">Logout</a>
                </div>
              </div>
            </li>
          </ul>
        </nav>
        <div class="content">
          <div class="row g-3">
            <div class="col-xxl-2 col-xl-3">
              <aside class="scrollbar-overlay font-sans-serif p-4 p-xl-3 ps-xl-0 offcanvas offcanvas-start offcanvas-filter-sidebar" tabindex="-1" id="filterOffcanvas" aria-labelledby="filterOffcanvasLabel">
                <div class="d-flex flex-between-center">
                  <div class="d-flex gap-2 flex-xl-grow-1 align-items-center justify-content-xl-between">
                    <h5 class="mb-0 text-700 d-flex align-items-center" id="filterOffcanvasLabel"><span class="fas fa-filter fs--1 me-1"></span><span>Filter</span></h5>
                    <button class="btn btn-sm btn-outline-secondary">Reset</button>
                  </div>
                  <button class="btn-close text-reset d-xl-none shadow-none" type="button" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="d-flex gap-2 flex-wrap my-3"><span class="badge bg-300 text-600 py-0">Free
                    <button class="btn btn-link btn-sm p-0 text-600 ms-1"><span class="fas fa-times fs--2"></span></button></span><span class="badge bg-300 text-600 py-0">On sale
                    <button class="btn btn-link btn-sm p-0 text-600 ms-1"><span class="fas fa-times fs--2"></span></button></span><span class="badge bg-300 text-600 py-0">Design
                    <button class="btn btn-link btn-sm p-0 text-600 ms-1"><span class="fas fa-times fs--2"></span></button></span><span class="badge bg-300 text-600 py-0">English
                    <button class="btn btn-link btn-sm p-0 text-600 ms-1"><span class="fas fa-times fs--2"></span></button></span>
                </div>
                <ul class="list-unstyled">
                  <li class="border-bottom"><a class="nav-link collapse-indicator-plus fs--2 fw-medium text-600 py-3" data-bs-toggle="collapse" href="#category-collapse" aria-controls="category-collapse" aria-expanded="true">Category</a>
                    <div class="collapse show" id="category-collapse">
                      <ul class="list-unstyled">
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-category-free"><span class="fas fa-file-alt fs--1 me-3"></span>Free
                            </label>
                            <input class="form-check-input" type="checkbox" checked="checked" name="free" id="filter-category-free" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-category-paid"><span class="fas fa-file-invoice-dollar fs--1 me-3"></span>Paid
                            </label>
                            <input class="form-check-input" type="checkbox" name="paid" id="filter-category-paid" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-category-on-sale"><span class="fas fa-tags fs--2 me-3"></span>On Sale
                            </label>
                            <input class="form-check-input" type="checkbox" checked="checked" name="on-sale" id="filter-category-on-sale" />
                          </div>
                        </li>
                      </ul>
                    </div>
                  </li>
                  <li class="border-bottom"><a class="nav-link collapse-indicator-plus fs--2 fw-medium text-600 py-3" data-bs-toggle="collapse" href="#subject-collapse" aria-controls="subject-collapse" aria-expanded="true">Subject</a>
                    <div class="collapse show" id="subject-collapse">
                      <ul class="list-unstyled">
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-subject-design"><span class="fas fa-brush fs--1 me-3"></span>Design
                            </label>
                            <input class="form-check-input" type="checkbox" checked="checked" name="design" id="filter-subject-design" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-subject-web-development"><span class="fas fa-globe fs--1 me-3"></span>Web Development
                            </label>
                            <input class="form-check-input" type="checkbox" name="web-development" id="filter-subject-web-development" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-subject-software"><span class="fas fa-code fs--1 me-3"></span>Software
                            </label>
                            <input class="form-check-input" type="checkbox" name="software" id="filter-subject-software" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-subject-business"><span class="fas fa-balance-scale-left fs--1 me-3"></span>Business
                            </label>
                            <input class="form-check-input" type="checkbox" name="business" id="filter-subject-business" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-subject-marketing"><span class="fas fa-comment-dollar fs--1 me-3"></span>Marketing
                            </label>
                            <input class="form-check-input" type="checkbox" name="marketing" id="filter-subject-marketing" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-subject-self-help"><span class="fas fa-hand-holding-water fs--1 me-3"></span>Self Help
                            </label>
                            <input class="form-check-input" type="checkbox" name="self-help" id="filter-subject-self-help" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-subject-photography"><span class="fas fa-camera-retro fs--1 me-3"></span>Photography
                            </label>
                            <input class="form-check-input" type="checkbox" name="photography" id="filter-subject-photography" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-subject-music"><span class="fas fa-music fs--1 me-3"></span>Music
                            </label>
                            <input class="form-check-input" type="checkbox" name="music" id="filter-subject-music" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-subject-writing"><span class="fas fa-pen-nib fs--1 me-3"></span>Writing
                            </label>
                            <input class="form-check-input" type="checkbox" name="writing" id="filter-subject-writing" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-subject-painting"><span class="fas fa-palette fs--1 me-3"></span>Painting
                            </label>
                            <input class="form-check-input" type="checkbox" name="painting" id="filter-subject-painting" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-subject-cooking"><span class="fas fa-utensils fs--1 me-3"></span>Cooking
                            </label>
                            <input class="form-check-input" type="checkbox" name="cooking" id="filter-subject-cooking" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-subject-teaching"><span class="fas fa-book fs--1 me-3"></span>Teaching
                            </label>
                            <input class="form-check-input" type="checkbox" name="teaching" id="filter-subject-teaching" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-subject-miscellaneous"><span class="fas fa-thumbtack fs--1 me-3"></span>Miscellaneous
                            </label>
                            <input class="form-check-input" type="checkbox" name="miscellaneous" id="filter-subject-miscellaneous" />
                          </div>
                        </li>
                      </ul>
                    </div>
                  </li>
                  <li class="border-bottom"><a class="nav-link collapse-indicator-plus fs--2 fw-medium text-600 py-3" data-bs-toggle="collapse" href="#rating-collapse" aria-controls="rating-collapse" aria-expanded="false">Rating</a>
                    <div class="collapse" id="rating-collapse">
                      <ul class="list-unstyled">
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-rating-4.5-&amp;-up"><span class="fas fa-star fs--1 me-3"></span>4.5 &amp; Up
                            </label>
                            <input class="form-check-input" type="radio" name="rating" id="filter-rating-4.5-&amp;-up" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-rating-4.0-&amp;-up"><span class="fas fa-star fs--1 me-3"></span>4.0 &amp; Up
                            </label>
                            <input class="form-check-input" type="radio" name="rating" id="filter-rating-4.0-&amp;-up" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-rating-3.5-&amp;-up"><span class="fas fa-star fs--1 me-3"></span>3.5 &amp; Up
                            </label>
                            <input class="form-check-input" type="radio" name="rating" id="filter-rating-3.5-&amp;-up" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-rating-3.0-&amp;-up"><span class="fas fa-star fs--1 me-3"></span>3.0 &amp; Up
                            </label>
                            <input class="form-check-input" type="radio" name="rating" id="filter-rating-3.0-&amp;-up" />
                          </div>
                        </li>
                      </ul>
                    </div>
                  </li>
                  <li class="border-bottom"><a class="nav-link collapse-indicator-plus fs--2 fw-medium text-600 py-3" data-bs-toggle="collapse" href="#proficiency-collapse" aria-controls="proficiency-collapse" aria-expanded="false">Proficiency</a>
                    <div class="collapse" id="proficiency-collapse">
                      <ul class="list-unstyled">
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-proficiency-beginner"><img class="me-3" src="../../../assets/img/icons/chevron-up.svg" width="13" alt="" />Beginner
                            </label>
                            <input class="form-check-input" type="checkbox" name="beginner" id="filter-proficiency-beginner" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-proficiency-intermediate"><img class="me-3" src="../../../assets/img/icons/double-chevron-up.svg" width="13" alt="" />Intermediate
                            </label>
                            <input class="form-check-input" type="checkbox" name="intermediate" id="filter-proficiency-intermediate" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-proficiency-professional"><img class="me-3" src="../../../assets/img/icons/triple-chevron-up.svg" width="13" alt="" />Professional
                            </label>
                            <input class="form-check-input" type="checkbox" name="professional" id="filter-proficiency-professional" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-proficiency-master"><span class="fas fa-star fs--1 me-3"></span>Master
                            </label>
                            <input class="form-check-input" type="checkbox" name="master" id="filter-proficiency-master" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-proficiency-everyone"><span class="fas fa-users fs--1 me-3"></span>Everyone
                            </label>
                            <input class="form-check-input" type="checkbox" name="everyone" id="filter-proficiency-everyone" />
                          </div>
                        </li>
                      </ul>
                    </div>
                  </li>
                  <li class="border-bottom"><a class="nav-link collapse-indicator-plus fs--2 fw-medium text-600 py-3" data-bs-toggle="collapse" href="#language-collapse" aria-controls="language-collapse" aria-expanded="false">Language</a>
                    <div class="collapse" id="language-collapse">
                      <ul class="list-unstyled">
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-language-english">English
                            </label>
                            <input class="form-check-input" type="checkbox" checked="checked" name="english" id="filter-language-english" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-language-spanish">Spanish
                            </label>
                            <input class="form-check-input" type="checkbox" name="spanish" id="filter-language-spanish" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-language-french">French
                            </label>
                            <input class="form-check-input" type="checkbox" name="french" id="filter-language-french" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-language-german">German
                            </label>
                            <input class="form-check-input" type="checkbox" name="german" id="filter-language-german" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-language-bengali">Bengali
                            </label>
                            <input class="form-check-input" type="checkbox" name="bengali" id="filter-language-bengali" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-language-hindi">Hindi
                            </label>
                            <input class="form-check-input" type="checkbox" name="hindi" id="filter-language-hindi" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-language-arabic">Arabic
                            </label>
                            <input class="form-check-input" type="checkbox" name="arabic" id="filter-language-arabic" />
                          </div>
                        </li>
                      </ul>
                    </div>
                  </li>
                  <li><a class="nav-link collapse-indicator-plus fs--2 fw-medium text-600 py-3" data-bs-toggle="collapse" href="#enrolled-courses-collapse" aria-controls="enrolled-courses-collapse" aria-expanded="false">Enrolled Courses</a>
                    <div class="collapse" id="enrolled-courses-collapse">
                      <ul class="list-unstyled">
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-enrolled-courses-show">Show
                            </label>
                            <input class="form-check-input" type="radio" name="enrolled-courses" id="filter-enrolled-courses-show" />
                          </div>
                        </li>
                        <li>
                          <div class="form-check d-flex ps-0">
                            <label class="form-check-label fs--1 flex-1 text-truncate" for="filter-enrolled-courses-don’t-show">Don’t Show
                            </label>
                            <input class="form-check-input" type="radio" name="enrolled-courses" id="filter-enrolled-courses-don’t-show" />
                          </div>
                        </li>
                      </ul>
                    </div>
                  </li>
                </ul>
              </aside>
            </div>
            <div class="col-xxl-10 col-xl-9">
              <div class="card mb-3">
                <div class="card-header position-relative">
                  <h5 class="mb-0 mt-1">All Courses</h5>
                  <div class="bg-holder d-none d-md-block bg-card" style="background-image:url(../../../assets/img/illustrations/corner-6.png);">
                  </div>
                  <!--/.bg-holder-->

                </div>
                <div class="card-body pt-0 pt-md-3">
                  <div class="row g-3 align-items-center">
                    <div class="col-auto d-xl-none">
                      <button class="btn btn-sm p-0 btn-link position-relative" type="button" data-bs-toggle="offcanvas" data-bs-target="#filterOffcanvas" aria-controls="filterOffcanvas"><span class="fas fa-filter fs-0 text-700"></span></button>
                    </div>
                    <div class="col">
                      <form class="position-relative">
                        <input class="form-control form-control-sm search-input lh-1 rounded-2 ps-4" type="search" placeholder="Search..." aria-label="Search" />
                        <div class="position-absolute top-50 start-0 translate-middle-y ms-2"><span class="fas fa-search text-400 fs--1"></span></div>
                      </form>
                    </div>
                    <div class="col position-sm-relative position-absolute top-0 end-0 me-3 me-sm-0 p-0">
                      <div class="row g-0 g-md-3 justify-content-end">
                        <div class="col-auto">
                          <form class="row gx-2">
                            <div class="col-auto d-none d-lg-block"><small class="fw-semi-bold">Sort by:</small></div>
                            <div class="col-auto">
                              <select class="form-select form-select-sm" aria-label="Bulk actions">
                                <option value="rating">Rating</option>
                                <option value="review">Review</option>
                                <option value="price">Price</option>
                              </select>
                            </div>
                          </form>
                        </div>
                        <div class="col-auto">
                          <div class="d-flex align-items-center"><small class="fw-semi-bold d-none d-lg-block lh-1">View:</small>
                            <div class="d-flex"><a class="btn btn-link btn-sm text-700" href="../../../app/e-learning/course/course-grid.jsp" data-bs-toggle="tooltip" data-bs-placement="top" title="Course Grid"><span class="fas fa-th fs-1" data-fa-transform="down-1"></span></a><a class="btn btn-link btn-sm px-1 text-400 hover-700" href="../../../app/e-learning/course/course-list.jsp" data-bs-toggle="tooltip" data-bs-placement="top" title="Course List"><span class="fas fa-list-ul fs-1" data-fa-transform="down-1"></span></a></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row mb-3 g-3">
                <article class="col-md-6 col-xxl-4">
                  <div class="card h-100 overflow-hidden">
                    <div class="card-body p-0 d-flex flex-column justify-content-between">
                      <div>
                        <div class="hoverbox text-center"><a class="text-decoration-none" href="../../../assets/video/beach.mp4" data-gallery="attachment-bg"><img class="w-100 h-100 object-fit-cover" src="../../../assets/img/elearning/courses/course1.png" alt="" /></a>
                          <div class="hoverbox-content flex-center pe-none bg-holder overlay overlay-2"><img class="z-1" src="../../../assets/img/icons/play.svg" width="60" alt="" /></div>
                        </div>
                        <div class="p-3">
                          <h5 class="fs-0 mb-2"><a class="text-dark" href="../../../app/e-learning/course/course-details.jsp">Script Writing Masterclass: Introdution to Industry Cliches</a></h5>
                          <h5 class="fs-0"><a href="../../../app/e-learning/trainer-profile.jsp">Bill Finger</a></h5>
                        </div>
                      </div>
                      <div class="row g-0 mb-3 align-items-end">
                        <div class="col ps-3">
                          <h4 class="fs-1 text-warning d-flex align-items-center"> <span>$69.50</span>
                            <del class="ms-2 fs--1 text-700">$139.90</del>
                          </h4>
                          <p class="mb-0 fs--1 text-800">92,632 Learners Enrolled</p>
                        </div>
                        <div class="col-auto pe-3"><a class="btn btn-sm btn-falcon-default me-2 hover-danger" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wishlist"><span class="far fa-heart" data-fa-transform="down-2"></span></a><a class="btn btn-sm btn-falcon-default hover-primary" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Cart"><span class="fas fa-cart-plus" data-fa-transform="down-2"></span></a></div>
                      </div>
                    </div>
                  </div>
                </article>
                <article class="col-md-6 col-xxl-4">
                  <div class="card h-100 overflow-hidden">
                    <div class="card-body p-0 d-flex flex-column justify-content-between">
                      <div>
                        <div class="hoverbox text-center"><a class="text-decoration-none" href="../../../assets/video/beach.mp4" data-gallery="attachment-bg"><img class="w-100 h-100 object-fit-cover" src="../../../assets/img/elearning/courses/course2.png" alt="" /></a>
                          <div class="hoverbox-content flex-center pe-none bg-holder overlay overlay-2"><img class="z-1" src="../../../assets/img/icons/play.svg" width="60" alt="" /></div>
                        </div>
                        <div class="p-3">
                          <h5 class="fs-0 mb-2"><a class="text-dark" href="../../../app/e-learning/course/course-details.jsp">Composition in Comics: Easy to Read Between Panels</a></h5>
                          <h5 class="fs-0"><a href="../../../app/e-learning/trainer-profile.jsp">Bill Finger</a></h5>
                        </div>
                      </div>
                      <div class="row g-0 mb-3 align-items-end">
                        <div class="col ps-3">
                          <h4 class="fs-1 text-warning d-flex align-items-center"> <span>$39.99</span>
                            <del class="ms-2 fs--1 text-700">$139.90</del>
                          </h4>
                          <p class="mb-0 fs--1 text-800">92,603 Learners Enrolled</p>
                        </div>
                        <div class="col-auto pe-3"><a class="btn btn-sm btn-falcon-default me-2 hover-danger" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wishlist"><span class="far fa-heart" data-fa-transform="down-2"></span></a><a class="btn btn-sm btn-falcon-default hover-primary" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Cart"><span class="fas fa-cart-plus" data-fa-transform="down-2"></span></a></div>
                      </div>
                    </div>
                  </div>
                </article>
                <article class="col-md-6 col-xxl-4">
                  <div class="card h-100 overflow-hidden">
                    <div class="card-body p-0 d-flex flex-column justify-content-between">
                      <div>
                        <div class="hoverbox text-center"><a class="text-decoration-none" href="../../../assets/video/beach.mp4" data-gallery="attachment-bg"><img class="w-100 h-100 object-fit-cover" src="../../../assets/img/elearning/courses/course3.png" alt="" /></a>
                          <div class="hoverbox-content flex-center pe-none bg-holder overlay overlay-2"><img class="z-1" src="../../../assets/img/icons/play.svg" width="60" alt="" /></div>
                        </div>
                        <div class="p-3">
                          <h5 class="fs-0 mb-2"><a class="text-dark" href="../../../app/e-learning/course/course-details.jsp">Advanced Design Tools for Modern Designs</a></h5>
                          <h5 class="fs-0"><a href="../../../app/e-learning/trainer-profile.jsp">Bill Finger</a></h5>
                        </div>
                      </div>
                      <div class="row g-0 mb-3 align-items-end">
                        <div class="col ps-3">
                          <h4 class="fs-1 text-warning d-flex align-items-center"> <span>$69.50</span>
                            <del class="ms-2 fs--1 text-700">$139.90</del>
                          </h4>
                          <p class="mb-0 fs--1 text-800">11,000 Learners Enrolled</p>
                        </div>
                        <div class="col-auto pe-3"><a class="btn btn-sm btn-falcon-default me-2" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Remove from wishlist"><span class="fas fa-heart text-danger" data-fa-transform="down-2"></span></a><a class="btn btn-sm btn-falcon-default hover-primary" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Cart"><span class="fas fa-cart-plus" data-fa-transform="down-2"></span></a></div>
                      </div>
                    </div>
                  </div>
                </article>
                <article class="col-md-6 col-xxl-4">
                  <div class="card h-100 overflow-hidden">
                    <div class="card-body p-0 d-flex flex-column justify-content-between">
                      <div>
                        <div class="hoverbox text-center"><a class="text-decoration-none" href="../../../assets/video/beach.mp4" data-gallery="attachment-bg"><img class="w-100 h-100 object-fit-cover" src="../../../assets/img/elearning/courses/course4.png" alt="" /></a>
                          <div class="hoverbox-content flex-center pe-none bg-holder overlay overlay-2"><img class="z-1" src="../../../assets/img/icons/play.svg" width="60" alt="" /></div>
                        </div>
                        <div class="p-3">
                          <h5 class="fs-0 mb-2"><a class="text-dark" href="../../../app/e-learning/course/course-details.jsp">Comic Page Layout: Analysing The Classics</a></h5>
                          <h5 class="fs-0"><a href="../../../app/e-learning/trainer-profile.jsp">Bill Finger</a></h5>
                        </div>
                      </div>
                      <div class="row g-0 mb-3 align-items-end">
                        <div class="col ps-3">
                          <h4 class="fs-1 text-warning d-flex align-items-center"> <span>$49.50</span>
                            <del class="ms-2 fs--1 text-700">$139.90</del>
                          </h4>
                          <p class="mb-0 fs--1 text-800">32,106 Learners Enrolled</p>
                        </div>
                        <div class="col-auto pe-3"><a class="btn btn-sm btn-falcon-default me-2 hover-danger" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wishlist"><span class="far fa-heart" data-fa-transform="down-2"></span></a><a class="btn btn-sm btn-primary" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Remove from Cart"><span class="fas fa-shopping-cart" data-fa-transform="down-2"></span></a></div>
                      </div>
                    </div>
                  </div>
                </article>
                <article class="col-md-6 col-xxl-4">
                  <div class="card h-100 overflow-hidden">
                    <div class="card-body p-0 d-flex flex-column justify-content-between">
                      <div>
                        <div class="hoverbox text-center"><a class="text-decoration-none" href="../../../assets/video/beach.mp4" data-gallery="attachment-bg"><img class="w-100 h-100 object-fit-cover" src="../../../assets/img/elearning/courses/course5.png" alt="" /></a>
                          <div class="hoverbox-content flex-center pe-none bg-holder overlay overlay-2"><img class="z-1" src="../../../assets/img/icons/play.svg" width="60" alt="" /></div>
                        </div>
                        <div class="p-3">
                          <h5 class="fs-0 mb-2"><a class="text-dark" href="../../../app/e-learning/course/course-details.jsp">Abstract Painting: Zero to Mastery in Traditional Medium</a></h5>
                          <h5 class="fs-0"><a href="../../../app/e-learning/trainer-profile.jsp">J. H. Williams III</a></h5>
                        </div>
                      </div>
                      <div class="row g-0 mb-3 align-items-end">
                        <div class="col ps-3">
                          <h4 class="fs-1 text-warning d-flex align-items-center"> <span>$69.50</span>
                            <del class="ms-2 fs--1 text-700">$139.90</del>
                          </h4>
                          <p class="mb-0 fs--1 text-800">2,304 Learners Enrolled</p>
                        </div>
                        <div class="col-auto pe-3"><a class="btn btn-sm btn-falcon-default me-2 hover-danger" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wishlist"><span class="far fa-heart" data-fa-transform="down-2"></span></a><a class="btn btn-sm btn-falcon-default hover-primary" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Cart"><span class="fas fa-cart-plus" data-fa-transform="down-2"></span></a></div>
                      </div>
                    </div>
                  </div>
                </article>
                <article class="col-md-6 col-xxl-4">
                  <div class="card h-100 overflow-hidden">
                    <div class="card-body p-0 d-flex flex-column justify-content-between">
                      <div>
                        <div class="hoverbox text-center"><a class="text-decoration-none" href="../../../assets/video/beach.mp4" data-gallery="attachment-bg"><img class="w-100 h-100 object-fit-cover" src="../../../assets/img/elearning/courses/course6.png" alt="" /></a>
                          <div class="hoverbox-content flex-center pe-none bg-holder overlay overlay-2"><img class="z-1" src="../../../assets/img/icons/play.svg" width="60" alt="" /></div>
                        </div>
                        <div class="p-3">
                          <h5 class="fs-0 mb-2"><a class="text-dark" href="../../../app/e-learning/course/course-details.jsp">Inking: Choosing Between Analog vs Digital</a></h5>
                          <h5 class="fs-0"><a href="../../../app/e-learning/trainer-profile.jsp">Bill Finger</a></h5>
                        </div>
                      </div>
                      <div class="row g-0 mb-3 align-items-end">
                        <div class="col ps-3">
                          <h4 class="fs-1 text-warning d-flex align-items-center"> <span>$39.99</span>
                            <del class="ms-2 fs--1 text-700">$139.90</del>
                          </h4>
                          <p class="mb-0 fs--1 text-800">9,312 Learners Enrolled</p>
                        </div>
                        <div class="col-auto pe-3"><a class="btn btn-sm btn-falcon-default me-2 hover-danger" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wishlist"><span class="far fa-heart" data-fa-transform="down-2"></span></a><a class="btn btn-sm btn-falcon-default hover-primary" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Cart"><span class="fas fa-cart-plus" data-fa-transform="down-2"></span></a></div>
                      </div>
                    </div>
                  </div>
                </article>
                <article class="col-md-6 col-xxl-4">
                  <div class="card h-100 overflow-hidden">
                    <div class="card-body p-0 d-flex flex-column justify-content-between">
                      <div>
                        <div class="hoverbox text-center"><a class="text-decoration-none" href="../../../assets/video/beach.mp4" data-gallery="attachment-bg"><img class="w-100 h-100 object-fit-cover" src="../../../assets/img/elearning/courses/course7.png" alt="" /></a>
                          <div class="hoverbox-content flex-center pe-none bg-holder overlay overlay-2"><img class="z-1" src="../../../assets/img/icons/play.svg" width="60" alt="" /></div>
                        </div>
                        <div class="p-3">
                          <h5 class="fs-0 mb-2"><a class="text-dark" href="../../../app/e-learning/course/course-details.jsp">Character Design Masterclass: Your First Supervillain</a></h5>
                          <h5 class="fs-0"><a href="../../../app/e-learning/trainer-profile.jsp">Bill Finger</a></h5>
                        </div>
                      </div>
                      <div class="row g-0 mb-3 align-items-end">
                        <div class="col ps-3">
                          <h4 class="fs-1 text-warning d-flex align-items-center"> <span>$99.90</span>
                            <del class="ms-2 fs--1 text-700">$139.90</del>
                          </h4>
                          <p class="mb-0 fs--1 text-800">292,603 Learners Enrolled</p>
                        </div>
                        <div class="col-auto pe-3"><a class="btn btn-sm btn-falcon-default me-2 hover-danger" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wishlist"><span class="far fa-heart" data-fa-transform="down-2"></span></a><a class="btn btn-sm btn-falcon-default hover-primary" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Cart"><span class="fas fa-cart-plus" data-fa-transform="down-2"></span></a></div>
                      </div>
                    </div>
                  </div>
                </article>
                <article class="col-md-6 col-xxl-4">
                  <div class="card h-100 overflow-hidden">
                    <div class="card-body p-0 d-flex flex-column justify-content-between">
                      <div>
                        <div class="hoverbox text-center"><a class="text-decoration-none" href="../../../assets/video/beach.mp4" data-gallery="attachment-bg"><img class="w-100 h-100 object-fit-cover" src="../../../assets/img/elearning/courses/course8.png" alt="" /></a>
                          <div class="hoverbox-content flex-center pe-none bg-holder overlay overlay-2"><img class="z-1" src="../../../assets/img/icons/play.svg" width="60" alt="" /></div>
                        </div>
                        <div class="p-3">
                          <h5 class="fs-0 mb-2"><a class="text-dark" href="../../../app/e-learning/course/course-details.jsp">Character Design Masterclass: Your First Superhero</a></h5>
                          <h5 class="fs-0"><a href="../../../app/e-learning/trainer-profile.jsp">Bill Finger</a></h5>
                        </div>
                      </div>
                      <div class="row g-0 mb-3 align-items-end">
                        <div class="col ps-3">
                          <h4 class="fs-1 text-warning d-flex align-items-center"> <span>$69.99</span>
                            <del class="ms-2 fs--1 text-700">$139.90</del>
                          </h4>
                          <p class="mb-0 fs--1 text-800">90,304 Learners Enrolled</p>
                        </div>
                        <div class="col-auto pe-3"><a class="btn btn-sm btn-falcon-default me-2 hover-danger" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wishlist"><span class="far fa-heart" data-fa-transform="down-2"></span></a><a class="btn btn-sm btn-falcon-default hover-primary" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Cart"><span class="fas fa-cart-plus" data-fa-transform="down-2"></span></a></div>
                      </div>
                    </div>
                  </div>
                </article>
                <article class="col-md-6 col-xxl-4">
                  <div class="card h-100 overflow-hidden">
                    <div class="card-body p-0 d-flex flex-column justify-content-between">
                      <div>
                        <div class="hoverbox text-center"><a class="text-decoration-none" href="../../../assets/video/beach.mp4" data-gallery="attachment-bg"><img class="w-100 h-100 object-fit-cover" src="../../../assets/img/elearning/courses/course9.png" alt="" /></a>
                          <div class="hoverbox-content flex-center pe-none bg-holder overlay overlay-2"><img class="z-1" src="../../../assets/img/icons/play.svg" width="60" alt="" /></div>
                        </div>
                        <div class="p-3">
                          <h5 class="fs-0 mb-2"><a class="text-dark" href="../../../app/e-learning/course/course-details.jsp">Character Design Masterclass: Your First Sidekick</a></h5>
                          <h5 class="fs-0"><a href="../../../app/e-learning/trainer-profile.jsp">Bill Finger</a></h5>
                        </div>
                      </div>
                      <div class="row g-0 mb-3 align-items-end">
                        <div class="col ps-3">
                          <h4 class="fs-1 text-warning d-flex align-items-center"> <span>$69.99</span>
                            <del class="ms-2 fs--1 text-700">$139.90</del>
                          </h4>
                          <p class="mb-0 fs--1 text-800">66,304 Learners Enrolled</p>
                        </div>
                        <div class="col-auto pe-3"><a class="btn btn-sm btn-falcon-default me-2 hover-danger" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Wishlist"><span class="far fa-heart" data-fa-transform="down-2"></span></a><a class="btn btn-sm btn-falcon-default hover-primary" href="#!" data-bs-toggle="tooltip" data-bs-placement="top" title="Add to Cart"><span class="fas fa-cart-plus" data-fa-transform="down-2"></span></a></div>
                      </div>
                    </div>
                  </div>
                </article>
              </div>
              <div class="card">
                <div class="card-body">
                  <div class="row g-3 flex-center justify-content-md-between">
                    <div class="col-auto">
                      <form class="row gx-2">
                        <div class="col-auto"><small>Show:</small></div>
                        <div class="col-auto">
                          <select class="form-select form-select-sm" aria-label="Show courses">
                            <option selected="selected" value="9">9</option>
                            <option value="20">20</option>
                            <option value="50">50</option>
                          </select>
                        </div>
                      </form>
                    </div>
                    <div class="col-auto">
                      <button class="btn btn-falcon-default btn-sm me-2" type="button" disabled="disabled" data-bs-toggle="tooltip" data-bs-placement="top" title="Prev"><span class="fas fa-chevron-left"></span></button><a class="btn btn-sm btn-falcon-default text-primary me-2" href="#!">1</a><a class="btn btn-sm btn-falcon-default me-2" href="#!">2</a><a class="btn btn-sm btn-falcon-default me-2" href="#!">3</a><a class="btn btn-sm btn-falcon-default me-2" href="#!"> <span class="fas fa-ellipsis-h"></span></a><a class="btn btn-sm btn-falcon-default me-2" href="#!">303</a>
                      <button class="btn btn-falcon-default btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Next"><span class="fas fa-chevron-right">  </span></button>
                    </div>
                  </div>
                </div>
              </div>
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
              <label class="btn d-inline-block btn-navbar-style fs--1" for="themeSwitcherLight"> <span class="hover-overlay mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0" src="../../../assets/img/generic/falcon-mode-default.jpg" alt=""/></span><span class="label-text">Light</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="themeSwitcherDark" name="theme-color" type="radio" value="dark" data-theme-control="theme" />
              <label class="btn d-inline-block btn-navbar-style fs--1" for="themeSwitcherDark"> <span class="hover-overlay mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0" src="../../../assets/img/generic/falcon-mode-dark.jpg" alt=""/></span><span class="label-text"> Dark</span></label>
            </div>
          </div>
        </div>
        <hr />
        <div class="d-flex justify-content-between">
          <div class="d-flex align-items-start"><img class="me-2" src="../../../assets/img/icons/left-arrow-from-left.svg" width="20" alt="" />
            <div class="flex-1">
              <h5 class="fs-0">RTL Mode</h5>
              <p class="fs--1 mb-0">Switch your language direction </p><a class="fs--1" href="../../../documentation/customization/configuration.jsp">RTL Documentation</a>
            </div>
          </div>
          <div class="form-check form-switch">
            <input class="form-check-input ms-0" id="mode-rtl" type="checkbox" data-theme-control="isRTL" />
          </div>
        </div>
        <hr />
        <div class="d-flex justify-content-between">
          <div class="d-flex align-items-start"><img class="me-2" src="../../../assets/img/icons/arrows-h.svg" width="20" alt="" />
            <div class="flex-1">
              <h5 class="fs-0">Fluid Layout</h5>
              <p class="fs--1 mb-0">Toggle container layout system </p><a class="fs--1" href="../../../documentation/customization/configuration.jsp">Fluid Documentation</a>
            </div>
          </div>
          <div class="form-check form-switch">
            <input class="form-check-input ms-0" id="mode-fluid" type="checkbox" data-theme-control="isFluid" />
          </div>
        </div>
        <hr />
        <div class="d-flex align-items-start"><img class="me-2" src="../../../assets/img/icons/paragraph.svg" width="20" alt="" />
          <div class="flex-1">
            <h5 class="fs-0 d-flex align-items-center">Navigation Position</h5>
            <p class="fs--1 mb-2">Select a suitable navigation system for your web application </p>
            <div>
              <select class="form-select form-select-sm" aria-label="Navbar position" data-theme-control="navbarPosition">
                <option value="vertical" data-page-url="../../../modules/components/navs-and-tabs/vertical-navbar.jsp">Vertical</option>
                <option value="top" data-page-url="../../../modules/components/navs-and-tabs/top-navbar.jsp">Top</option>
                <option value="combo" data-page-url="../../../modules/components/navs-and-tabs/combo-navbar.jsp">Combo</option>
                <option value="double-top" data-page-url="../../../modules/components/navs-and-tabs/double-top-navbar.jsp">Double Top</option>
              </select>
            </div>
          </div>
        </div>
        <hr />
        <h5 class="fs-0 d-flex align-items-center">Vertical Navbar Style</h5>
        <p class="fs--1 mb-0">Switch between styles for your vertical navbar </p>
        <p> <a class="fs--1" href="../../../modules/components/navs-and-tabs/vertical-navbar.jsp#navbar-styles">See Documentation</a></p>
        <div class="btn-group d-block w-100 btn-group-navbar-style">
          <div class="row gx-2">
            <div class="col-6">
              <input class="btn-check" id="navbar-style-transparent" type="radio" name="navbarStyle" value="transparent" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-transparent"> <img class="img-fluid img-prototype" src="../../../assets/img/generic/default.png" alt="" /><span class="label-text"> Transparent</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="navbar-style-inverted" type="radio" name="navbarStyle" value="inverted" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-inverted"> <img class="img-fluid img-prototype" src="../../../assets/img/generic/inverted.png" alt="" /><span class="label-text"> Inverted</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="navbar-style-card" type="radio" name="navbarStyle" value="card" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-card"> <img class="img-fluid img-prototype" src="../../../assets/img/generic/card.png" alt="" /><span class="label-text"> Card</span></label>
            </div>
            <div class="col-6">
              <input class="btn-check" id="navbar-style-vibrant" type="radio" name="navbarStyle" value="vibrant" data-theme-control="navbarStyle" />
              <label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-vibrant"> <img class="img-fluid img-prototype" src="../../../assets/img/generic/vibrant.png" alt="" /><span class="label-text"> Vibrant</span></label>
            </div>
          </div>
        </div>
        <div class="text-center mt-5"><img class="mb-4" src="../../../assets/img/icons/spot-illustrations/47.png" alt="" width="120" />
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
    <script src="../../../vendors/popper/popper.min.js"></script>
    <script src="../../../vendors/bootstrap/bootstrap.min.js"></script>
    <script src="../../../vendors/anchorjs/anchor.min.js"></script>
    <script src="../../../vendors/is/is.min.js"></script>
    <script src="../../../vendors/swiper/swiper-bundle.min.js"></script>
    <script src="../../../vendors/glightbox/glightbox.min.js"> </script>
    <script src="../../../vendors/fontawesome/all.min.js"></script>
    <script src="../../../vendors/lodash/lodash.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="../../../vendors/list.js/list.min.js"></script>
    <script src="../../../assets/js/theme.js"></script>

  </body>

</html>