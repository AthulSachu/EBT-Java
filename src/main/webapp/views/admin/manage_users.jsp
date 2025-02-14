<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ include file="../common/header.jsp" %>

            <h1>Manage Users</h1>

            <!-- Developer Table -->
            <h2>Developers</h2>
            <table border="1" cellspacing="0" cellpadding="5">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${userList}">
                        <c:if test="${user.role == 'developer'}">
                            <tr>
                                <td>${user.username}</td>
                                <td>${user.email}</td>
                                <td>
                                    <a href="editUser?id=${user.id}">Edit</a> |
                                    <a href="deleteUser?id=${user.id}"
                                        onclick="return confirm('Are you sure?');">Delete</a>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Tester Table -->
            <h2>Testers</h2>
            <table border="1" cellspacing="0" cellpadding="5">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${userList}">
                        <c:if test="${user.role == 'tester'}">
                            <tr>
                                <td>${user.username}</td>
                                <td>${user.email}</td>
                                <td>
                                    <a href="editUser?id=${user.id}">Edit</a> |
                                    <a href="deleteUser?id=${user.id}"
                                        onclick="return confirm('Are you sure?');">Delete</a>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>

            <%@ include file="../common/footer.jsp" %>