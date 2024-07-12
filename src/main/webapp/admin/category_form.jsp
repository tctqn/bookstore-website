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
    <c:if test="${category != null}">
        <title>Edit category</title>
    </c:if>
    <c:if test="${category == null}">
        <title>Create new category</title>
    </c:if>
</head>
<body>
<jsp:directive.include file="header.jsp"/>

<div align="center">
    <h2 class="pageheading">
        <c:if test="${category != null}">
            Edit category
        </c:if>
        <c:if test="${category == null}">
            Create New category
        </c:if>

    </h2>
</div>

<div align="center">
    <c:if test="${category != null}">
    <form action="update_category" method="post" id="categoryForm">
        <input type="hidden" name="categoryId"
               value="${category.categoryId}">
        </c:if>
        <c:if test="${category == null}">
        <form action="create_category" method="post" id="categoryForm">
            </c:if>
            <table class="form">
                <tr>
                    <td align="right">Name:</td>
                    <td align="left"><input type="text" id="name" name="name"
                                            size="20" value="${category.name}"></td>
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
        $("#categoryForm").validate({
            rules: {
                name: "required",
            },
            messages: {
                name: "Please enter category name",
            }
        });
        $("#buttonCancel").click(function () {
            history.go(-1)
        });
    });
</script>
</body>
</html>
