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
    <h1>药品列表</h1>
    <p>以下是我们的药品清单</p>
    <div class="row">
        <div class="col-lg-12">
            <div class="card mb-4">
                <div class="card-header">
                    药品
                    <a href="addDrug.jsp" class="btn btn-primary float-end">添加药品</a>
                </div>
                <div class="card-body">
                    <table class="table table-hover" id="drugTable">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>药品名称</th>
                            <th>效果</th>
                            <th>价格</th>
                            <th>入库信息</th>
                            <th>有效期</th>
                            <th>库存数量</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="drugBody">
                        <!-- 药品数据将通过AJAX请求动态插入 -->
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
                                    url: '/showdrug',
                                    type: 'GET',
                                    dataType: 'json',
                                    success: function(drugs) {
                                        // 清空tbody元素
                                        $('#drugBody').empty();
                                        // 遍历药品数据并添加到表格
                                        $.each(drugs, function(index, drug) {
                                            var row = '<tr>' +
                                                '<td>' + drug.drugId + '</td>' +
                                                '<td>' + drug.drugName + '</td>' +
                                                '<td>' + drug.function + '</td>' +
                                                '<td>' + drug.drugPrice + '</td>' +
                                                '<td>' + drug.inboundDate + '</td>' +
                                                '<td>' + drug.expirationDate + '</td>' +
                                                '<td>' + drug.stockQuantity + '</td>' +
                                                '<td>' +
                                                '<input type="number" class="quantity-input" value="0" min="0" step="1" min="0">' +
                                                '<button type="button" class="btn btn-success update-stock1" data-drugId="' + drug.drugId + '">增加库存</button>' +
                                                '<button type="button" class="btn btn-success update-stock2" data-drugId="' + drug.drugId + '">减少库存</button>' +
                                                '<button type="button" class="btn btn-danger delete-drug" data-drugId="' + drug.drugId + '">删除</button>' +
                                                '</td>' +
                                                '</tr>';
                                            $('#drugBody').append(row);
                                        });
                                        // 为增加库存按钮绑定事件
                                        $('.update-stock1').on('click', function() {
                                            var drugId = $(this).attr('data-drugId');
                                            var quantity = $(this).prev().val();
                                            updateStock(drugId, quantity, 'increase');
                                        });
                                        // 为减少库存按钮绑定事件
                                        $('.update-stock2').on('click', function() {
                                            var drugId = $(this).attr('data-drugId');
                                            var $tr = $(this).closest('tr'); // 找到最近的<tr>元素
                                            var quantity = $tr.find('.quantity-input').val();
                                            updateStock(drugId, quantity, 'decrease');
                                        });
                                        // 为删除按钮绑定事件
                                        $('.delete-drug').on('click', function() {
                                            var drugId = $(this).attr('data-drugId');
                                            confirmDelete(drugId,'delete');
                                        });
                                    },
                                    error: function() {
                                        alert('Error loading drugs information');
                                    }
                                });
                            });
                            // JavaScript function to update stock via AJAX
                            function updateStock(drugId, quantity, action) {
                                $.ajax({
                                    url: '/showdrug?action=' + action, // 确保服务器端处理action参数
                                    type: 'POST',
                                    data: { // 将对象转换为 JSON 字符串
                                        drugId: drugId,
                                        quantity: quantity
                                    },
                                    success: function(response) {
                                        alert('成功'); // 显示服务器返回的消息
                                        window.location.reload(); // 重新加载当前页面
                                    },
                                    error: function() {
                                        alert('Error updating stock');
                                    }
                                });
                            }

                            // JavaScript function to confirm drug deletion via AJAX
                            function confirmDelete(drugId,action) {
                                if (confirm('确定要删除这个药品吗?')) {
                                    $.ajax({
                                        url: '/showdrug?action=' + action,
                                        type: 'POST',
                                        data: {
                                            drugId: drugId
                                        },
                                        success: function(response) {
                                            alert('成功');
                                            window.location.reload(); // 重新加载当前页面
                                        },
                                        error: function() {
                                            alert('Error deleting drug');
                                        }
                                    });
                                }
                            }
                        </script>

</body>
</html>