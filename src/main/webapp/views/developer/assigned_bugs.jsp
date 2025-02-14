<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.bugtriage.dao.BugDAO" %>
        <%@ page import="com.bugtriage.models.Bug" %>
            <%@ page import="java.util.List" %>

                <%@ include file="../common/header.jsp" %>

                    <h1>Assigned Bugs</h1>

                    <% BugDAO bugDAO=new BugDAO(); List<Bug> assignedBugs = bugDAO.getAssignedBugs();
                        request.setAttribute("assignedBugs", assignedBugs);
                        %>

                        <table border="1">
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Priority</th>
                                <th>Status</th>
                                <th>Assigned To</th>
                            </tr>
                            <% for (Bug bug : assignedBugs) { %>
                                <tr>
                                    <td>
                                        <%= bug.getId() %>
                                    </td>
                                    <td>
                                        <%= bug.getTitle() %>
                                    </td>
                                    <td>
                                        <%= bug.getPriority() %>
                                    </td>
                                    <td>
                                        <%= bug.getStatus() %>
                                    </td>
                                    <td>
                                        <%= bug.getAssignedTo() %>
                                    </td>
                                </tr>
                                <% } %>
                        </table>

                        <%@ include file="../common/footer.jsp" %>