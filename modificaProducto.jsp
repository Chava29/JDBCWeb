
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="styles.css" type="text/css">
        <title>Modificar producto</title>
    </head>
    <body>
		<h1> Modificación de producto JSP. </h1>
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
			
			st = conecta.prepareStatement("UPDATE productos SET nombre=?, marca=?, precio=? WHERE codigo=?");
			st.setString(1, nom);
			st.setString(2, mar);
			st.setDouble(3, preci);
			st.setInt(4, cod);
			
			st.executeUpdate();
			out.println("Todo se ha modificado correctamente :D");
		%>
    </body>
</html>
