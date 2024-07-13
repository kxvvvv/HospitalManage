<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>patientdrug</title>
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

<h1>药品列表</h1>
<table border="1"> <!-- 您可以添加 CSS 类来美化表格 -->
    <tr>
        <th>ID</th>
        <th>药品名称</th>
        <th>效果</th>
        <th>价格</th>
        <th>入库信息</th>
        <th>有效期</th>
        <th>库存数量</th>
    </tr>
    <c:forEach items="${drugs}" var="drug">
        <tr>
            <td>${drug.drug_id}</td>
            <td>${drug.drug_name}</td>
            <td>${drug.function}</td>
            <td>${drug.drug_price}</td>
            <td>${drug.inbound_date}</td>
            <td>${drug.expiration_date}</td>
            <td>${drug.stock_quantity}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>