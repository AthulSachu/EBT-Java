<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ include file="/views/common/header.jsp" %>
            <section>
                <h2>Bug Reports</h2>
                <table border="1">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Status</th>
                            <th>Reporter ID</th>
                            <th>Priority</th>
                            <th>Assigned To</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty bugs}">
                            <tr>
                                <td colspan="8">No bug reports found.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="bug" items="${bugs}">
                            <tr>
                                <td>${bug.id}</td>
                                <td>${bug.title}</td>
                                <td>${bug.description}</td>
                                <td>${bug.status}</td>
                                <td>${bug.reporterId}</td>
                                <td>${bug.priority}</td>
                                <td>${bug.assignedTo}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/edit_bug?id=${bug.id}">Edit</a>
                                    <a href="${pageContext.request.contextPath}/admin/delete_bug?id=${bug.id}"
                                        onclick="return confirm('Are you sure?');">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </section>
            <%@ include file="/views/common/footer.jsp" %>  