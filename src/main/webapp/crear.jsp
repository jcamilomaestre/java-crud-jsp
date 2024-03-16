<%-- 
    Document   : crear
    Created on : 15/03/2024, 10:12:50 a. m.
    Author     : Anita
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <title>Crear Empleado</title>
    </head>
    <body>
        <div class="wrapper">
            <aside id="sidebar" class="expand">
                <div class="d-flex">
                    <button class="toggle-btn" type="button">
                        <i class="lni lni-grid-alt"></i>
                    </button>
                    <div class="sidebar-logo">
                        <a href="#">Foodies</a>
                    </div>
                </div>
                <ul class="sidebar-nav">
                    <li class="sidebar-item">
                        <a href="crear.jsp" class="sidebar-link">
                            <i class="lni lni-user"></i>
                            <span>Agregar Empeleados</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="index.jsp" class="sidebar-link">
                            <i class="lni lni-agenda"></i>
                            <span>Lista Empleados</span>
                        </a>
                    </li>
            </aside>
            <div class="main p-3">
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-sm">
                            <h1>Agregar Empleados</h1>
                            <form action="crear.jsp" method="post">
                                <div class="form-group form-input">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" required="required">
                                </div>
                                <div class="form-group form-input">
                                    <label for="direccion">Apellido</label>
                                    <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellidos" required="required">
                                </div>
                                <div class="form-group form-input">
                                    <label for="telefono">Correo</label>
                                    <input type="email" class="form-control" id="correo" name="correo" placeholder="correo" required="required">
                                </div>
                                <div class="form-group form-input">
                                    <label for="telefono">Contraseña</label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" required="required">
                                </div>
                                <div class="form-group form-input">
                                    <label for="telefono">Telefono</label>
                                    <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="Telefono" required="required">
                                </div>
                                <div class="form-group form-input">
                                    <label for="tipo_documento">Tipo de documento</label>
                                    <select class="form-select form-control" aria-label="seleccione tipo documento" id="tipo_documento" name="tipo_documento" required="required">
                                        <option selected>--Seleccione--</option>
                                        <option value="1">Tarjeta de Identidad</option>
                                        <option value="2">Cédula</option>
                                        <option value="3">Pasaporte</option>
                                    </select>
                                </div>
                                <div class="form-group form-input">
                                    <label for="telefono">Documento</label>
                                    <input type="number" class="form-control" id="documento" name="documento" placeholder="Documento" required="required">
                                </div>
                                <button type="submit" name="enviar" class="btn btn-primary form-input">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
            <%
                if (request.getParameter("enviar") != null) {
                    String nombre = request.getParameter("nombre");
                    String apellido = request.getParameter("apellido");
                    String correo = request.getParameter("correo");
                    String password = request.getParameter("password");
                    String telefono = request.getParameter("telefono");
                    int tipoDocumento = Integer.parseInt(request.getParameter("tipo_documento"));
                    String documento = request.getParameter("documento");
                    try {
                        Connection con = null;
                        Statement st = null;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodies?serverTimezone=UTC", "root", "1234");
                        st = con.createStatement();
                        st.executeUpdate("insert into empleado(nombre, apellido, correo, contraseña, telefono, identificacion, tipo_documento_id_tipo_documento) values('" + nombre + "', '" + apellido + "', '" + correo + "', '" + password + "', '" + telefono + "', '" + documento + "', '" + tipoDocumento + "' );");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    } catch (Exception e) {
                        out.print(e.getMessage());
                    }
                }
            %>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
    <script src="script.js"></script>
</html>
