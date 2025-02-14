<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ include file="../common/header.jsp" %>
            <h1>Report a Bug</h1>
            <!-- Form for reporting a bug -->
            <form action="<%= request.getContextPath() %>/bug/manage" method="post">
                <label for="title">Title:</label>
                <input type="text" name="title" id="title" required />

                <label for="description">Description:</label>
                <textarea name="description" id="description" required></textarea>

                <label for="priority">Priority:</label>
                <select name="priority" id="priority">
                    <option value="Low">Low</option>
                    <option value="Medium">Medium</option>
                    <option value="High">High</option>
                </select>

                <label for="assignedTo">Assign To:</label>
                <select name="assignedTo" id="assignedTo">
                    <option value="">-- Select Developer --</option>
                    <% List<String> developers = (List<String>) request.getAttribute("developers");
                            if (developers != null) {
                            for (String dev : developers) {
                            %>
                            <option value="<%= dev %>">
                                <%= dev %>
                            </option>
                            <% } } %>
                </select>

                <button type="submit">Submit Bug</button>
            </form>

            <%@ include file="../common/footer.jsp" %>