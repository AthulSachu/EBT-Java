<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ include file="../common/header.jsp" %>

            <h1>Edit User</h1>

            <!-- Ensure the user object is available -->
            <c:if test="${not empty user}">
                <form action="${pageContext.request.contextPath}/admin/updateUser" method="post">
                    <input type="hidden" name="id" value="${user.id}" />

                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="${user.username}" required />

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${user.email}" required />

                    <label for="role">Role:</label>
                    <select id="role" name="role" required>
                        <option value="Developer" ${user.role=='developer' ? 'selected' : '' }>Developer</option>
                        <option value="Tester" ${user.role=='tester' ? 'selected' : '' }>Tester</option>
                    </select>

                    <button type="submit">Update</button>
                </form>
            </c:if>

            <c:if test="${empty user}">
                <p>User not found.</p>
            </c:if>

            <%@ include file="../common/footer.jsp" %>