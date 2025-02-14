<%@ page import="com.bugtriage.dao.PerformanceDAO" %>
    <%@ page import="com.bugtriage.models.Performance" %>
        <%@ page import="java.util.List" %>

            <% PerformanceDAO metricsDAO=new PerformanceDAO(); List<Performance> metricsList =
                metricsDAO.getPerformanceMetrics();
                request.setAttribute("metricsList", metricsList);
                %>

                <h1>Performance Metrics</h1>
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Metric</th>
                        <th>Value</th>
                    </tr>
                    <% for (Performance metric : metricsList) { %>
                        <tr>
                            <td>
                                <%= metric.getId() %>
                            </td>
                            <td>
                                <%= metric.getMetric() %>
                            </td>
                            <td>
                                <%= metric.getValue() %>
                            </td>
                        </tr>
                        <% } %>
                </table>