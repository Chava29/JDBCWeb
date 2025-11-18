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
        <title>Registro del Producto</title>
    </head>
    <body>
		<h1> Registro de producto en JSP :) </h1>
        <%
            Integer cod;
			String nom;
			String mar;
			double preci;
			
			cod = Integer.parseInt(request.getParameter("codigo"));
			nom = request.getParameter("nombre");
			mar = request.getParameter("marca");
			preci = Double.parseDouble(request.getParameter("precio"));
			
			System.out.println(cod);
			System.out.println(nom);
			System.out.println(mar);
			System.out.println(preci);
			
			Connection conecta;
			PreparedStatement st;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba", "root", "n0m3l0");
			
			st = conecta.prepareStatement("INSERT INTO productos (codigo, nombre, marca, precio) VALUES (?,?,?,?)");
			st.setInt(1, cod);
			st.setString(2, nom);
			st.setString(3, mar);
			st.setDouble(4, preci);
			
			st.executeUpdate();
			out.println("Todo se ha registrado correctamente :D");
		%>
		<script>
			window.location.href = "listaProducto.jsp";
		</script>
    </body>
</html>
