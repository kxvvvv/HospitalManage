<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pojo.Patient" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Eternity | 主页</title>
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
                        <!-- Link--><a class="nav-link text-uppercase letter-spacing-0 active" href="index.jsp">主页</a>
                    </li>
                    <li class="nav-item">
                        <!-- Link--><a class="nav-link text-uppercase letter-spacing-0" href="about.jsp">关于我们</a>
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
                            <c:if test="${sessionScope.role == 0||sessionScope.role == 1||sessionScope.role == null}">
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
<section class="hero-home bg-cover bg-center" style="background: url(img/home-banner.jpg)">
    <div class="container z-index-20 py-5 mb-5">
        <div class="row text-white">
            <div class="col-lg-8">
                <h1 class="text-uppercase mb-0 text-shadow">Eternity medical group</h1>
                <p class="h5 my-4 text-shadow">Provide best quality healthcare for you</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p><a class="btn btn-light text-primary px-5" href="about.jsp">View details</a>
            </div>
        </div>
    </div>
</section>
<!-- Info Section-->
<section class="info p-0 bg-light">
    <div class="container">
        <div class="card border-0">
            <div class="card-body py-5 border-top border-2 border-primary">
                <div class="row gy-4">
                    <div class="col-lg-4 border-end">
                        <div class="px-4">
                            <p class="text-primary mb-0 fw-normal">Qualified Doctors</p>
                            <h3 class="h5">Where people come first</h3>
                            <p class="text-muted mb-0 text-sm">Lorem ipsum dolor sit amet, conse. Proin gravida nibh vel velit auctor aliquet. Aenean sollique ancitudi.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 border-end">
                        <div class="px-4">
                            <p class="text-primary mb-0 fw-normal">24 hour service</p>
                            <h3 class="h5">Highest Quality Ever</h3>
                            <p class="text-muted mb-0 text-sm">Lorem ipsum dolor sit amet, conse. Proin gravida nibh vel velit auctor aliquet. Aenean sollique ancitudi.</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="px-4">
                            <p class="text-primary mb-0 fw-normal">We are here for you</p>
                            <h3 class="h5">Emergency Department</h3>
                            <p class="text-muted mb-0 text-sm">Lorem ipsum dolor sit amet, conse. Proin gravida nibh vel velit auctor aliquet. Aenean sollique ancitudi.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- About Section-->
<section class="about bg-light pt-0">
    <div class="container text-center">
        <h2 class="text-uppercase lined lined-center">Welcome to <span class="text-primary">Eternity </span>Clinic</h2>
        <p class="text-muted">Nulla tristique ipsum in quam. Integer ac elit. Duis turpis faucibus non</p>
        <div class="row pt-5 gy-4 gx-5">
            <div class="col-lg-4"><i class="fas fa-3x text-primary mb-3 fa-stethoscope"></i>
                <h2 class="h5">HealthCare Professionals</h2>
                <p class="text-muted mb-0">Lorem ipsum dolor sit amet, conse. Proin gravida nibh vel velit auctor aliquet. Aenean.</p>
            </div>
            <div class="col-lg-4"><i class="fas fa-3x text-primary mb-3 fa-microscope"></i>
                <h2 class="h5">Medical Excellence</h2>
                <p class="text-muted mb-0">Lorem ipsum dolor sit amet, conse. Proin gravida nibh vel velit auctor aliquet. Aenean.</p>
            </div>
            <div class="col-lg-4"><i class="fas fa-3x text-primary mb-3 fa-syringe"></i>
                <h2 class="h5">Latest Technologies</h2>
                <p class="text-muted mb-0">Lorem ipsum dolor sit amet, conse. Proin gravida nibh vel velit auctor aliquet. Aenean.</p>
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
<!-- Prices Section-->
<section class="prices">
    <div class="container">
        <div class="row mb-5">
            <div class="col-lg-4">
                <h2 class="h5">We Value Your Family's Health and Your Time</h2>
            </div>
            <div class="col-lg-8">
                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et.</p>
            </div>
        </div>
        <ul class="nav nav-pills mb-3 flex-column flex-sm-row text-center" id="pills-tab" role="tablist">
            <li class="nav-item flex-sm-fill"><a class="nav-link active" id="pills-cosmetic-tab" data-bs-toggle="pill" href="#pills-cosmetic" role="tab" aria-controls="pills-cosmetic" aria-selected="true">Cosmetic Medicine</a></li>
            <li class="nav-item flex-sm-fill"><a class="nav-link" id="pills-Medications-tab" data-bs-toggle="pill" href="#pills-Medications" role="tab" aria-controls="pills-Medications" aria-selected="false">Medications</a></li>
            <li class="nav-item flex-sm-fill"><a class="nav-link" id="pills-Physician-tab" data-bs-toggle="pill" href="#pills-Physician" role="tab" aria-controls="pills-Physician" aria-selected="false">Physician</a></li>
        </ul>
        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane py-4 fade show active" id="pills-cosmetic" role="tabpanel" aria-labelledby="pills-cosmetic-tab">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">Surgery</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$150</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Corrupti earum accusamus a tempore. Inventore non expedita quos natus. </p>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">Cosmetic Dentistry</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$250</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor. Inventore non expedita quos natus. </p>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">Rotavirus Test</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$175</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor. Inventore non expedita quos natus. </p>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">SurgerEye Examination</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$225</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor. Inventore non expedita quos natus. </p>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">Rotavirus Test</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$175</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor. Inventore non expedita quos natus. </p>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">SurgerEye Examination</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$225</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor. Inventore non expedita quos natus. </p>
                    </div>
                </div>
            </div>
            <div class="tab-pane py-4 fade" id="pills-Medications" role="tabpanel" aria-labelledby="pills-Medications-tab">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">Surgery</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$150</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Corrupti earum accusamus a tempore. Inventore non expedita quos natus. </p>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">Cosmetic Dentistry</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$250</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor. Inventore non expedita quos natus. </p>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">Rotavirus Test</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$175</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor. Inventore non expedita quos natus. </p>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">SurgerEye Examination</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$225</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor. Inventore non expedita quos natus. </p>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">Rotavirus Test</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$175</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor. Inventore non expedita quos natus. </p>
                    </div>
                </div>
            </div>
            <div class="tab-pane py-4 fade" id="pills-Physician" role="tabpanel" aria-labelledby="pills-Physician-tab">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">Surgery</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$150</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Corrupti earum accusamus a tempore. Inventore non expedita quos natus. </p>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">Cosmetic Dentistry</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$250</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor. Inventore non expedita quos natus. </p>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">Rotavirus Test</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$175</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor. Inventore non expedita quos natus. </p>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">SurgerEye Examination</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$225</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor. Inventore non expedita quos natus. </p>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">Rotavirus Test</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$175</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor. Inventore non expedita quos natus. </p>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center mb-2">
                            <h6 class="mb-0">SurgerEye Examination</h6>
                            <div class="dotted-separator mx-3 flex-grow-1 my-0"></div>
                            <h6 class="text-primary mb-0">$225</h6>
                        </div>
                        <p class="text-muted text-sm">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor. Inventore non expedita quos natus. </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Departments Section-->
<section class="departments pb-0 bg-light">
    <div class="container">
        <div class="row align-items-end">
            <div class="col-lg-5 d-none d-lg-block"><img class="img-fluid" src="img/doctor.png" alt="doctor"></div>
            <div class="col-lg-7 pb-5 mb-5">
                <h2 class="text-uppercase lined">Our <span class="text-primary">Departments</span></h2>
                <p class="text-muted mb-5">Lorem ipsum dolor sit amet, consectetuer. Proin gravida nibh vel velit auctor aliquetenean.</p>
                <div class="accordion pb-5" id="accordion">
                    <div class="accordion-item border-0 rounded-0 mb-2">
                        <div class="accordion-header p-0 border-0" id="headingOne">
                            <h6 class="mb-0"><a class="accordion-button py-3 px-4" data-bs-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne"><i class="fas fa-tooth fa-fw me-3 text-primary"></i>Dentistry</a></h6>
                        </div>
                        <div class="collapse show" id="collapseOne" aria-labelledby="headingOne" data-parent="#accordion">
                            <div class="p-4">
                                <p class="text-muted">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo.</p>
                                <p class="text-muted mb-0">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod.</p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item border-0 rounded-0 mb-2">
                        <div class="accordion-header p-0 border-0" id="headingTwo">
                            <h6 class="mb-0"><a class="accordion-button collapsed py-3 px-4" data-bs-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"><i class="fas fa-brain fa-fw me-3 text-primary"></i>Neurology</a></h6>
                        </div>
                        <div class="collapse" id="collapseTwo" aria-labelledby="headingTwo" data-parent="#accordion">
                            <div class="p-4">
                                <p class="text-muted mb-0">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo.</p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item border-0 rounded-0">
                        <div class="accordion-header p-0 border-0" id="headingThree">
                            <h6 class="mb-0"><a class="accordion-button collapsed py-3 px-4" data-bs-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><i class="fas fa-dna fa-fw me-3 text-primary"></i>Blood Analysis</a></h6>
                        </div>
                        <div class="collapse" id="collapseThree" aria-labelledby="headingThree" data-parent="#accordion">
                            <div class="p-4">
                                <p class="text-muted mb-0">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo.</p>
                            </div>
                        </div>
                    </div>
                </div><a class="btn btn-primary w-100" href="#!">Explore all departments        </a>
            </div>
        </div>
    </div>
</section>
<!-- Service Section-->
<section class="services">
    <div class="container text-center">
        <h2 class="text-uppercase lined lined-center">Our  <span class="text-primary">Services</span></h2>
        <p class="text-muted mb-5">Lorem ipsum dolor sit amet, consectetuer. Proin gravida nibh vel velit auctor aliquetenean.</p>
        <div class="row gy-4">
            <div class="col-xl-3 col-md-6">
                <!-- Services Item-->
                <div class="card services-item border-0">
                    <div class="card-body border-top border-2 border-primary py-5 px-4 shadow-sm">
                        <h2 class="h6 mb-0 services-item-heading">Qualified Facilities</h2>
                        <div class="services-icon my-4"><i class="fas fa-procedures fa-2x"></i></div>
                        <p class="services-item-text text-sm mb-0">Consider may dwelling old him her surprise finished families graceful. Gave led past poor met fine was new.</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <!-- Services Item-->
                <div class="card services-item border-0">
                    <div class="card-body border-top border-2 border-primary py-5 px-4 shadow-sm">
                        <h2 class="h6 mb-0 services-item-heading">Top Level Doctors</h2>
                        <div class="services-icon my-4"><i class="fas fa-user-md fa-2x"></i></div>
                        <p class="services-item-text text-sm mb-0">Consider may dwelling old him her surprise finished families graceful. Gave led past poor met fine was new.</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <!-- Services Item-->
                <div class="card services-item border-0">
                    <div class="card-body border-top border-2 border-primary py-5 px-4 shadow-sm">
                        <h2 class="h6 mb-0 services-item-heading">Dedicated Patient Care</h2>
                        <div class="services-icon my-4"><i class="fas fa-notes-medical fa-2x"></i></div>
                        <p class="services-item-text text-sm mb-0">Consider may dwelling old him her surprise finished families graceful. Gave led past poor met fine was new.</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <!-- Services Item-->
                <div class="card services-item border-0">
                    <div class="card-body border-top border-2 border-primary py-5 px-4 shadow-sm">
                        <h2 class="h6 mb-0 services-item-heading">24/7 Emergency</h2>
                        <div class="services-icon my-4"><i class="fas fa-ambulance fa-2x"></i></div>
                        <p class="services-item-text text-sm mb-0">Consider may dwelling old him her surprise finished families graceful. Gave led past poor met fine was new.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Doctors Section-->
<section class="doctors bg-light">
    <div class="container text-center">
        <h2 class="text-uppercase lined lined-center">主治  <span class="text-primary">  医生</span></h2>
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
<!-- Opening Hours-->
<section class="overflow-hidden">
    <div class="container">
        <h2 class="text-uppercase lined">Working  <span class="text-primary">Hours</span></h2>
        <p class="text-muted mb-5">Lorem ipsum dolor sit amet, consectetuer. Proin gravida nibh vel velit auctor aliquetenean.</p>
        <div class="row align-items-center gy-5">
            <div class="col-lg-6">
                <div class="card shadow-sm border-0">
                    <div class="card-body border-top border-2 border-primary py-4 px-lg-5">
                        <ul class="list-unstyled mb-0">
                            <li class="d-flex align-items-center justify-content-between py-3 px-4"><strong class="h6 mb-0">Monday </strong><span class="mb-0">9:00 am - 06:00 pm</span>
                            </li>
                            <li class="d-flex align-items-center justify-content-between py-3 px-4 bg-light"><strong class="h6 mb-0">Tuesday </strong><span class="mb-0">9:00 am - 06:00 pm</span>
                            </li>
                            <li class="d-flex align-items-center justify-content-between py-3 px-4"><strong class="h6 mb-0">Wednesday </strong><span class="mb-0">9:00 am - 06:00 pm</span>
                            </li>
                            <li class="d-flex align-items-center justify-content-between py-3 px-4 bg-light"><strong class="h6 mb-0">Friday </strong><span class="mb-0">9:00 am - 06:00 pm</span>
                            </li>
                            <li class="d-flex align-items-center justify-content-between py-3 px-4"><strong class="h6 mb-0">Saturday </strong><strong class="h6 mb-0 text-uppercase text-primary">Closed</strong>
                            </li>
                            <li class="d-flex align-items-center justify-content-between py-3 px-4 bg-light"><strong class="h6 mb-0">Sunday </strong><strong class="h6 mb-0 text-uppercase text-primary">Closed</strong>
                            </li>
                            <li class="d-flex align-items-center justify-content-between py-3 px-4"><strong class="h6 mb-0"> </strong><span class="mb-0"></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 text-center"><i class="fas fa-first-aid fa-4x text-primary mb-4">   </i>
                <h3 class="h4">Emergency Case</h3>
                <p class="text-muted mb-3 px-lg-5">If you need a doctor urgently outside of medicenter opening hours, call emergency appointment number for emergency service.</p>
                <div class="text-primary"><a class="btn btn-lg btn-outline-primary h5 px-4 py-3" href="tel:080024667921"> <i class="fas fa-phone-square me-2"></i>+ 0800 2466 7921</a></div>
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