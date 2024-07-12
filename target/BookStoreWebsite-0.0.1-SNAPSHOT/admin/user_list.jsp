<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         isELIgnored="false" %>

<%--M?y file n�o compile c�i EL kh�ng ???c th� do n� m?c ??nh l� ignoredEL th�m c�i n�y v� trong c�c file ?�
isELIgnored="false"
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <%-- Ch?c n�y file web.xml b? l?i n� kh�ng compile ???c, c�i t s?a l?i ?i l?u xong n� l?i compile ???c n�n n� ch?y --%>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <title>Manage Users - Evergreen Book store administration</title>
</head>
<body>
<jsp:directive.include file="header.jsp"/>
<div align="center">
    <h1 class="pageheading">Users Management</h1>
    <h3>
        <a href="user_form.jsp">Create new User</a>
    </h3>
</div>
<c:if test="${message != null}">
    <div align="center">
        <h4 class="message">${message}</h4>
    </div>
</c:if>

<div align="center">
    <table border="1">
        <tr>
            <th>Index</th>
            <th>ID</th>
            <th>Email</th>
            <th>Full Name</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUsers}" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${user.userId}</td>
                <td>${user.email}</td>
                <td>${user.fullName}</td>
                <td>
                    <a href="edit_user?id=${user.userId}">Edit</a>
                    <a href="javascript:void(0);" class="deleteLink" id="${user.userId}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:directive.include file="footer.jsp"/>

<script type="text/javascript">
    $(document).ready(function () {
        $(".deleteLink").each(function () {
            $(this).on("click", function () {
                userId = $(this).attr("id");
                if (confirm('Are you sure you want to delete the user with ID '
                    + userId + '?')) {
                    window.location = 'delete_user?id=' + userId;
                }
            });
        });
    });
</script>
</body>
</html>