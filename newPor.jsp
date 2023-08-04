<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String nombrePor = request.getParameter("nombrePor");
		String valPor = request.getParameter("valPor");
		String nombreMate = request.getParameter("nombreMate");
	%>
	
		<%
	try {
	    //Conexion a la base de datos
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/calcuporcentaje","root","");
	    
	    // The "mat_id" column is excluded from the INSERT statement since it's auto-incremented
	    int mat_id = (int) session.getAttribute("currentIdMateria");
	    String insertarsql = "INSERT INTO porcentajes(por_nombre,por_porcentaje,por_mate_id,por_obtenido_porcentaje) VALUES (?, ?, ?,?)";
	    PreparedStatement pstmt = dbconect.prepareStatement(insertarsql, Statement.RETURN_GENERATED_KEYS);
	    pstmt.setString(1, nombrePor);
	    pstmt.setString(2, valPor);
	    pstmt.setInt(3, mat_id);
	    pstmt.setFloat(4, 0);
	    // Execute the INSERT statement
	    pstmt.executeUpdate();

	    // Close the resources
	    pstmt.close();
	    dbconect.close();

	    response.sendRedirect("materia.jsp");
	} catch (Exception e) {
	    // Muestra mensaje de error
	    e.printStackTrace();
	}
	%>
	
</body>
</html>