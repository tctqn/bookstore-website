<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <title>Create new user</title>
</head>
<body>
<jsp:directive.include file="header.jsp"/>

<div align="center">
    <h1 class="pageheading">
        <c:if test="${user != null}">
            Edit user
        </c:if>
        <c:if test="${user == null}">
            Create New User
        </c:if>
    </h1>
</div>

<div align="center">
    <c:if test="${user != null}">
    <form action="update_user" method="post" id="userForm">
        <input type="hidden" name="userId" value="${user.userId}">
        </c:if>
        <c:if test="${user == null}">
        <form action="create_user" method="post" id="userForm">
            </c:if>
            <table class="form">
                <tr>
                    <td align="right">Email:</td>
                    <td align="left"><input type="text" id="email" name="email"
                                            size="20" value="${user.email}"></td>
                </tr>
                <tr>
                    <td align="right">Full name:</td>
                    <td align="left"><input type="text" id="fullname"
                                            name="fullname" size="20" value="${user.fullName}"></td>
                </tr>
                <tr>
                    <td align="right">Password:</td>
                    <td align="left"><input type="password" id="password"
                                            name="password" size="20" value="${user.password}"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="submit">Save</button>
                        <button id="buttonCancel">Cancel</button>
                    </td>
                </tr>
            </table>
        </form>
</div>
<jsp:directive.include file="footer.jsp"/>
<script type="text/javascript">
    $(document).ready(function () {
        $("#userForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                fullname: "required",
                password: "required"
            },
            messages: {
                email: {
                    required: "Please enter your Email!",
                    email: "Please enter a valid email address"
                },
                fullname: "Please enter your Full Name",
                password: "Please enter your Password"
            }
        });
        $("#buttonCancel").click(function () {
            history.go(-1)
        });
    });
</script>
</body>

</html>
