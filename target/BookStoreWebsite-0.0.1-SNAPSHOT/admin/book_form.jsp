<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">

    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <!-- Ensure jQuery is loaded first -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
    <title>Create new book</title>

</head>
<body>
<jsp:directive.include file="header.jsp"/>

<div align="center">
    <h1 class="pageheading">
        <c:if test="${book != null}">
            Edit Book
        </c:if>
        <c:if test="${book == null}">
            Create New Book
        </c:if>
    </h1>
</div>

<div align="center">
    <c:if test="${book != null}">
    <form action="update_book" method="post" id="bookForm"
          enctype="multipart/form-data">
        <input type="hidden" name="bookId" value="${book.bookId}">
        </c:if>
        <c:if test="${book == null}">
        <form action="create_book" method="post" id="bookForm"
              enctype="multipart/form-data">
            </c:if>
            <table class="form">
                <tr>
                    <td>Category:</td>
                    <td><select name="category">
                        <c:forEach items="${listCategory}" var="category">
                            <c:if test="${category.categoryId eq book.category.categoryId}">
                                <option value="${category.categoryId}" selected>
                            </c:if>

                            <c:if test="${category.categoryId ne book.category.categoryId}">
                                <option value="${category.categoryId}">
                            </c:if>
                            ${category.name}
                            </option>
                        </c:forEach>
                    </select></td>
                </tr>
                <tr>
                    <td align="right">Title:</td>
                    <td align="left"><input type="text" id="title" name="title"
                                            size="20" value="${book.title}"/></td>
                </tr>
                <tr>
                    <td align="right">Author:</td>
                    <td align="left"><input type="text" id="author" name="author"
                                            size="20" value="${book.author}"></td>
                </tr>
                <tr>
                    <td align="right">ISBN:</td>
                    <td align="left"><input type="text" id="isbn" name="isbn"
                                            size="20" value="${book.isbn}"></td>
                </tr>
                <tr>
                    <td align="right">Publish Date:</td>
                    <td align="left"><input type="text" id="publishDate"
                                            name="publishDate" size="20" value="${book.publishDate}"></td>
                </tr>
                <tr>
                    <td align="right">Book Image:</td>
                    <td align="left"><input type="file" id="bookImage"
                                            name="bookImage" size="20"/><br/> <img id="thumbnail"
                                                                                   alt="Image Preview"
                                                                                   style="width: 20%; margin-top: 10px"
                                                                                   src="data:image/jpg;base64,${book.base64Image}"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">Price:</td>
                    <td align="left"><input type="text" id="price" name="price"
                                            size="20" value="${book.price}"></td>
                </tr>
                <tr>
                    <td align="right">Description:</td>
                    <td align="left"><textarea rows="5" cols="50"
                                               name="description" id="description">${book.description}</textarea></td>
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
    jQuery(document).ready(function ($) {
        $("#publishDate").datepicker();

        $("#bookForm").validate({
            rules: {
                category: "required",
                title: "required",
                author: "required",
                isbn: "required",
                publishDate: "required",

                <c:if test="${book == null}">
                bookImage: "required",
                </c:if>

                price: "required",
                description: "required",
            },
            messages: {
                category: "Please select a category for the book",
                title: "Please enter book title",
                author: "Please enter book author",
                isbn: "Please enter book isbn",
                publishDate: "Please enter book publish date",
                bookImage: "Please enter book image",
                price: "Please enter book price",
                description: "Please enter book description",
            }
        });
        $("#buttonCancel").click(function () {
            history.go(-1)
        });
    });
</script>
</body>
</html>
