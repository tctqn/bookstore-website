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
    <title>Manage Users - Evergreen Book store administration</title>
</head>
<body>
<jsp:directive.include file="header.jsp"/>
<div align="center">
    <h1 class="pageheading">Books Management</h1>
    <h3>
        <a href="new_book">Create new book</a>
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
            <th>Image</th>
            <th>Title</th>
            <th>Author</th>
            <th>Catogory</th>
            <th>Price</th>
            <th>Last Updated</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="book" items="${listBooks}" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${book.bookId}</td>
                <td><img alt="image"
                         src="data:image/jpg;base64,${book.base64Image}" width="84"
                         height="110"/></td>
                <td>${book.title}</td>
                <td>${book.author}</td>
                <td>${book.category.name}</td>
                <td>${book.price}</td>
                <td>${book.lastUpdateTime}</td>

                <td><a href="edit_book?id=${book.bookId}">Edit</a> <a
                        href="javascript:void(0);" class="deleteLink" id="${book.bookId}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:directive.include file="footer.jsp"/>

<script type="text/javascript">
    $(document)
        .ready(
            function () {
                $(".deleteLink")
                    .each(
                        function () {
                            $(this)
                                .on(
                                    "click",
                                    function () {
                                        userId = $(
                                            this)
                                            .attr(
                                                "id");
                                        if (confirm('Are you sure you want to delete the user with ID '
                                            + userId
                                            + '?')) {
                                            window.location = 'delete_user?id='
                                                + userId;
                                        }
                                    });
                        });
            });
</script>
</body>
</html>