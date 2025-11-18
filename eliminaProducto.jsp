<%-- 
    Document   : registroProducto
    Created on : 6 nov. 2025, 07:56:57
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="frames_estilos.css" type="text/css">
        <title>Eliminar producto</title>
    </head>
    <body>
		<h1> Eliminación de producto en JSP :) </h1>
        <%
			String cod;
			cod = request.getParameter("codigo");
			
			if(cod!=null) {
				Connection conecta;
				PreparedStatement st;
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba", "root", "n0m3l0");
				
				st = conecta.prepareStatement("DELETE FROM productos WHERE codigo=?");
				st.setString(1, cod);
				
				st.executeUpdate();
				out.println("El elemento se ha eliminado con éxito.");
			}
		%>
    </body>
</html>
