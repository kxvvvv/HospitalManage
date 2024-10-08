<%--
  Created by IntelliJ IDEA.
  User: justaway
  Date: 2024/7/14
  Time: 4:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pojo.Patient" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Eternity | 关于我们</title>
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
</head>
<body>
<!-- navbar-->
<header class="header">
    <!-- Primary Navbar-->
    <nav class="navbar navbar-expand-lg navbar-light py-4 border-bottom border-gray bg-white">
        <div class="container d-flex align-items-center justify-content-between"><a class="navbar-brand" href="index.jsp"><img src="img/logo.svg" alt="" width="100"></a>
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
                        <!-- Link--><a class="nav-link text-uppercase letter-spacing-0" href="index.jsp">主页</a>
                    </li>
                    <li class="nav-item">
                        <!-- Link--><a class="nav-link text-uppercase letter-spacing-0 active" href="about.jsp">关于我们</a>
                    </li>
                    <li class="nav-item">
                        <!-- Link--><a class="nav-link text-uppercase letter-spacing-0" href="contact.jsp">联系我们</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link text-uppercase letter-spacing-0 dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">更多</a>
                        <div class="dropdown-menu border-0 border-top border-2 border-primary shadow-sm mt-0" aria-labelledby="navbarDropdown">
                            <c:if test="${sessionScope.role == -1 or sessionScope.role == null}">
                                <a class="dropdown-item" href="login.jsp">登录</a>
                            </c:if>
                            <c:if test="${sessionScope.role != -1 and sessionScope.role != null}">
                                <a class="dropdown-item" href="login.jsp">切换账号</a>
                            </c:if>
                            <c:if test="${sessionScope.role == 1}">
                                <%--                                医生--%>
                                <a class="dropdown-item" href="treatment.jsp">诊断</a>
                            </c:if>
                            <c:if test="${sessionScope.role == 0}">
                                <%--                                管理员--%>
                                <a class="dropdown-item" href="showdrug.jsp">药品管理</a>
                            </c:if>
                            <c:if test="${sessionScope.role == 0}">
                                <%--                                管理员--%>
                                <a class="dropdown-item" href="showdoctor.jsp">医生管理</a>
                            </c:if>
                            <c:if test="${sessionScope.role != 1}">
                                <%--                                管理员--%>
                                <a class="dropdown-item" href="drug.jsp">药品信息</a>
                            </c:if>

                            <a class="dropdown-item" href="#!">Something else here</a>

                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link px-4 d-inline-block" id="searchToggler" href="#"><i class="fas fa-search text-muted"></i><i class="fas fa-times text-muted d-none"></i></a></li>
                    <li class="nav-item"><a class="nav-link text-uppercase letter-spacing-0 border-start px-4 bg-primary text-white d-inline-block" href="contact.jsp">挂号</a></li>
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
<section class="hero bg-cover bg-top" style="background: url(img/about-banner.jpg)">
    <div class="container z-index-20 mt-lg-5">
        <div class="row align-items-lg-center gy-4">
            <div class="col-lg-7 order-2 order-lg-1">
                <h1 class="text-uppercase text-white">About <span class="text-primary">Us</span></h1>
                <p class="lead text-white mb-0">Provide best quality healthcare for you</p>
            </div>
            <div class="col-lg-5 order-1 order-lg-2 text-lg-end">
                <!-- Breadcrumb-->
                <nav class="d-inline-block" aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp"> <i class="fa fa-home me-2"></i>Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">About us</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- About Section-->
<section class="about">
    <div class="container">
        <div class="row gy-5">
            <div class="col-lg-4">
                <div class="p-2 shadow"><img class="img-fluid" src="img/about.jpg" alt=""></div>
            </div>
            <div class="col-lg-8">
                <p class="text-muted h6 text-primary text-uppercase mb-0">What we do</p>
                <h2 class="my-3">A Great Place to Work. A Great Place to Receive Care. Leading Medicine.</h2>
                <p class="text-muted lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
                <h2 class="h5">Medicenter Immediate Care</h2>
                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
                <div class="p-2 bg-primary">
                    <div class="border border-white border-2 p-lg-5 p-4 d-flex align-items-center"><i class="fas fa-hospital fa-3x text-white"></i>
                        <div class="ps-3">
                            <h4 class="text-white mb-1">Care and Relief</h4>
                            <p class="text-white mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Service Section-->
<section class="services bg-light">
    <div class="container text-center">
        <h2 class="text-uppercase lined lined-center">Our  <span class="text-primary">Services</span></h2>
        <p class="text-muted mb-5">Lorem ipsum dolor sit amet, consectetuer. Proin gravida nibh vel velit auctor aliquetenean.</p>
        <div class="row gy-4">
            <div class="col-xl-4 col-md-6">
                <!-- Services Item-->
                <div class="card services-item border-0">
                    <div class="card-body border-top border-2 border-primary py-5 px-4 shadow-sm">
                        <h2 class="h6 mb-0 services-item-heading">Qualified Facilities</h2>
                        <div class="services-icon my-4"><i class="fas fa-procedures fa-2x"></i></div>
                        <p class="services-item-text text-sm mb-0">Consider may dwelling old him her surprise finished families graceful. Gave led past poor met fine was new.</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-md-6">
                <!-- Services Item-->
                <div class="card services-item border-0">
                    <div class="card-body border-top border-2 border-primary py-5 px-4 shadow-sm">
                        <h2 class="h6 mb-0 services-item-heading">Top Level Doctors</h2>
                        <div class="services-icon my-4"><i class="fas fa-user-md fa-2x"></i></div>
                        <p class="services-item-text text-sm mb-0">Consider may dwelling old him her surprise finished families graceful. Gave led past poor met fine was new.</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-md-6">
                <!-- Services Item-->
                <div class="card services-item border-0">
                    <div class="card-body border-top border-2 border-primary py-5 px-4 shadow-sm">
                        <h2 class="h6 mb-0 services-item-heading">Dedicated Patient Care</h2>
                        <div class="services-icon my-4"><i class="fas fa-notes-medical fa-2x"></i></div>
                        <p class="services-item-text text-sm mb-0">Consider may dwelling old him her surprise finished families graceful. Gave led past poor met fine was new.</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-md-6">
                <!-- Services Item-->
                <div class="card services-item border-0">
                    <div class="card-body border-top border-2 border-primary py-5 px-4 shadow-sm">
                        <h2 class="h6 mb-0 services-item-heading">24/7 Emergency</h2>
                        <div class="services-icon my-4"><i class="fas fa-ambulance fa-2x"></i></div>
                        <p class="services-item-text text-sm mb-0">Consider may dwelling old him her surprise finished families graceful. Gave led past poor met fine was new.</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-md-6">
                <!-- Services Item-->
                <div class="card services-item border-0">
                    <div class="card-body border-top border-2 border-primary py-5 px-4 shadow-sm">
                        <h2 class="h6 mb-0 services-item-heading">Qualified Facilities</h2>
                        <div class="services-icon my-4"><i class="fas fa-procedures fa-2x"></i></div>
                        <p class="services-item-text text-sm mb-0">Consider may dwelling old him her surprise finished families graceful. Gave led past poor met fine was new.</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-md-6">
                <!-- Services Item-->
                <div class="card services-item border-0">
                    <div class="card-body border-top border-2 border-primary py-5 px-4 shadow-sm">
                        <h2 class="h6 mb-0 services-item-heading">Top Level Doctors</h2>
                        <div class="services-icon my-4"><i class="fas fa-user-md fa-2x"></i></div>
                        <p class="services-item-text text-sm mb-0">Consider may dwelling old him her surprise finished families graceful. Gave led past poor met fine was new.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Statistics Section-->
<section class="statistics py-5 bg-primary">
    <div class="container text-white">
        <div class="row gy-4">
            <div class="col-lg-3 col-md-6">
                <div class="d-flex align-items-center justify-content-center justify-content-md-start">
                    <h2 class="text-lg me-3 mb-0">15</h2>
                    <p class="lead lh-sm mb-0">years of <br> experience</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="d-flex align-items-center justify-content-center justify-content-md-start">
                    <h2 class="text-lg me-3 mb-0">79</h2>
                    <p class="lead lh-sm mb-0">visited <br> conferences</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="d-flex align-items-center justify-content-center justify-content-md-start">
                    <h2 class="text-lg me-3 mb-0">452</h2>
                    <p class="lead lh-sm mb-0">smiling <br> clients</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="d-flex align-items-center justify-content-center justify-content-md-start">
                    <h2 class="text-lg me-3 mb-0">14</h2>
                    <p class="lead lh-sm mb-0">master <br> certifications</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Doctors Section-->
<section class="doctors bg-light">
    <div class="container text-center">
        <h2 class="text-uppercase lined lined-center">Our  <span class="text-primary">Doctors</span></h2>
        <p class="text-muted mb-5">Lorem ipsum dolor sit amet, consectetuer. Proin gravida nibh vel velit auctor aliquetenean.</p>
        <div class="row gy-4">
            <div class="col-xl-3 col-md-6">
                <!-- Doctor-->
                <div class="card doctor border-0">
                    <div class="card-body p-0 shadow-sm">
                        <div class="position-relative"><img class="img-fluid border-top border-2 border-primary" src="img/doctor-1.png" alt="...">
                            <div class="doctor-overlay">
                                <ul class="list-inline mb-0 doctor-social">
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-facebook-f"></i></a></li>
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-twitter"></i></a></li>
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-instagram"></i></a></li>
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-youtube"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="p-4">
                            <h6 class="mb-0">Dr Patricia Butron</h6>
                            <p class="text-muted text-sm mb-0">Senior Dr. at Delmont</p>
                        </div><a class="btn btn-primary w-100" href="#!">Make appointment</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <!-- Doctor-->
                <div class="card doctor border-0">
                    <div class="card-body p-0 shadow-sm">
                        <div class="position-relative"><img class="img-fluid border-top border-2 border-primary" src="img/doctor-2.png" alt="...">
                            <div class="doctor-overlay">
                                <ul class="list-inline mb-0 doctor-social">
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-facebook-f"></i></a></li>
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-twitter"></i></a></li>
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-instagram"></i></a></li>
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-youtube"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="p-4">
                            <h6 class="mb-0">Dr John Abraham</h6>
                            <p class="text-muted text-sm mb-0">Cardiologist Specialist</p>
                        </div><a class="btn btn-primary w-100" href="#!">Make appointment</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <!-- Doctor-->
                <div class="card doctor border-0">
                    <div class="card-body p-0 shadow-sm">
                        <div class="position-relative"><img class="img-fluid border-top border-2 border-primary" src="img/doctor-3.png" alt="...">
                            <div class="doctor-overlay">
                                <ul class="list-inline mb-0 doctor-social">
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-facebook-f"></i></a></li>
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-twitter"></i></a></li>
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-instagram"></i></a></li>
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-youtube"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="p-4">
                            <h6 class="mb-0">Dr Addison Smith</h6>
                            <p class="text-muted text-sm mb-0">Neurology Specialist</p>
                        </div><a class="btn btn-primary w-100" href="#!">Make appointment</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <!-- Doctor-->
                <div class="card doctor border-0">
                    <div class="card-body p-0 shadow-sm">
                        <div class="position-relative"><img class="img-fluid border-top border-2 border-primary" src="img/doctor-4.png" alt="...">
                            <div class="doctor-overlay">
                                <ul class="list-inline mb-0 doctor-social">
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-facebook-f"></i></a></li>
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-twitter"></i></a></li>
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-instagram"></i></a></li>
                                    <li class="list-inline-item"><a class="doctor-social-link" href="#!"><i class="fab fa-youtube"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="p-4">
                            <h6 class="mb-0">Dr Aiken Ward</h6>
                            <p class="text-muted text-sm mb-0">Senior Рathologist</p>
                        </div><a class="btn btn-primary w-100" href="#!">Make appointment</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Contact Section-->
<section class="contact py-5 bg-primary text-white">
    <div class="container">
        <div class="row gy-4">
            <div class="col-lg-4">
                <div class="d-flex align-items-center">
                    <div class="contact-icon"><i class="fas fa-phone"></i></div>
                    <div class="ms-3">
                        <h3 class="h5 mb-0">0800 2466 7921</h3>
                        <p class="small mb-0">Have a question? call us now</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="d-flex align-items-center">
                    <div class="contact-icon"><i class="far fa-envelope"></i></div>
                    <div class="ms-3">
                        <h3 class="h5 mb-0">info@domain.com</h3>
                        <p class="small mb-0">Need support? Drop us an email</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="d-flex align-items-center">
                    <div class="contact-icon"><i class="far fa-clock"></i></div>
                    <div class="ms-3">
                        <h3 class="h5 mb-0">Mon – Fri 07:00 – 21:00</h3>
                        <p class="small mb-0">We are open On</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
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
                        <li class="mb-2"><a class="footer-link" href="index.jsp">Home </a></li>
                        <li class="mb-2"><a class="footer-link" href="about.jsp">About us </a></li>
                        <li class="mb-2"><a class="footer-link" href="contact.jsp">Contact us </a></li>
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

