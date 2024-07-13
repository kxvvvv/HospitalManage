<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pojo.Patient" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Eternity | 病例</title>
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
    <!-- 引入 jQuery UI CSS -->

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
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
    <%
        String registeredId = request.getParameter("registeredId");
        String patientName=request.getParameter("patientName");
        String patientId=request.getParameter("patientId");
        String docId=request.getParameter("docId");

    %>
    <%
        String doctorName = (String) session.getAttribute("doctorName");
    %>

    <%
        Date now = new Date();

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        String dateNow = dateFormat.format(now);
    %>
    <h1>治疗方案</h1>
    <p><%=patientName%>.</p>
    <div class="row">
    <form method="post" action="/treatment">
        <div class="col-lg-8 align-middle">
            <div class="card mb-4" id="content-formatting">
                <div class="card-header">病例</div>
                <div class="card-body">
                    <input type="hidden" name="patientId" id="appointmentDateHidden" value="<%=patientId%>">
                    <input type="hidden" name="docId" id="appointmentDateHidden" value="<%=docId%>">

                    <div class="col-lg-12">
                        <textarea class="form-control" name="treatmentPlan" rows="5" placeholder="治疗方案"></textarea>
                    </div>

                    <div class="row">
                        <div class="col-sm-5">
                            <div class="form-check">
                                <input class="form-check-input" id="gridRadios1" type="radio" name="gender" value="男" checked>
                                <label class="form-check-label" for="gridRadios1">
                                    男
                                </label>
                            </div>
                        </div>
                        <div class="col-sm-5">
                            <div class="form-check">
                                <input class="form-check-input" id="gridRadios2" type="radio" name="gender" value="女">
                                <label class="form-check-label" for="gridRadios2">
                                    女
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="exampleInputEmail1">年龄:</label>
                        <input class="form-control" id="exampleInputEmail1" type="text" name="age"  value="" placeholder="年龄">
                    </div>
                    <hr><abbr title="Phone"><strong>诊断日期:</strong></abbr><%=dateNow%><br><hr>
                    <address><strong>病人名称</strong><br> <%=patientName%></address>
                    <address class="col-6"><strong>医生名称</strong><br><%=doctorName%></address>
                    <hr>
                    <div class="autocomplete-form">
                        <input id="drugSearch" type="text" placeholder="搜索药品名称" class="form-control">
                        <ul id="selectedDrugs"></ul>
                    </div>
                    <input type="hidden" id="selectedDrugsJson" name="selectedDrugsJson" />
                    <script>
                        var selectedDrugs = [];
                        var $selectedDrugsList = $('#selectedDrugs');
                        $(document).ready(function() {


                            $('#drugSearch').autocomplete({
                                minLength: 1, // 用户输入至少一个字符后才触发搜索
                                source: function(request, response) {
                                    $.ajax({
                                        url: '/drugSearch',
                                        dataType: "json",
                                        data: {
                                            term: request.term
                                        },
                                        contentType: "application/json; charset=utf-8",
                                        success: function(data) {
                                            response($.map(data, function(item) {
                                                return {
                                                    label: item.drugName,
                                                    value: item.drugName,
                                                    drugId:item.drugId
                                                };
                                            }));
                                        },
                                        error: function(jqXHR, textStatus, errorThrown) {
                                            console.log(this.data);
                                            console.log('HTTP Status Code: ' + jqXHR.status);
                                            console.log('Error Thrown: ' + errorThrown);
                                            console.log('Status Text: ' + textStatus);
                                            alert('Error loading treatment information');
                                        }
                                    });
                                },
                                select: function(event, ui) {
                                    if (selectedDrugs.indexOf(ui.item.drugId) === -1) { // 确保使用id进行比较
                                        var drugid=ui.item.drugId
                                        console.log(drugid)
                                        selectedDrugs.push(drugid); // 添加drugId到数组
                                        console.log("selectDrugs:"+selectedDrugs)
                                        console.log("json:"+JSON.stringify(selectedDrugs))
                                        var listItem = $('<li>').append(
                                            $('<span>').text(ui.item.label), // 包裹药品名称
                                            $('<button>').addClass('remove-drug').text('移除').data('drugName', ui.item.drugId) // 设置数据属性
                                        );
                                        console.log(listItem)
                                        $selectedDrugsList.append(listItem);
                                        $('#drugSearch').val('');
                                    }
                                },

                            });

                            $selectedDrugsList.on('click', '.remove-drug', function() {
                                var removedDrug = $(this).data('drugName'); // 从数据属性获取药品名称
                                var index = selectedDrugs.indexOf(removedDrug);
                                if (index > -1) {
                                    selectedDrugs.splice(index, 1);
                                }
                                console.log("selectedDrugs:", selectedDrugs);
                                console.log("removedDrug:", removedDrug);
                                console.log("index:", index);

                                $(this).closest('li').remove(); // 找到最近的 <li> 父元素并删除它
                            });
                        });
                    </script>
                    <hr>
                    <div class="row">
                        <div class="col-xs-6">
                            <ul>
                                <li>Normal Unordered List</li>
                                <li>Can Also Work
                                    <ul>
                                        <li>With Nested Children</li>
                                    </ul>
                                </li>
                                <li>Adds Bullets to Page</li>
                            </ul>
                        </div>
                        <div class="col-xs-6">
                            <ol>
                                <li>Normal Ordered List</li>
                                <li>Can Also Work
                                    <ol>
                                        <li>With Nested Children</li>
                                    </ol>
                                </li>
                                <li>Adds Bullets to Page</li>
                            </ol>
                        </div>
                    </div>
                    <hr>
                    <div class="col-lg-12">
                        <button class="btn btn-primary w-100" type="submit">Submit your request</button>
                    </div>
                    <script>
                        $('button[type="submit"]').click(function() {
                            console.log(selectedDrugs)
                            $('#selectedDrugsJson').val(JSON.stringify(selectedDrugs)); // 将selectedDrugs数组转换为JSON字符串
                            alert("诊断结束")
                        });
                    </script>
                </div>
            </div>
        </div>

    </form>

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
<%--<script src="vendor/jquery/jquery.min.js"></script>--%>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="js/front.js"></script>
<!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</body>
</html>