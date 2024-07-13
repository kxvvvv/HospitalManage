<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add Doctor</title>
    <!-- 包含Bootstrap等CSS和JS文件 -->
</head>
<body>
<div class="container">
    <h2>Add New Doctor</h2>
    <form action="addDoctor" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="docPwd" class="form-label">Password</label>
            <input type="password" class="form-control" id="docPwd" name="docPwd" required>
        </div>
        <div class="mb-3">
            <label for="docAcc" class="form-label">Account</label>
            <input type="text" class="form-control" id="docAcc" name="docAcc" required>
        </div>
        <div class="mb-3">
            <label for="role" class="form-label">Role</label>
            <input type="text" class="form-control" id="role" name="role" required>
        </div>
        <div class="mb-3">
            <label for="sectionId" class="form-label">Section ID</label>
            <input type="number" class="form-control" id="sectionId" name="sectionId" min="0" required>
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Phone</label>
            <input type="tel" class="form-control" id="phone" name="phone" required>
        </div>
        <div class="mb-3">
            <label for="major" class="form-label">Major</label>
            <input type="text" class="form-control" id="major" name="major" required>
        </div>
        <div class="mb-3">
            <label for="job" class="form-label">Job Title</label>
            <input type="text" class="form-control" id="job" name="job" required>
        </div>
        <div class="mb-3">
            <label for="degree" class="form-label">Degree</label>
            <input type="text" class="form-control" id="degree" name="degree" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>