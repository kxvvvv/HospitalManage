<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pojo.Patient" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Medicio | Bootstrap Medical Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Google fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:700,800&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400&amp;display=swap">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
  </head>
  <body>
    <!-- navbar-->
    <header class="header">
      <!-- Primary Navbar-->
      <nav class="navbar navbar-expand-lg navbar-light py-4 border-bottom border-gray bg-white">
        <div class="container d-flex align-items-center justify-content-between"><a class="navbar-brand" href="index.html"><img src="img/logo.svg" alt="" width="100"></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
          <ul class="list-inline mb-0 d-none d-lg-block">
            <li class="list-inline-item me-3">
              <div class="d-flex"><i class="far fa-clock h4 text-muted"></i>
                <div class="ms-2">
                  <h6 class="text-muted text-uppercase mb-0 text-sm">周一至周六: 09:00AM - 20:00PM  </h6>
                  <p class="small text-gray mb-0">Sunday - CLOSED</p>
                </div>
              </div>
            </li>
            <li class="list-inline-item">
              <div class="d-flex"><i class="fas fa-headphones-alt h4 text-muted"></i>
                <div class="ms-2">
                  <h6 class="text-muted text-uppercase mb-0 text-sm">+ 0110 4566 1421</h6>
                  <p class="small text-gray mb-0">联系我们</p>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </nav>
      <!-- Secondary Navbar                -->
      <nav class="navbar navbar-expand-lg navbar-light py-0 shadow-sm bg-white">
        <div class="container">
          <div class="collapse navbar-collapse py-3 py-lg-0" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto">
              <li class="nav-item">
                    <!-- Link--><a class="nav-link text-uppercase letter-spacing-0" href="index.html">主页</a>
              </li>
              <li class="nav-item">
                    <!-- Link--><a class="nav-link text-uppercase letter-spacing-0" href="about.html">关于我们</a>
              </li>
              <li class="nav-item">
                    <!-- Link--><a class="nav-link text-uppercase letter-spacing-0 active" href="contact.html">联系我们</a>
              </li>
              <li class="nav-item dropdown"><a class="nav-link text-uppercase letter-spacing-0 dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">更多</a>
                <div class="dropdown-menu border-0 border-top border-2 border-primary shadow-sm mt-0" aria-labelledby="navbarDropdown"><a class="dropdown-item" href="#!">Action</a><a class="dropdown-item" href="#!">Another action</a><a class="dropdown-item" href="#!">Something else here</a></div>
              </li>
            </ul>
            <ul class="navbar-nav ms-auto">
              <li class="nav-item"><a class="nav-link px-4 d-inline-block" id="searchToggler" href="#"><i class="fas fa-search text-muted"></i><i class="fas fa-times text-muted d-none"></i></a></li>
              <li class="nav-item"><a class="nav-link text-uppercase letter-spacing-0 border-start px-4 bg-primary text-white d-inline-block" href="contact.html">挂号</a></li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="p-3 shadow-sm index-forward border-top" id="search">
        <div class="container">
          <form action="#">
            <div class="input-group">
              <input class="form-control" type="search" placeholder="What're you looking for...">
              <button class="btn btn-primary" type="submit"> <i class="fas fa-search me-2"></i>Search</button>
            </div>
          </form>
        </div>
      </div>
    </header>
    <!-- Hero Banner-->
    <section class="hero bg-cover bg-top" style="background: url(img/contact-banner.jpg)">
      <div class="container z-index-20 mt-lg-5">
        <div class="row align-items-lg-center gy-4">
          <div class="col-lg-7 order-2 order-lg-1">
            <h1 class="text-uppercase text-white">Contact <span class="text-primary">Us</span></h1>
            <p class="lead text-white mb-0">Provide best quality healthcare for youv</p>
          </div>
          <div class="col-lg-5 order-1 order-lg-2 text-lg-end">
            <!-- Breadcrumb-->
            <nav class="d-inline-block" aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html"> <i class="fa fa-home me-2"></i>Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Contact us</li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section>
    <section class="p-0">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 text-center">
            <div class="p-5 my-lg-5"><i class="fas fa-3x mb-4 fa-map-marked-alt text-primary"></i>
              <h3 class="h5 text-uppercase mb-4">Location</h3>
              <p class="text-muted">22 Baker Street,London, United Kingdom, W1U 3BW</p>
            </div>
          </div>
          <div class="col-lg-4 text-center bg-primary text-white">
            <div class="p-5 my-lg-5"><i class="fas fa-3x mb-4 fa-first-aid"></i>
              <h3 class="h5 text-uppercase mb-4">Emergency Case</h3>
              <p class="fw-bold">+0800 2466 7921</p>
            </div>
          </div>
          <div class="col-lg-4 text-center">
            <div class="p-5 my-lg-5"><i class="fas fa-3x mb-4 fa-envelope text-primary"></i>
              <h3 class="h5 text-uppercase mb-4">Email</h3>
              <p class="text-muted">info@yourdomain.com</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Make Appointment Section-->
    <section class="bg-light">
      <div class="container">
        <div class="row align-items-center gy-5">
          <div class="col-lg-7">
            <div class="card border-0 shadow-sm">
              <div class="card-body p-5 border-top border-primary border-2">
                <h2 class="lined">Make an <span class="text-primary">Appointment</span></h2>
                <p class="text-muted mb-4">Nulla tristique ipsum in quam. Integer ac elit. Duis turpis faucibus non</p>
                <form class="make-appointment-form" action="/registered" method="post">
                  <div class="row gy-4">
                    <%

                      String patientName =(session.getAttribute("patName")==null)? "":(String) session.getAttribute("patName");
                    %>
                    <div class="col-lg-6">
                      <input class="form-control" type="text" name="firstName"
                             placeholder="姓名" value="<%= patientName %>">
                    </div>

                    <%
                      String patientId = (session.getAttribute("patId")==null)? "":(String) session.getAttribute("patId");
                    %>
                    <div class="col-lg-6">
                      <input class="form-control" type="text" name="lastName" placeholder="身份证号" value="<%= patientId%>">
                    </div>

                    <%
                      String patientPhone = (session.getAttribute("patPhone")==null)? "":(String) session.getAttribute("patPhone");

                    %>
                    <div class="col-lg-6">
                      <input class="form-control" type="tel" name="phone" placeholder="手机号" value="<%= patientPhone%>">
                    </div>

                    <div class="col-lg-6">
                      <input class="form-control" type="text" name="date" id="datePicker" placeholder="预约日期">
                    </div>

                    <script>
                      $(document).ready(function(){
                        var dateInput = $('#datePicker');
                        dateInput.datepicker({
                          todayBtn: "linked",
                          autoclose: true,
                          todayHighlight: true
                        }).on('changeDate', function() {
                          dateInput.datepicker('hide');
                        });
                      });
                    </script>
                    <div class="col-lg-6">
                      <select class="form-select" name="timeframe">
                        <option value=0>上午</option>
                        <option value=1>下午</option>
                      </select>
                    </div>
                    <div class="col-lg-6">
                      <select id="RegisteredDoctor" class="form-select" name="RegisteredDoctor">
                        <!-- 选项将通过AJAX动态插入 -->
                      </select>
                    </div>

                    <script>
                      $(document).ready(function() {
                        try {
                          $.ajax({
                            url: '/showData', // 你的Servlet URL
                            type: 'GET',
                            dataType: 'json',
                            success: function(doctors) {
                              // 清空select元素
                              $('#RegisteredDoctor').empty();
                              // 遍历医生数据并添加到select元素
                              $.each(doctors, function(index, doctor) {
                                $('#RegisteredDoctor').append(
                                        $('<option></option>').val(doctor.id).text(doctor.name)
                                );
                              });
                            },
                            error: function() {
                              alert('Error loading doctors information');
                            }
                          });
                        } catch (error) {
                          console.error('AJAX请求异常:', error);
                        }
                      });
                    </script>
                    <div class="col-lg-12">
                      <textarea class="form-control" name="sepcialRequest" rows="5" placeholder="Special Request"></textarea>
                    </div>
                    <div class="col-lg-12">
                      <button class="btn btn-primary w-100" type="submit">Submit your request</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <div class="col-lg-5">
            <ul class="list-unstyled">
              <li class="d-flex align-items-center pb-4">
                <div class="p-1 bg-primary text-white rounded-circle">
                  <div class="p-4 border border-2 border-white rounded-circle"><i class="fas fa-2x fa-microscope"></i></div>
                </div>
                <div class="ms-3">
                  <h3 class="h5">Leading Technologies</h3>
                  <p class="text-muted text-sm mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </div>
              </li>
              <li class="d-flex align-items-center pb-4">
                <div class="p-1 bg-primary text-white rounded-circle">
                  <div class="p-4 border border-2 border-white rounded-circle"><i class="fas fa-2x fa-heartbeat"></i></div>
                </div>
                <div class="ms-3">
                  <h3 class="h5">Care and Relief</h3>
                  <p class="text-muted text-sm mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </div>
              </li>
              <li class="d-flex align-items-center pb-4">
                <div class="p-1 bg-primary text-white rounded-circle">
                  <div class="p-4 border border-2 border-white rounded-circle"><i class="fas fa-2x fa-pills"></i></div>
                </div>
                <div class="ms-3">
                  <h3 class="h5">Cost Effective</h3>
                  <p class="text-muted text-sm mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </div>
              </li>
              <li class="d-flex align-items-center pb-4">
                <div class="p-1 bg-primary text-white rounded-circle">
                  <div class="p-4 border border-2 border-white rounded-circle"><i class="fas fa-2x fa-history"></i></div>
                </div>
                <div class="ms-3">
                  <h3 class="h5">24/7 Availability</h3>
                  <p class="text-muted text-sm mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <!-- Make Appointment Section-->
    
    <footer class="footer pt-5">
      <div class="container pt-5">
        <div class="row gy-4">
          <div class="col-lg-3">
            <h2 class="h5 lined text-white mb-4">About</h2>
            <p class="text-muted text-sm">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
            <p class="text-muted text-sm">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.</p>
            <ul class="list-inline mb-0">
              <li class="list-inline-item"><a class="social-link" href="#!"><i class="fab fa-facebook-f"></i></a></li>
              <li class="list-inline-item"><a class="social-link" href="#!"><i class="fab fa-twitter"></i></a></li>
              <li class="list-inline-item"><a class="social-link" href="#!"><i class="fab fa-google-plus"></i></a></li>
              <li class="list-inline-item"><a class="social-link" href="#!"><i class="fab fa-instagram"></i></a></li>
            </ul>
          </div>
          <div class="col-lg-5">
            <h2 class="h5 text-white lined mb-4">Quick Links</h2>
            <div class="d-flex">
              <ul class="list-unstyled d-inline-block me-4 mb-0">
                <li class="mb-2"><a class="footer-link" href="#!">Make appointments</a></li>
                <li class="mb-2"><a class="footer-link" href="#!">Doctors team</a></li>
                <li class="mb-2"><a class="footer-link" href="#!">Departments services</a></li>
                <li class="mb-2"><a class="footer-link" href="#!">About our clinic</a></li>
                <li class="mb-2"><a class="footer-link" href="#!">Contact us</a></li>
              </ul>
              <ul class="list-unstyled d-inline-block mb-0">
                <li class="mb-2"><a class="footer-link" href="index.html">Home </a></li>
                <li class="mb-2"><a class="footer-link" href="about.html">About us </a></li>
                <li class="mb-2"><a class="footer-link" href="contact.html">Contact us </a></li>
                <li class="mb-2"><a class="footer-link" href="#">About our clinic </a></li>
                <li class="mb-2"><a class="footer-link" href="#">Contact us </a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-4">
            <h2 class="h5 text-white lined mb-4">Newsletter</h2>
            <p class="text-muted text-sm">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.</p>
            <div class="input-group mb-3">
              <input class="form-control text-muted bg-none border-primary" type="text" placeholder="Email address" aria-label="Recipient's username" aria-describedby="button-addon2">
              <button class="btn btn-primary" id="button-addon2" type="button"><i class="fas fa-paper-plane"></i></button>
            </div>
          </div>
        </div>
      </div>
      <div class="copyrights">       
        <div class="container text-center py-4">
          <p class="mb-0 text-muted text-sm">&copy;, Your company. <a target="_blank" href="http://www.mobanwang.com/" title="网页模板">网页模板</a>.</p>
        </div>
      </div>
    </footer>
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="js/front.js"></script>
    <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  </body>
</html>