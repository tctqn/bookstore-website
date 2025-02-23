<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Evergreen Book store administration</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<jsp:directive.include file="header.jsp"/>

<div align="center">
    <h2 class="pageheading">Administrative Dashboard Nam</h2>
</div>

<div align="center">
    <hr width="60%">
    <h2 class="pageheading">Quick Actions:</h2>
    <b>
        <a href="create_book">New Book</a>
        <a href="create_user">New User</a>
        <a href="create_category">New Category</a>
        <a href="create_customer">New Customer</a>
    </b>
</div>
<div align="center">
    <hr width="60%">
    <h2 class="pageheading">Recent Sales:</h2>
</div>
<div align="center">
    <hr width="60%">
    <h2 class="pageheading">Recent Reviews:</h2>
</div>
<div align="center">
    <hr width="60%">
    <h2 class="pageheading">Statistics:</h2>
    <hr width="60%">
</div>

<jsp:directive.include file="footer.jsp"/>
</body>
</html>