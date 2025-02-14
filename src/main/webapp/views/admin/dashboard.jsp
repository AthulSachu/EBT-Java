<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ include file="/views/common/header.jsp" %>
        <section>
            <h2>Admin Dashboard</h2>
            <p>Total Users: ${users.size()}</p>
            <p>Total Bugs: ${bugs.size()}</p>
            <a href="<%= request.getContextPath() %>/admin/manage_users">Manage Users</a> |
            <a href="<%= request.getContextPath() %>/admin/bug_reports">View Bug Reports</a> |
            <a href="<%= request.getContextPath() %>/performance/view">Performance Metrics</a>

            <!-- <h3>Bar Graph</h3>
            <img src="${pageContext.request.contextPath}/chart" alt="Bar Graph" /> -->
        </section>
        <%@ include file="/views/common/footer.jsp" %>