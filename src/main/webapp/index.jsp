<%-- 
    Document   : index
    Created on : 14/03/2024, 10:01:03 a. m.
    Author     : Anita
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <title>Lista Empleado</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
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
                <div class="text-center">
                    <div class="container mt-5">
                        <div class="row">
                            <div class="col-sm">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col" colspan="4" class="text-center"><h3>Empleados</h3></th>
                                            <th scope="col" >
                                                <a href="crear.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Agregar empleado</a>
                                            </th>

                                        </tr>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Nombres</th>
                                            <th scope="col">Apellidos</th>
                                            <th scope="col">Correo</th>
                                            <th scope="col">Telefono</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodies?serverTimezone=UTC", "root", "1234");
                                                st = con.createStatement();
                                                rs = st.executeQuery("SELECT * FROM empleado");

                                                while (rs.next()) {
                                        %>
                                    <td><%= rs.getInt(1)%></td>
                                    <td><%= rs.getString(2)%></td>
                                    <td><%= rs.getString(3)%></td>
                                    <td><%= rs.getString(4)%></td>
                                    <td><%= rs.getString(6)%></td>
                                    <td>
                                        <a href="editar.jsp?id=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>&apellido=<%= rs.getString(3)%>&correo=<%= rs.getString(4)%>&telefono=<%= rs.getString(6)%>&documento=<%= rs.getString(7)%>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                        <a href="borrar.jsp?id=<%= rs.getString(1)%>" class="ml-1"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                    </td>
                                    </tr> 
                                    <%
                                            }
                                        } catch (Exception e) {
                                            out.println("Error");
                                            out.println(e.getMessage());
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="script.js"></script>
    </body>
</html>
