<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inicio - Sistema Becario</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 300px;
            }
            h1 {
                margin-bottom: 20px;
                color: #333;
            }
            a {
                display: block;
                margin: 10px 0;
                padding: 10px 20px;
                text-decoration: none;
                color: white;
                background-color: #007BFF;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }
            a:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Sistema Becario</h1>
            <a href="${pageContext.request.contextPath}/jsp/registro.jsp">Registrar Becario</a>
            <a href="${pageContext.request.contextPath}/jsp/login.jsp">Login Becario</a>
        </div>
    </body>
</html>
