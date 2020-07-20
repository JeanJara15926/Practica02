<%-- 
    Document   : estudiante
    Created on : 20/07/2020, 05:03:39 PM
    Author     : Jean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estudiante</title>
        <link href="css/Estilosparatabla.css" rel="stylesheet" type="text/css"/>
        <%@page import="java.sql.*" %>
        <%@page import= "bd.ConectaBd" %>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement ps;
            ResultSet rs;
        %>
    </head>
    <body>
        <% try {
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                consulta = "Select * from estudiante";
                ps = cn.prepareStatement(consulta);
                rs = ps.executeQuery();

                %>
                    <table border="1">
                        <thead>
                            <tr>
                                <th colspan="8">
                                    Datos Estudiante
                                </th>
                            </tr>
                            <tr>
                                <th>#</th>
                                <th>Nombre</th>
                                <th>Apellidos</th>
                                <th>DNI</th>
                                <th>Código</th>
                                <th>Estado</th>
                                <th colspan="2">Acciones</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                    <%
                        int num = 1;
                while (rs.next()) {
                    %>
                    <td><%out.print(num);%></td>
                    <td><%out.print(rs.getString(2));%></td>
                    <td><%out.print(rs.getString(3));%></td>
                    <td><%out.print(rs.getString(4));%></td>
                    <td><%out.print(rs.getString(5));%></td>
                    <td><%out.print(rs.getString(6));%></td>
                        
                        
                    </tr>                    
                    <%
                        num++;
                    }
                    // Se cierra todas las conexiones
                    rs.close();
                    cn.close();
            } catch (Exception e) {
            }
        %>
                    </table>
    </body>
</html>
