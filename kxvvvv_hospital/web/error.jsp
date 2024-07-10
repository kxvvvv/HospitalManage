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
    <title>Title</title>
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
</body>
</html>
