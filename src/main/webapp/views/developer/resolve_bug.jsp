<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ include file="../common/header.jsp" %>
        <h1>Resolve Bug</h1>
        <!-- Form for resolving a bug -->
        <form action="<%= request.getContextPath() %>/bug/manage" method="post">
            <label for="bugId">Bug ID:</label>
            <input type="text" name="bugId" id="bugId" required />
            <label for="status">Status:</label>
            <select name="status" id="status">
                <option value="resolved">Resolved</option>
                <option value="in progress">In Progress</option>
            </select>
            <button type="submit">Update Bug</button>
        </form>
        <%@ include file="../common/footer.jsp" %>