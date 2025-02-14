<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>
                <c:out value="${pageTitle != null ? pageTitle : 'Bug Triage System'}" />
            </title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
        </head>

        <body>
            <header>
                <h1>Bug Triage System</h1>
                <nav>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <c:choose>
                            <c:when test="${sessionScope.user != null}">
                                <!-- Optionally add role-based links here -->
                                <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                                <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>
            </header>