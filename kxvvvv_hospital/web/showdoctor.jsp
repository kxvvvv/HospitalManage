<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Medicio | Bootstrap Medical Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Google fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:700,800&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400&display=swap">
    <!-- theme stylesheet -->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes -->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
<!-- navbar-->
<header class="header">

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
    <h1>医生列表</h1>
    <p>以下是我们的医生信息</p>
    <div class="row">
        <div class="col-lg-12">
            <div class="card mb-4">
                <div class="card-header">
                    医生
                    <a href="addDoctor.jsp" class="btn btn-primary float-end">添加医生</a>
                </div>
                <div class="card-body">
                    <table class="table table-hover" id="doctorTable">
                        <thead>
                        <tr>
                            <th>docId</th>
                            <th>name</th>
                            <th>docPwd</th>
                            <th>docAcc</th>
                            <th>role</th>
                            <th>sectionId</th>
                            <th>phone</th>
                            <th>major</th>
                            <th>job</th>
                            <th>degree</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="doctorBody">
                        <!-- 医生数据将通过AJAX请求动态插入 -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    $(document).ready(function() {
        // 使用AJAX获取药品数据
        $.ajax({
            url: '/showdoctor',
            type: 'GET',
            dataType: 'json',
            success: function(doctors) {
                // 清空tbody元素
                $('#drugBody').empty();
                // 遍历药品数据并添加到表格
                $.each(doctors, function(index, doctor) {
                    var row = '<tr>' +
                        '<td>' + doctor.docId + '</td>' +
                        '<td>' + doctor.name + '</td>' +
                        '<td>' + doctor.docPwd + '</td>' +
                        '<td>' + doctor.docAcc + '</td>' +
                        '<td>' + doctor.role + '</td>' +
                        '<td>' + doctor.sectionId + '</td>' +
                        '<td>' + doctor.phone + '</td>' +
                        '<td>' + doctor.major + '</td>' +
                        '<td>' + doctor.job + '</td>' +
                        '<td>' + doctor.degree + '</td>' +
                        '<td>' +
                        '<button type="button" class="btn btn-danger delete-doctor" data-docId="' + doctor.docId + '">删除</button>' +
                        '</td>' +
                        '</tr>';
                    $('#doctorBody').append(row);
                });

                // 为删除按钮绑定事件
                $('.delete-doctor').on('click', function() {
                    var docId = $(this).attr('data-docId');
                    confirmDelete(docId,'delete');
                });
            },
            error: function() {
                alert('Error loading doctor information');
            }
        });
    });
    // ajax函数
    function confirmDelete(docId,action) {
        if (confirm('确定要删除这个药品吗?')) {
            $.ajax({
                url: '/showdoctor?action=' + action,
                type: 'POST',
                data: {
                    docId: docId
                },
                success: function(response) {
                    alert('成功');
                    window.location.reload(); // 重新加载当前页面
                },
                error: function() {
                    alert('Error deleting doctor');
                }
            });
        }
    }
</script>

</body>
</html>