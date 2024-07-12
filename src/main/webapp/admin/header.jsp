<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
    <div>
        <img alt="logo" src="images/BookstoreAdminLogo.png"/>
    </div>

    <div>
        Welcome,
        <c:out value="${sessionScope.useremail}"/>
        | <a href="logout">Logout</a> <br/> <br/>
    </div>
    <div id="headermenu">
        <div>
            <a href="list_users"> <img alt="users" src="../images/users.png"><br/>Users
            </a>
        </div>
        <div>
            <a href="list_category"><img alt="category"
                                         src="../images/category.png"><br/>Category</a>
        </div>
        <div>
            <a href="list_books"><img alt="books" src="../images/bookstack.png"><br/>Books</a>
        </div>
        <div>
            <a href="customer"><img alt="customer"
                                    src="../images/customer.png"><br/>Customers</a>
        </div>
        <div>
            <a href="reviews"><img alt="reviews" src="../images/review.png"><br/>Reviews</a>
        </div>
        <div>
            <a href="orders"><img alt="orders" src="../images/order.png"><br/>Orders</a>
        </div>
    </div>
</div>

