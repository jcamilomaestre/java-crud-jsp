<%-- 
    Document   : borrar.jsp
    Created on : 15/03/2024, 12:04:28 p. m.
    Author     : Anita
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodies?serverTimezone=UTC", "root", "1234");
                st = con.createStatement();
                st.executeUpdate("delete FROM empleado where id_empleado='"+request.getParameter("id") +"';");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception e) {
                out.print(e);
            }
        %>

    </body>
</html>