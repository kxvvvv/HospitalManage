<%--
  Created by IntelliJ IDEA.
  User: justaway
  Date: 2024/7/8
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>error</title>
    <script type="text/javascript">
        function goBack() {
            history.back();
        }
    </script>
</head>
<body>
<% if (request.getAttribute("errorMessage") != null) { %>
<script type="text/javascript">
    alert('<%=request.getAttribute("errorMessage")%>');
    goBack();
</script>
<% } %>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="js/front.js"></script>
<!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

</body>
</html>
