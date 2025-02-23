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
    <title>Admin Login</title>
</head>
<body>
<div align="center">
    <h1>Book Store Administration</h1>
    <h2>Admin Login</h2>
    <c:if test="${message != null}">
        <div align="center">
            <h4 class="message">${message}</h4>
        </div>
    </c:if>
    <form action="login" id="loginForm" method="post">
        <table>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" id="email" size="20"></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password" id="password"
                           size="20"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit">Login</button>
                </td>
            </tr>

        </table>


    </form>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loginForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                password: "required"
            },
            messages: {
                email: {
                    required: "Please enter your Email!",
                    email: "Please enter a valid email address"
                },
                password: "Please enter your Password"
            }
        });
    });
</script>
</body>
</html>