<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ include file="../common/header.jsp" %>
        <h1>Tester Dashboard</h1>
        <p>Welcome, Tester!</p>
        <a href="<%= request.getContextPath() %>/tester/report_bug">Report Bug</a> |
        <a href="<%= request.getContextPath() %>/tester/bug_status">Bug Status</a>
        <%@ include file="../common/footer.jsp" %>