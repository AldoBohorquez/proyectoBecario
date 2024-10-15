<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Vivienda</title>
    </head>
    <body>
        <h1>Registrar Vivienda</h1>
        
        <%
            String curp = request.getParameter("curp");
        %>

        <form action="${pageContext.request.contextPath}/registro_vivienda" method="POST">
            <label for="calle">Calle:</label>
            <input type="text" id="calle" name="calle" required><br><br>

            <label for="colonia">Colonia:</label>
            <input type="text" id="colonia" name="colonia" required><br><br>

            <label for="numero">Número:</label>
            <input type="text" id="numero" name="numero" required><br><br>

            <label for="cp">Código Postal (CP):</label>
            <input type="text" id="cp" name="cp" maxlength="5" required><br><br>

            <label for="curp">CURP del Becario:</label>
            <input type="text" id="curp" name="curp" value="<%= curp != null ? curp : "" %>" readonly><br><br>

            <input type="submit" value="Registrar Vivienda">
        </form>
    </body>
</html>
