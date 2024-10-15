<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, configuration.ConnectionBD" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Más Información</title>
        
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
        <h1>Información Completa del Becario</h1>

        <%
            String curp = request.getParameter("curp");

            if (curp != null && !curp.isEmpty()) {
                ConnectionBD conexion = new ConnectionBD();
                Connection conn = null;
                PreparedStatement psBecario = null;
                PreparedStatement psVivienda = null;
                ResultSet rsBecario = null;
                ResultSet rsVivienda = null;

                try {
                    conn = conexion.getConnectionBD();

                    String sqlBecario = "SELECT curp, nombre, apellidoPaterno, apellidoMaterno, genero, fecha_nac FROM becario WHERE curp = ?";
                    psBecario = conn.prepareStatement(sqlBecario);
                    psBecario.setString(1, curp);
                    rsBecario = psBecario.executeQuery();

                    if (rsBecario.next()) {
                        String nombre = rsBecario.getString("nombre");
                        String apellidoPaterno = rsBecario.getString("apellidoPaterno");
                        String apellidoMaterno = rsBecario.getString("apellidoMaterno");
                        String genero = rsBecario.getString("genero");
                        String fechaNac = rsBecario.getString("fecha_nac");

                        out.println("<h2>Datos del Becario</h2>");
                        out.println("<p>Nombre: " + nombre + " " + apellidoPaterno + " " + apellidoMaterno + "</p>");
                        out.println("<p>Género: " + genero + "</p>");
                        out.println("<p>Fecha de Nacimiento: " + fechaNac + "</p>");
                        out.println("<p>CURP: " + curp + "</p>");

                        String sqlVivienda = "SELECT calle, colonia, numero, cp FROM vivienda WHERE curp = ?";
                        psVivienda = conn.prepareStatement(sqlVivienda);
                        psVivienda.setString(1, curp);
                        rsVivienda = psVivienda.executeQuery();

                        if (rsVivienda.next()) {
                            String calle = rsVivienda.getString("calle");
                            String colonia = rsVivienda.getString("colonia");
                            String numero = rsVivienda.getString("numero");
                            String cp = rsVivienda.getString("cp");

                            out.println("<h2>Datos de la Vivienda</h2>");
                            out.println("<p>Calle: " + calle + "</p>");
                            out.println("<p>Colonia: " + colonia + "</p>");
                            out.println("<p>Número: " + numero + "</p>");
                            out.println("<p>Código Postal: " + cp + "</p>");
                        } else {
                            out.println("<h2>Datos de la Vivienda</h2>");
                            out.println("<p>Falta por agregar la vivienda.</p>");
                        }
                    } else {
                        out.println("<p>No se encontró información del becario.</p>");
                    }

                } catch (SQLException e) {
                    out.println("<p>Error al obtener la información: " + e.getMessage() + "</p>");
                } finally {
                    if (rsBecario != null) {
                        rsBecario.close();
                    }
                    if (psBecario != null) {
                        psBecario.close();
                    }
                    if (rsVivienda != null) {
                        rsVivienda.close();
                    }
                    if (psVivienda != null) {
                        psVivienda.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                }
            } else {
                out.println("<p>CURP no proporcionada.</p>");
            }
        %>
        <a href="${pageContext.request.contextPath}/jsp/becario.jsp" class="button">Regresar</a>
    </body>
</html>
