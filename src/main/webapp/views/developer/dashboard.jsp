<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ include file="../common/header.jsp" %>
        <h1>Developer Dashboard</h1>
        <p>Welcome, Developer!</p>
        <a href="<%= request.getContextPath() %>/developer/assigned_bugs">Assigned Bugs</a> |
        <a href="<%= request.getContextPath() %>/developer/resolve_bug">Resolve Bug</a>
        <%@ include file="../common/footer.jsp" %>