<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesión - Becarios</title>
    </head>
    <body>
        <h2>Inicio de Sesión</h2>
        
        <form action="${pageContext.request.contextPath}/login_becario" method="POST">
            <label for="curp">CURP:</label><br>
            <input type="text" id="curp" name="curp" placeholder="Ingresa tu CURP" required><br><br>

            <label for="password">Contraseña:</label><br>
            <input type="password" id="password" name="password" placeholder="Ingresa tu contraseña" required><br><br>

            <input type="submit" value="Iniciar Sesión">
        </form>
        
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <p style="color: red;"><%= error %></p>
        <%
            }
        %>
    </body>
</html>
