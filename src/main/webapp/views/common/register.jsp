<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ include file="header.jsp" %>
        <h1>Register</h1>
        <form action="<%= request.getContextPath() %>/register" method="post">
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" required />

            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required />

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required />

            <label for="role">Role:</label>
            <select name="role" id="role">
                <option value="tester">Tester</option>
                <option value="developer">Developer</option>
                <option value="admin">Admin</option>
            </select>

            <button type="submit">Register</button>
        </form>
        <% if(request.getAttribute("error") !=null) { %>
            <p style="color:red;">
                <%= request.getAttribute("error") %>
            </p>
            <% } %>
                <p>Already have an account? <a href="<%= request.getContextPath() %>/login">Login Here</a></p>
                <%@ include file="footer.jsp" %>