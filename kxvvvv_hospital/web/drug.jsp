<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pojo.Patient" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Eternity | 药品信息</title>
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
                        <!-- Link--><a class="nav-link text-uppercase letter-spacing-0" href="about.jsp">关于我们</a>
                    </li>
                    <li class="nav-item">
                        <!-- Link--><a class="nav-link text-uppercase letter-spacing-0" href="contact.jsp">联系我们</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link text-uppercase letter-spacing-0 dropdown-toggle active" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">更多</a>
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
                            <a class="dropdown-item" href="drug.jsp">药品信息</a>
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
<div class="container py-5">

    <div class="row">
        <div class="">

            <div class="card mb-4" id="tables">
                <div class="card-header">药品信息</div>
                <div class="card-body">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>药品名称</th>
                            <th>药品价格/元</th>
                            <th>有效期</th>
                            <th>库存数量</th>
                            <th>详细描述</th>
                        </tr>
                        </thead>
                        <tbody name="drugBody" id="drugBody">

                        <tr>
                            <td>1</td>
                            <td>fumo</td>
                            <td>45</td>
                            <td>12年</td>
                            <td>50</td>
                            <td></td>
                        </tr>

                        <script>
                            $(document).ready(function() {

                                $.ajax({
                                    url: '/drug',
                                    type: 'GET',
                                    dataType: 'json',
                                    contentType: "application/json; charset=utf-8",
                                    success: function(drugs) {
                                        console.log(drugs)
                                        // 清空select元素
                                        $('#drugBody').empty();
                                        // 遍历药品数据并添加到select元素
                                        $.each(drugs, function(index, drug) {
                                            console.log("ajaxDrugName:"+drug.drugName+"++")
                                            console.dir(drug)

                                            var row = '<tr>' +
                                                '<td>' + drug.drugId + '</td>' +
                                                '<td>' + drug.drugName + '</td>' +
                                                '<td>' + drug.drugPrice + '</td>' + // 假设药品价格字段为 price
                                                '<td>' + drug.expirationDate + '</td>' + // 假设有效期字段为 expire_date
                                                '<td>' + drug.stockQuantity + '</td>' + // 假设库存数量字段为 stock_quantity
                                                '<td><button class="btn btn-sm btn-info view-detail" type="button" data-drug-id="' + drug.drugId + '">查看详情</button></td>' + // 详细描述按钮
                                                '</tr>';

                                            // 将构建的行添加到表格中
                                            $('#drugBody').append(row);
                                        });
                                        $('#drugBody').on('click', '.view-detail', function() {
                                            var drugId = $(this).data('drug-id'); // 获取 data-drug-id 属性
                                            // 假设您想要 alert 出按钮对应的 drug 对象的某个属性，例如 func
                                            var selectedDrug = $.grep(drugs, function(drug) {
                                                return drug.drugId === parseInt(drugId);
                                            })[0];
                                            if (selectedDrug) {
                                                alert('药品' + selectedDrug.drugName + ' 的详细信息是: ' + selectedDrug.function);
                                            } else {
                                                alert(drugId+'未找到药品信息');
                                            }
                                        });
                                    },
                                    error: function() {
                                        alert('Error loading drugs information');
                                    }
                                });

                            });
                        </script>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>



</div>
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