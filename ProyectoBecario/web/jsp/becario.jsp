<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, configuration.ConnectionBD" %>
<%@ page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Información del Becario</title>
        <style>
            .button {
                display: inline-block;
                padding: 10px 20px;
                font-size: 16px;
                margin: 10px;
                cursor: pointer;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                text-decoration: none;
            }
            .button:hover {
                background-color: #45a049;
            }
            .image {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <h1>Bienvenido Becario!</h1>

        <%
            if (session == null || session.getAttribute("curp") == null) {
                response.sendRedirect("/ProyectoBecario/jsp/login.jsp");
            }
            String curp = null;

            if (session != null) {
                curp = (String) session.getAttribute("curp");
            }

            if (curp != null) {
                ConnectionBD conexion = new ConnectionBD();
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    conn = conexion.getConnectionBD();
                    String sql = "SELECT curp, nombre, apellidoPaterno, apellidoMaterno, genero, fecha_nac, foto FROM becario WHERE curp = ?";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, curp);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        String nombre = rs.getString("nombre");
                        String apellidoPaterno = rs.getString("apellidoPaterno");
                        String apellidoMaterno = rs.getString("apellidoMaterno");
                        String genero = rs.getString("genero");
                        String fechaNac = rs.getString("fecha_nac");
                        String foto = rs.getString("foto");

                        out.println("<p>Hola, " + nombre + " " + apellidoPaterno + " " + apellidoMaterno + "!</p>");
                        out.println("<p>Género: " + genero + "</p>");
                        out.println("<p>Fecha de Nacimiento: " + fechaNac + "</p>");
                        out.println("<p>CURP: " + curp + "</p>");

                        if (foto != null && !foto.isEmpty()) {
                            out.println("<img src='" + request.getContextPath() + "/" + foto + "' alt='Imagen del becario' class='image' />");
                        } else {
                            out.println("<img src='images/default-avatar.png' alt='Imagen del becario' class='image' />");
                        }

                        out.println("<form action='" + request.getContextPath() + "/upload_image_servlet' method='POST' enctype='multipart/form-data'>");
                        out.println("<input type='hidden' name='curp' value='" + curp + "'>");
                        out.println("<input type='file' name='image' accept='image/*'>");
                        out.println("<button type='submit' class='button'>Actualizar Foto</button>");
                        out.println("</form>");

                        out.println("<a href='" + request.getContextPath() + "/jsp/vivienda.jsp?curp=" + curp + "' class='button'>Agregar Vivienda</a>");
                    } else {
                        out.println("<p>No se encontró información del becario.</p>");
                    }
                } catch (SQLException e) {
                    out.println("<p>Error al obtener la información del becario: " + e.getMessage() + "</p>");
                } finally {
                    if (rs != null) {
                        rs.close();
                    }
                    if (ps != null) {
                        ps.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                }
            } else {
                out.println("<p>No se ha iniciado sesión. Por favor, inicia sesión.</p>");
                response.sendRedirect("login.jsp");
            }
        %>

        <a href="${pageContext.request.contextPath}/jsp/vermas.jsp?curp=<%= curp %>" class="button">Ver Más</a>

    </body>
</html>
