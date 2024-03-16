<%-- 
    Document   : editar
    Created on : 15/03/2024, 11:50:27 a. m.
    Author     : Anita
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Editar empleado</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String correo = request.getParameter("correo");
            String telefono = request.getParameter("telefono");
            String documento = request.getParameter("documento");
            //int tipoDocumento = Integer.parseInt(request.getParameter("tipo_documento"));
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form action="editar.jsp" method="get">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" value="<%= nombre%>" name="nombre" placeholder="Nombre" required="required">
                        </div>
                        <div class="form-group">
                            <label for="direccion">Direccion</label>
                            <input type="text" class="form-control" id="apellido" value="<%= apellido%>"  name="apellido" placeholder="Apellido" required="required">
                        </div>
                        <div class="form-group">
                            <label for="direccion">Correo</label>
                            <input type="email" class="form-control" id="correo" value="<%= correo%>"  name="correo" placeholder="Correo" required="required">
                        </div>
                        <div class="form-group">
                            <label for="telefono">Telefono</label>
                            <input type="text" class="form-control" id="telefono"  value="<%= telefono%>"  name="telefono" placeholder="Telefono" required="required">
                        </div>
                        <div class="form-group">
                            <label for="tipo_documento">Tipo de documento</label>
                            <select class="form-select form-control" aria-label="seleccione tipo documento" id="tipo_documento" name="tipo_documento" required="required">
                                <option selected>--Seleccione--</option>
                                <option value="1">Tarjeta de Identidad</option>
                                <option value="2">Cédula</option>
                                <option value="3">Pasaporte</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="telefono">Documento</label>
                            <input type="number" class="form-control" id="documento" value="<%= documento%>" name="documento" placeholder="Documento" required="required">
                        </div>
                        <a href="index.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                        <input type="hidden" name="id" value="<%= id%>" >
                    </form>

                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                try {
                    Connection con = null;
                    Statement st = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodies?serverTimezone=UTC", "root", "1234");
                    st = con.createStatement();
                    st.executeUpdate("update empleado set nombre='" + nombre + "',apellido='" + apellido + "',correo='" + correo + "',telefono='" + telefono + "' where id_empleado='"+id+"';");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>