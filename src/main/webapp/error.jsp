<%--
  Created by IntelliJ IDEA.
  User: Hirusha Dulshan
  Date: 8/11/2026
  Time: 1:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>Error</title>
</head>
<body>
<h1>Something went wrong</h1>
<div> <%=exception !=null ?exception.getMessage() : "Am umexpected error occured"%></div>
<br>
<button onclick="window.location.href='/index.jsp'">Go to Home</button>

</body>
</html>
