<%-- 
    Document   : registroProducto
    Created on : 6 nov. 2025, 07:56:57
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="styles.css" type="text/css">
        <title>Lista de productos</title>
    </head>
    <body>
		<h1> Lista de productos </h1>
        
		<table class="tabla-bonita">
			<tr>
				<th>Código</th> <th>Nombre</th> <th>Marca</th> <th>Precio</th> 
			</tr>
			<%
				Connection conecta;
				PreparedStatement st;
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba", "root", "n0m3l0");
				
				st = conecta.prepareStatement("SELECT * FROM productos");
				ResultSet rs = st.executeQuery();
			%>
			<%
				while(rs.next()){
			%>
			<tr>
				<td> <%=rs.getInt("codigo")%> </td>
				<td> <%=rs.getString("nombre")%> </td>
				<td> <%=rs.getString("marca")%> </td>
				<td> <%=rs.getDouble("precio")%> </td>
			</tr>
			<%
			}
			out.println("Los elementos se han traído con éxito de la base de datos y se despliegan a continuación:");
			%>
		</table>
    </body>
</html>
