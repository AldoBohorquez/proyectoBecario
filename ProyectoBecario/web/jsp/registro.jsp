<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ALTA BECARIO</title>
    </head>
    <body>
        <h1>ALTA BECARIO</h1>

        <form action="${pageContext.request.contextPath}/register_becario" method="post">
            <label for="curp">CURP:</label><br>
            <input type="text" id="curp" name="curp" required><br><br>

            <label for="apellidoPaterno">Apellido Paterno:</label><br>
            <input type="text" id="apellidoPaterno" name="apellidoPaterno" required><br><br>

            <label for="apellidoMaterno">Apellido Materno:</label><br>
            <input type="text" id="apellidoMaterno" name="apellidoMaterno" required><br><br>

            <label for="nombre">Nombre:</label><br>
            <input type="text" id="nombre" name="nombre" required><br><br>

            <label for="genero">Género:</label><br>
            <input type="radio" id="masculino" name="genero" value="Masculino" required>
            <label for="masculino">Masculino</label><br>
            <input type="radio" id="femenino" name="genero" value="Femenino" required>
            <label for="femenino">Femenino</label><br><br>

            <label for="password">Contraseña:</label><br>
            <input type="password" id="password" name="password" required><br><br>

            <button type="submit">Registrar</button>
        </form>
    </body>
</html>
