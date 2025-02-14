<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ include file="header.jsp" %>
        <h1>Login</h1>
        <form action="<%= request.getContextPath() %>/login" method="post">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required />

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required />

            <button type="submit">Login</button>
        </form>
        <% if(request.getAttribute("error") !=null) { %>
            <p style="color:red;">
                <%= request.getAttribute("error") %>
            </p>
            <% } %>
                <p>Don't have an account? <a href="<%= request.getContextPath() %>/register">Register Here</a></p>
                <%@ include file="footer.jsp" %>