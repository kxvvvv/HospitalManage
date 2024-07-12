<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add Drug</title>


</head>
<body>
<meta charset="UTF-8">
<div class="container">
    <h2>Add New Drug</h2>
    <form action="/addDrug" method="post">
        <div class="mb-3">
            <label for="drugName" class="form-label">Drug Name</label>
            <input type="text" class="form-control" id="drugName" name="drugName" required>
        </div>
        <div class="mb-3">
            <label for="function" class="form-label">Function</label>
            <input type="text" class="form-control" id="function" name="function" required>
        </div>
        <div class="mb-3">
            <label for="drugPrice" class="form-label">Price</label>
            <input type="number" class="form-control" id="drugPrice" name="drugPrice" step="0.01" required>
        </div>
        <div class="mb-3">
            <label for="inboundDate" class="form-label">Inbound Date</label>
            <input type="date" class="form-control" id="inboundDate" name="inboundDate" required>
        </div>
        <div class="mb-3">
            <label for="expirationDate" class="form-label">Expiration Date</label>
            <input type="date" class="form-control" id="expirationDate" name="expirationDate" required>
        </div>
        <div class="mb-3">
            <label for="stockQuantity" class="form-label">Stock Quantity</label>
            <input type="number" class="form-control" id="stockQuantity" name="stockQuantity" min="0" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>