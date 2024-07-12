<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Evergreens Book - Online Books Store</title>
</head>
<body>
<div align="center">
    <div>
        <img alt="logo" src="../images/BookstoreLogo.png"/>
    </div>

    <div>
        <input type="text" name="keyword" size="50"/> <input type="button"
                                                             value="Search"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
            href="login">Sign in</a> | <a href="register">Register</a> | <a
            href="view_car">Car</a>
    </div>

    <div>
        <c:forEach var="category" items="${listCategory}" varStatus="status">
            <a href="view_category?id=${category.categoryId}"> <font
                    size="+1"> <b><c:out value="${category.name}"/></b>
            </font>
            </a>
            <c:if test="${not status.last}">
                &nbsp; | &nbsp;
            </c:if>
        </c:forEach>
    </div>
</div>

</body>
</html>