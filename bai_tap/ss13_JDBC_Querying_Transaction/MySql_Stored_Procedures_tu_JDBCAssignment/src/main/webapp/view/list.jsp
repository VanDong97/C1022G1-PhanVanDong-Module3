<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2/15/2023
  Time: 1:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
<div class="container-fluid">
    <div class="col-6">
        <div>
            <table border="1" cellpadding="5">
                <caption><h2>List of Users</h2></caption>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Country</th>
                    <th>Actions</th>
                </tr>
                <c:forEach var="user" items="${listUser}">
                    <tr>
                        <td><c:out value="${user.id}"/></td>
                        <td><c:out value="${user.name}"/></td>
                        <td><c:out value="${user.email}"/></td>
                        <td><c:out value="${user.country}"/></td>
                        <td>
                            <a href="/users?action=edit&id=${user.id}">Edit</a>
                            <a href="/users?action=delete&id=${user.id}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="col-6">
        <form action="/users" method="post">
            <div class="form-group ">
                <input type="text"
                       class="form-control" name="search" id="search">
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </div>
</div>
</body>
</html>
